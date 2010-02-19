/*
 * AppController.j
 * capp
 *
 * Created by You on February 18, 2010.
 * Copyright 2010, Your Company All rights reserved.
 */

@import <Foundation/CPObject.j>
@import <AppKit/CPWebView.j>
@import <AppKit/CPToolbar.j>
@import "Server.j"

var DefaultToolbarIdentifier = "DefaultToolbarIdentifier";
var YogoLocalURL = "http://localhost:3000";

@implementation AppController : CPObject
{
    CPWindow    theWindow; //this "outlet" is connected automatically by the Cib
    CPWebView   browser;
    CPToolbar   defaultToolbar;
    Server      railsServer;
    Server      persvrServer;
    int         serverCount;
}

- (void)applicationDidFinishLaunching:(CPNotification)aNotification
{
    // defaultToolbar = [[CPToolbar alloc] initWithIdentifier: DefaultToolbarIdentifier];
    // [defaultToolbar setDelegate: self];
    // [defaultToolbar setVisible: YES];
    // [theWindow setToolbar: disconnectedToolbar];
    
    [browser setMainFrameURL:"Resources/launching.html"];
    serverCount = 0;
    
    var persvrCmd = [ Titanium.App.appURLToPath("app://persevere/bin/" + (Titanium.getPlatform() == 'win32' ? "persvr.bat" : "persvr") )];
    persvrCmd.push("-r")
    persvrCmd.push(Titanium.App.appURLToPath("app://persevere"));
    persvrServer = [[Server alloc] initWithArgs:persvrCmd 
                                   withStartLine:"Started SelectChannelConnector@0.0.0.0:([0-9]+)"];
    
    var railsCmd = ['java', '-jar', Titanium.App.appURLToPath("app://jruby-complete-1.4.0.jar"), Titanium.App.appURLToPath("app://yogo/script/server"), '-e', 'production'];
    railsServer = [[Server alloc] initWithArgs:railsCmd
                                  withStartLine:"WEBrick::HTTPServer#start: pid=([0-9]+) port=([0-9]+)" ]
                                  
    [persvrServer addObserver:self
                    forKeyPath:"status"
                    options:CPKeyValueObservingOptionNew
                    context:nil];
    [railsServer addObserver:self
                    forKeyPath:"status"
                    options:CPKeyValueObservingOptionNew
                    context:nil];
    
    Titanium.addEventListener(Titanium.EXIT, function(e)
    {
        Titanium.API.info("Shutting down servers...");
        [self stop];
    });
    
    [self start];
}

- (void)awakeFromCib
{
    // This is called when the cib is done loading.
    // You can implement this method on any object instantiated from a Cib.
    // It's a useful hook for setting up current UI values, and other things. 
    
    // In this case, we want the window from Cib to become our full browser window
    [theWindow setFullBridge:YES];
}

- (void)start
{
    [persvrServer start];
    
}

- (void)stop
{
    [railsServer stop];
    [persvrServer stop];
}

- (void)observeValueForKeyPath:(CPString)keyPath
            ofObject:(id)object
            change:(CPDictionary)change
            context:(id)context
{
    if(keyPath === "status")
    {
        if([object status] === ServerStartedStatus)
        {
            serverCount += 1;
        }
        else if([object status] === ServerStoppedStatus)
            serverCount -= 1;
            
        if(object === persvrServer && [persvrServer status] === ServerStartedStatus)
        {
            [railsServer start];
        }
        
        if(object === railsServer && [railsServer status] === ServerStartedStatus)
        {
            [browser setMainFrameURL:YogoLocalURL];
        }
    }
}

@end

// @implementation AppController (ToolbarDelegate)
// -(CPArray)toolbarAllowedItemIdentifiers: (CPToolbar)aToolbar {
//  
//     return [CPToolbarSeparatorItemIdentifier, 
//             CPToolbarFlexibleSpaceItemIdentifier, 
//             CPToolbarSpaceItemIdentifier, 
//             BackToolbarItemIdentifier,
//             ForwardToolbarItemIdentifier];
// }
// @end
