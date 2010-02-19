@import <Foundation/CPObject.j>

ServerStoppedStatus     = "ServerStoppedStatus";
ServerStartingStatus    = "ServerStartingStatus";
ServerStartedStatus     = "ServerStartedStatus";
ServerStoppingStatus    = "ServerStoppingStatus";

@implementation Server : CPObject
{
    JSObject    process;
    CPString    status          @accessors(readonly);
    id          startLineRegex;
}

- (id)initWithArgs:(CPArray)args withStartLine:(CPString)regex
{
    self = [super init];
    if(self)
    {
        process = Titanium.Process.createProcess({
            'args': args
        });
        startLineRegex = new RegExp(regex);
        status = ServerStoppedStatus
        
        process.setOnReadLine(function(line)
        {
            Titanium.API.debug(line);
            if(status != ServerStartedStatus)
            {
                if(startLineRegex.test(line))
                {
                    [self willChangeValueForKey: "status"];
                    status = ServerStartedStatus
                    [self didChangeValueForKey: "status"];
                }
            }
        });
        
        process.setOnExit(function() {
            [self willChangeValueForKey: "status"];
            status = ServerStoppedStatus;
            [self didChangeValueForKey: "status"];
        });
        
    }
    return self;
}

- (id)initWithArgs:(CPArray)args
{
    return [self initWithArgs:args withStartLine:"^.*$"]
}

- (void)start
{   
    if(status === ServerStartedStatus || status === ServerStartingStatus)
        return;
    
    process.launch();
    [self willChangeValueForKey: "status"]
    status = ServerStartingStatus;
    [self didChangeValueForKey: "status"];
    
}

- (void)stop
{
    if(status === ServerStoppedStatus || status === ServerStoppingStatus)
        return;
    
    process.terminate();
    
    [self willChangeValueForKey: "status"];
    status = ServerStoppingStatus;
    [self didChangeValueForKey: "status"];
    
    
}

@end