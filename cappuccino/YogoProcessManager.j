@import <Foundation/CPObject.j>
@import <Foundation/CPNotificationCenter.j>
@import "Server.j"

// YogoDatabaseSeededNotification = "YogoDatabaseSeededNotification";
YogoProcessesStartedNotification = "YogoProcessesStartedNotification";
YogoProcessManagerProgressNotification = "YogoProcessManagerProgressNotification";

var ProgressValue = {
    'persvr_started': 33,
    // 'db_seeded': 66,
    'rails_started': 100
};

var ProgressMin = 0;
var ProgressMax = 100;

@implementation YogoProcessManager : CPObject
{
    id          railsServer         @accessors(readonly);
    CPString    railsPort           @accessors(readonly);
    id          persvrServer        @accessors(readonly);
    CPString    persvrPort          @accessors(readonly);
    // boolean     databaseSeeded      @accessors(readonly);
    double      progress            @accessors;
    CPString    message             @accessors;
}

- (id)init
{
    self = [super init];
    if(self)
    {
        progress = 0;
        // databaseSeeded = false;
    
        CPLog("Finding open ports...");
        persvrPort = [self availablePort];
        CPLog("Persevere port = " + persvrPort);
    
        var persvrCmd = [ Titanium.App.appURLToPath("app://persevere/bin/" + (Titanium.getPlatform() == 'win32' ? "persvr.bat" : "persvr") )];
        persvrCmd.push("-r", Titanium.App.appURLToPath("app://persevere"));
        persvrCmd.push("-p", persvrPort);
        CPLog("persvrCmd = " + persvrCmd);
        persvrServer = [[Server alloc] initWithArgs:persvrCmd 
                                       withStartLine:"Started SelectChannelConnector@0.0.0.0:([0-9]+)"];
    
    
        railsPort = [self availablePort];
        CPLog("Rails port = " + railsPort);
    
    
        var railsCmd = [];
        railsCmd.push('java', '-jar', Titanium.App.appURLToPath("app://jruby-complete-1.4.0.jar"));
        railsCmd.push(Titanium.App.appURLToPath("app://yogo/script/server"), '-e', 'production');
        railsCmd.push('-p', railsPort);
        CPLog("railsCmd = " + railsCmd);
        railsServer = [[Server alloc] initWithArgs:railsCmd
                                      withEnvironment:{
                                          'PERSVR_PORT':persvrPort
                                      }
                                      withStartLine:"WEBrick::HTTPServer#start: pid=([0-9]+) port=([0-9]+)" ];
    
        [self _registerNotifications];
    }
    return self;
}

- (void)startAll
{
    [persvrServer start]; // Seeding and railsServer started when 
}

- (void)stopAll
{
    [railsServer stop];
    [persvrServer stop];
}

- (void)setProgress:(double)value
{
    [self willChangeValueForKey:"progress"];
    
    if(value > 0 && value < 1)
        progress = ProgressMax * value;
    else if(value > ProgressMax)
        progress = ProgressMax;
    else if(value < ProgressMin)
        progress = ProgressMin
    else
        progress = value;
    
    [self didChangeValueForKey:"progress"];

    [[CPNotificationCenter defaultCenter]
       postNotificationName:YogoProcessManagerProgressNotification
       object:self
       userInfo:[CPDictionary dictionaryWithJSObject:{
           progress:progress,
           message: message
       }]];
}


- (void)incrementProgress:(double)incr
{
    [self setProgress:([self progress] + incr)];
}

- (void)incrementProgress
{
    [self setProgress:([self progress] + 1)];
}

- (void)setMessage:(CPString)msg
{
    [self willChangeValueForKey:"message"];
    message = msg;
    [self didChangeValueForKey:"message"];
    
    [[CPNotificationCenter defaultCenter]
       postNotificationName:YogoProcessManagerProgressNotification
       object:self
       userInfo:[CPDictionary dictionaryWithJSObject:{
           progress:progress,
           message: message
       }]];
}

@end

@implementation YogoProcessManager (NotificationHandling)

- (void)_registerNotifications
{
    [[CPNotificationCenter defaultCenter]
        addObserver:self
        selector:@selector(railsServerStarted:)
        name:ServerStartedStatus
        object:railsServer];
    
    [[CPNotificationCenter defaultCenter]
        addObserver:self
        selector:@selector(railsServerStarting:)
        name:ServerStartingStatus
        object:railsServer];
    
    [[CPNotificationCenter defaultCenter]
        addObserver:self
        selector:@selector(persvrServerStarting:)
        name:ServerStartingStatus
        object:persvrServer];
        
    [[CPNotificationCenter defaultCenter]
        addObserver:self
        selector:@selector(persvrServerStarted:)
        name:ServerStartedStatus
        object:persvrServer];
        
    // [[CPNotificationCenter defaultCenter]
    //     addObserver:self
    //     selector:@selector(databaseSeedFinished:)
    //     name:YogoDatabaseSeededNotification
    //     object:self];
}

