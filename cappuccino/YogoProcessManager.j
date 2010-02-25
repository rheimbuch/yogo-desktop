@import <Foundation/CPObject.j>
@import <Foundation/CPNotificationCenter.j>
@import "Server.j"

YogoDatabaseSeededNotification = "YogoDatabaseSeededNotification";
YogoProcessesStartedNotification = "YogoProcessesStartedNotification";


@implementation YogoProcessManager : CPObject
{
    id          railsServer         @accessors(readonly);
    CPString    railsPort           @accessors(readonly);
    id          persvrServer        @accessors(readonly);
    CPString    persvrPort          @accessors(readonly);
    boolean     databaseSeeded      @accessors(readonly);

}

- (id)init
{
    self = [super init];
    if(self)
    {
        databaseSeeded = false;
    
        Titanium.API.debug("Finding open ports...");
        persvrPort = [self availablePort];
        Titanium.API.debug("Persevere port = " + persvrPort);
    
        var persvrCmd = [ Titanium.App.appURLToPath("app://persevere/bin/" + (Titanium.getPlatform() == 'win32' ? "persvr.bat" : "persvr") )];
        persvrCmd.push("-r", Titanium.App.appURLToPath("app://persevere"));
        persvrCmd.push("-p", persvrPort);
        Titanium.API.debug("persvrCmd = " + persvrCmd);
        persvrServer = [[Server alloc] initWithArgs:persvrCmd 
                                       withStartLine:"Started SelectChannelConnector@0.0.0.0:([0-9]+)"];
    
    
        railsPort = [self availablePort];
        Titanium.API.debug("Rails port = " + railsPort);
    
    
        var railsCmd = [];
        railsCmd.push('java', '-jar', Titanium.App.appURLToPath("app://jruby-complete-1.4.0.jar"));
        railsCmd.push(Titanium.App.appURLToPath("app://yogo/script/server"), '-e', 'production');
        railsCmd.push('-p', railsPort);
        Titanium.API.debug("railsCmd = " + railsCmd);
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
        selector:@selector(persvrServerStarted:)
        name:ServerStartedStatus
        object:persvrServer];
        
    [[CPNotificationCenter defaultCenter]
        addObserver:self
        selector:@selector(databaseSeedFinished:)
        name:YogoDatabaseSeededNotification
        object:self];
}

- (void)persvrServerStarted:(CPNotification)notification
{
    [self seedDatabase];
}

- (void)databaseSeedFinished:(CPNotification)notification
{
    [railsServer start];
}

- (void)railsServerStarted:(CPNotification)notification
{
    // Rails Server Started
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
    console.debug("Found open port: " + port);
    return port.toString();
}

- (void)seedDatabase
{
    var indicateDatabaseIsSeeded = function()
    {
        [self willChangeValueForKey:"databaseSeeded"];
        databaseSeeded = true;
        [self didChangeValueForKey:"databaseSeeded"];
        [[CPNotificationCenter defaultCenter]
                postNotificationName:YogoDatabaseSeededNotification
                object:self];
    };
    
    Titanium.API.debug("Checking to see if yogo db needs to be seeded...")
    var TFile = Titanium.Filesystem;
    var yogoDbSeeded = TFile.getFile(TFile.getResourcesDirectory(), 'yogo_db_seeded');
    if(!yogoDbSeeded.exists())
    {
        var dbSeedCmd = [];
        dbSeedCmd.push('java', '-jar', Titanium.App.appURLToPath("app://jruby-complete-1.4.0.jar"));
        dbSeedCmd.push('-S', 'rake', '-f', Titanium.App.appURLToPath("app://yogo/Rakefile"));
        dbSeedCmd.push('db:seed');
        var dbSeed = Titanium.Process.createProcess({
            args:dbSeedCmd,
            env: {
                'RAILS_ENV':'production',
                'PERSVR_PORT':persvrPort
            }
        })
        dbSeed.setOnExit(function(){
            Titanium.API.debug("Finished seeding yogo db!")
            yogoDbSeeded.write(Date.now());
            indicateDatabaseIsSeeded();
        });
        Titanium.API.debug("Seeding yogo db!");
        dbSeed.launch();
    }
    else
    {
        Titanium.API.debug("Yogo db already seeded!");
        indicateDatabaseIsSeeded();
    }
}
@end