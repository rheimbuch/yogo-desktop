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
@import "Server.j"

var DefaultToolbarIdentifier = "DefaultToolbarIdentifier";

@implementation AppController : CPObject
{
    CPWindow            theWindow; //this "outlet" is connected automatically by the Cib
    CPWebView           browser;
    CPToolbar           defaultToolbar;
    YogoProcessManager  processManager;
}



- (void)applicationDidFinishLaunching:(CPNotification)aNotification
{
    mainAppController = self;
    CPLog("Cappuccino framework loaded...");
    CPLog("Setting up toolbar");
    defaultToolbar = [[CPToolbar alloc] initWithIdentifier: DefaultToolbarIdentifier];
    [defaultToolbar setDelegate: self];
    [defaultToolbar setVisible: YES];
    [theWindow setToolbar: defaultToolbar];
    
    [browser setMainFrameURL:"Resources/launching.html"];
    
    processManager = [[YogoProcessManager alloc] init];
    
    // Get notified when processManager has finished starting servers
    [[CPNotificationCenter defaultCenter] addObserver:self
            selector:@selector(yogoServersStarted:)
            name:YogoProcessesStartedNotification
            object:processManager];
    
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

/**
 * Returns the full server url for the Yogo resource
 */
- (CPString)yogoURL:(CPString)path
{
    var url = "http://localhost:" + [processManager railsPort];
    if(path[0] === "/")
        return url + path;
    else
        return url + "/" + path;
}


- (void)goToYogoHome
{
    [browser setMainFrameURL:[self yogoURL:'/']];
}

- (void)goToProjects
{
    [browser setMainFrameURL:[self yogoURL:'/projects']];
}

- (void)goToCreateProject
{
    [browser setMainFrameURL:[self yogoURL:'/projects/new']];
}

- (void)yogoServersStarted:(CPNotification)notification
{
    [self goToYogoHome];
}

@end

var HomeToolbarItemIdentifier = "HomeToolbarItemIdentifier",
    ProjectsToolbarItemIdentifier = "ProjectsToolbarItemIdentifier",
    NewProjectToolbarItemIdentifier = "NewProjectToolbarItemIdentifier";

@implementation AppController (ToolbarDelegate)
- (CPArray)toolbarAllowedItemIdentifiers:(CPToolbar)aToolbar {
 
    return [CPToolbarSeparatorItemIdentifier, 
            CPToolbarFlexibleSpaceItemIdentifier, 
            CPToolbarSpaceItemIdentifier, 
            ProjectsToolbarItemIdentifier,
            NewProjectToolbarItemIdentifier];
}

- (CPArray)toolbarDefaultItemIdentifiers:(CPToolbar)aToolbar 
{
    return [HomeToolbarItemIdentifier,
            CPToolbarSeparatorItemIdentifier,
            ProjectsToolbarItemIdentifier,
            NewProjectToolbarItemIdentifier];
}

- (CPToolbarItem)toolbar: (CPToolbar)aToolbar itemForItemIdentifier:(CPString)anItemIdentifier willBeInsertedIntoToolbar:(BOOL)aFlag {
    var toolbarItem = [[CPToolbarItem alloc] initWithItemIdentifier: anItemIdentifier];
    var mainBundle = [CPBundle mainBundle];
    var iconSize = CPSizeMake(32,32);
    
    switch(anItemIdentifier) {
    case HomeToolbarItemIdentifier:
        var image = [[CPImage alloc] initWithContentsOfFile: [mainBundle pathForResource: "home.png"] size: iconSize];
        [toolbarItem setImage: image];
        [toolbarItem setTarget: self];
        [toolbarItem setAction: @selector(goToYogoHome)];
        [toolbarItem setLabel: "Yogo"];
        [toolbarItem setMinSize:iconSize];
        [toolbarItem setMaxSize:iconSize];
        break;
    case ProjectsToolbarItemIdentifier:
        var image = [[CPImage alloc] initWithContentsOfFile: [mainBundle pathForResource: "list.png"] size: iconSize];
        [toolbarItem setImage: image];
        [toolbarItem setTarget: self];
        [toolbarItem setAction: @selector(goToProjects)];
        [toolbarItem setLabel: "Projects"];
        [toolbarItem setMinSize:iconSize];
        [toolbarItem setMaxSize:iconSize];
        break;
    case NewProjectToolbarItemIdentifier:
        var image = [[CPImage alloc] initWithContentsOfFile: [mainBundle pathForResource: "add.png"] size: iconSize];
        [toolbarItem setImage: image];
        [toolbarItem setTarget: self];
        [toolbarItem setAction: @selector(goToCreateProject)];
        [toolbarItem setLabel: "Create"];
        [toolbarItem setMinSize:iconSize];
        [toolbarItem setMaxSize:iconSize];
        break;
    default:
    }
    
    
    return toolbarItem;
}
@end