- (void)persvrServerStarting:(CPNotification)notification
{
    [self incrementProgress];
    [self setMessage:"Starting Database..."];
    [self incrementProgress];
}

- (void)persvrServerStarted:(CPNotification)notification
{
    [self setProgress:ProgressValue['persvr_started']];
    [self setMessage:"Database Started"];
    
    // [self sDatabase];
    [railsServer start];
}

// - (void)databaseSeedFinished:(CPNotification)notification
// {
//     [self setProgress:ProgressValue['db_seeded']];
//     [self setMessage:"Data Loaded"];
//     
//     [railsServer start];
// }

- (void)railsServerStarting:(CPNotification)notification
{
    [self incrementProgress:5];
    [self setMessage:"Yogo Starting..."];
    [self incrementProgress:5];
}

- (void)railsServerStarted:(CPNotification)notification
{
    // Rails Server Started
    CPLog.debug('Recieved the ServerStartedStatus notification from railsServer!');
    
    [self setProgress:ProgressValue['rails_started']];
    [self setMessage:"Startup Complete"];
        
    [[CPNotificationCenter defaultCenter]
        postNotificationName:YogoProcessesStartedNotification
        object:self];
}

@end

@implementation YogoProcessManager (Utilities)

- (CPString)availablePort
{
    var min     = 49152,
        max     = 65535;
    
    var randomPort = function()
    {
        return Math.floor(Math.random() * (max-min+1)) + min;
    }
    
    var foundPort = false;
    var sock = nil;
    var port = nil;
    while(!foundPort)
    {
        port = randomPort();
        sock = Titanium.Network.createTCPSocket("127.0.0.1", port);
        sock.connect(); // If we successfully connect, then the port is already in use.
        if(sock.isClosed())
            foundPort = true;
        sock.close();
    }
    return port.toString();
}

// - (void)seedDatabase
// {
//     [self incrementProgress:3];
//     var indicateDatabaseIsSeeded = function()
//     {
//         [self willChangeValueForKey:"databaseSeeded"];
//         databaseSeeded = true;
//         [self didChangeValueForKey:"databaseSeeded"];
//         [[CPNotificationCenter defaultCenter]
//                 postNotificationName:YogoDatabaseSeededNotification
//                 object:self];
//     };
//     
//     CPLog("Checking to see if yogo db needs to be seeded...")
//     [self setMessage:"Checking Database"];
//     [self incrementProgress];
//     var TFile = Titanium.Filesystem;
//     var yogoDbSeeded = TFile.getFile(TFile.getResourcesDirectory(), 'yogo_db_seeded');
//     if(!yogoDbSeeded.exists())
//     {
//         [self incrementProgress];
//         var dbSeedCmd = [];
//         dbSeedCmd.push('java', '-jar', Titanium.App.appURLToPath("app://jruby-complete-1.4.0.jar"));
//         dbSeedCmd.push('-S', Titanium.App.appURLToPath("app://")'rake', '-f', Titanium.App.appURLToPath("app://yogo/Rakefile"));
//         dbSeedCmd.push('db:seed');
// //        dbSeedCmd.push('--trace');
// 
//         var dbSeedEnv = {};
//         dbSeedEnv['RAILS_ENV'] = 'production';
//         dbSeedEnv['PERSVR_PORT'] = persvrPort;
//         
//         var dbSeed = Titanium.Process.createProcess({args:dbSeedCmd, env:dbSeedEnv});
//         
//         dbSeed.setOnReadLine(function(line){
//             [self setMessage:line]
//             CPLog(line);
//         });
//         
//         [self setMessage:"Command: "+dbSeed.toString()];
//         [self setMessage:"Environment: "+Titanium.JSON.stringify(dbSeed.getEnvironment())];
//         
//         [self incrementProgress];
//         
//         dbSeed.setOnExit(function(){
//             if(dbSeed.getExitCode() === 0)
//             {
//                 [self setMessage:"finished seed"]
//                 CPLog("Finished seeding yogo db!")
//                 yogoDbSeeded.write(Date.now());
//                 indicateDatabaseIsSeeded();
//             }
//             else
//             {
//                 [self setMessage:"seed failed! exit code = " + dbSeed.getExitCode()]
//                 CPLog.fatal("Seeding the Database Failed!");
//             }
//         });
//         CPLog("Seeding yogo db!");
//         [self setMessage:"Loading Initial Data..."];
//         [self incrementProgress];
//         dbSeed.launch();
//         [self incrementProgress];
//     }
//     else
//     {
//         CPLog("Yogo db already seeded!");
//         indicateDatabaseIsSeeded();
//     }
// }
@end