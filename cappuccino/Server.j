@import <Foundation/CPObject.j>
@import <Foundation/CPNotificationCenter.j>

ServerStoppedStatus     = "ServerStoppedStatus";
ServerStartingStatus    = "ServerStartingStatus";
ServerStartedStatus     = "ServerStartedStatus";
ServerStoppingStatus    = "ServerStoppingStatus";

ServerConsoleOutputNotification = "ServerConsoleOutputNotification";

@implementation Server : CPObject
{
    JSObject    process;
    CPString    status          @accessors(readonly);
    id          startLineRegex;
}

- (id)initWithArgs:(CPArray)args withEnvironment:(JSObject)env withStartLine:(CPString)regex
{
    self = [super init];
    if(self)
    {
        CPLog.debug("Creating Process:");
        CPLog.debug(args);
        process = Titanium.Process.createProcess({
            'args': args,
            'env': env
        });
        startLineRegex = new RegExp(regex);
        status = ServerStoppedStatus
        
        process.setOnReadLine(function(line)
        {
            CPLog(line);
            [[CPNotificationCenter defaultCenter]
                postNotificationName:ServerConsoleOutputNotification
                object:self
                userInfo:[CPDictionary dictionaryWithJSObject:{
                    line:line
                }]];
                
            if(status != ServerStartedStatus)
            {
                if(startLineRegex.test(line))
                {
                    CPLog.debug('About to change the server status to runnin!')
                    [self willChangeValueForKey: "status"];
                    status = ServerStartedStatus
                    [self didChangeValueForKey: "status"];
                    CPLog.debug("Server Status = " + status);
                    
                    [[CPNotificationCenter defaultCenter]
                        postNotificationName:ServerStartedStatus
                        object:self];
                }
            }
        });
        
        process.setOnExit(function() {
            [self willChangeValueForKey: "status"];
            status = ServerStoppedStatus;
            [self didChangeValueForKey: "status"];
            [[CPNotificationCenter defaultCenter]
                postNotificationName:ServerStoppedStatus
                object:self];
        });
        
    }
    return self;
}

- (id)initWithArgs(CPArray)args withEnvironment:(JSObject)env
{
    return [self initWithArgs:args withEnvironment:env withStartLine:"^.*$"];
}

- (id)initWithArgs:(CPArray)args withStartLine:(CPString)regex
{
    return [self initWithArgs:args withEnvironment:{} withStartLine:regex];
}

- (id)initWithArgs:(CPArray)args
{
    return [self initWithArgs:args withStartLine:"^.*$"];
}

- (void)start
{   
    if(status === ServerStartedStatus || status === ServerStartingStatus)
        return;
    
    process.launch();
    [self willChangeValueForKey: "status"]
    status = ServerStartingStatus;
    [self didChangeValueForKey: "status"];
    [[CPNotificationCenter defaultCenter]
        postNotificationName:ServerStartingStatus
        object:self];
    
}

- (void)stop
{
    if(status === ServerStoppedStatus || status === ServerStoppingStatus)
        return;
    
    process.terminate();
    
    [self willChangeValueForKey: "status"];
    status = ServerStoppingStatus;
    [self didChangeValueForKey: "status"];
    [[CPNotificationCenter defaultCenter]
        postNotificationName:ServerStoppingStatus
        object:self];
    
}

@end