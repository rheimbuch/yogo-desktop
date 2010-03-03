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
@import "YogoProcessManager.j"
@import "YogoViewController.j"
@import "Server.j"

var DefaultToolbarIdentifier = "DefaultToolbarIdentifier";

@implementation AppController : CPObject
{
    CPWindow            theWindow; //this "outlet" is connected automatically by the Cib
    CPToolbar           defaultToolbar;
    YogoViewController  mainViewController;
    YogoProcessManager  processManager;
}


- (void)applicationDidFinishLaunching:(CPNotification)aNotification
{
    mainAppController = self;
    
    processManager = [[YogoProcessManager alloc] init];

    
    mainViewController = [[YogoViewController alloc] initWithProcessManager:processManager];
    [[mainViewController view] setFrame:[[theWindow contentView] bounds]];
    [[theWindow contentView] addSubview:[mainViewController view]];
    
    vc = mainViewController;
    pm = processManager;
    
    
    // Hook into Titanium exit and cleanup server processes
    Titanium.addEventListener(Titanium.APP_EXIT, function(e)
    {
        CPLog("Exiting YogoApp...");
        [processManager stopAll];
    });
            
    CPLog("About to start servers...");
    [processManager startAll];
}

- (void)awakeFromCib
{
    // This is called when the cib is done loading.
    // You can implement this method on any object instantiated from a Cib.
    // It's a useful hook for setting up current UI values, and other things. 
    
    // In this case, we want the window from Cib to become our full browser window
    [theWindow setFullBridge:YES];
}

@end
