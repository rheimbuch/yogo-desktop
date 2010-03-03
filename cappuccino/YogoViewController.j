@import <AppKit/CPViewController.j>
@import <AppKit/CPProgressIndicator.j>
@import "YogoProcessManager.j"

@implementation YogoViewController : CPViewController
{
    CPTextField             consoleView;
    CPString                consoleOutput;
    CPProgressIndicator     progressIndicator;
    
    YogoProcessManager      processManager      @accessors(readonly);
    CPString                lastProgressMessage;
}

- (id)init
{
    return [self initWithProcessManager:[[YogoProcessManager alloc] init]];
}

- (void)awakeFromCib
{
    var placeHolder = progressIndicator;
    progressIndicator = [[CPProgressIndicator alloc] initWithFrame:CGRectMakeCopy([placeHolder frame])];
    [progressIndicator setAutoresizingMask:[placeHolder autoresizingMask]];
    [[self view] replaceSubview:placeHolder with:progressIndicator];
    [progressIndicator setDisplayedWhenStopped:YES];
    [progressIndicator sizeToFit];
    
    // [consoleView setScrollMode:CPWebViewScrollNative];
    [consoleView setDrawsBackground:YES];
    [consoleView loadHTMLString:"<html><body style='padding:1em;background-color:black'></body></html>"];
}

- (id)initWithProcessManager:(YogoProcessManager)manager
{
    self = [super initWithCibName:"YogoView" bundle:nil];
    if(self)
    {
        consoleOutput = "";
        processManager = manager;
                
        [[CPNotificationCenter defaultCenter] addObserver:self
                selector:@selector(startUpComplete:)
                name:YogoProcessesStartedNotification
                object:processManager];
                
        [[CPNotificationCenter defaultCenter] addObserver:self
                selector:@selector(processManagerProgressUpdate:)
                name:YogoProcessManagerProgressNotification
                object:processManager];
        
        [[CPNotificationCenter defaultCenter] addObserver:self
                selector:@selector(updateConsole:)
                name:ServerConsoleOutputNotification
                object:nil];
        
    }
    return self;
}



- (void)startUpComplete:(CPNotification)notification
{
    var url = "http://localhost:" + [processManager railsPort] + "/";
    [self writeLineToConsole:"Opening Yogo in your browser: " + url];
    Titanium.Desktop.openURL(url);
}

- (void)updateConsole:(CPNotification)notification
{
    [self writeLineToConsole:[[notification userInfo] objectForKey:'line'] withColor:[CPColor grayColor]];
}

- (void)processManagerProgressUpdate:(CPNotification)notification
{
    [progressIndicator setDoubleValue:[processManager progress]];
    [progressIndicator setNeedsDisplay:YES];
    [[CPRunLoop currentRunLoop] limitDateForMode:CPDefaultRunLoopMode];
    
    var message = [processManager message];
    if(message != lastProgressMessage)
    {
        lastProgressMessage = message;
        [self writeLineToConsole:message withColor:[CPColor greenColor]];
        // [consoleView setNeedsDisplay:YES];
    }    
}

- (void)writeLineToConsole:(CPString)line withColor:(CPColor)color
{
    // consoleOutput += (line + "\n");
    var doc = [consoleView DOMWindow].document;
    doc.write("<pre style='color:#"+[color hexString]+"'>" + line + "</pre>");

    [consoleView setFrameSize:[consoleView frameSize]]; // Ensure the scrollbars resize after updating iframe
    var scrollView = consoleView._scrollView;   
    var scrollOrigin = CGPointMake(0.0, 
                                   CGRectGetMaxY([[scrollView documentView] frame]) - 
                                   CGRectGetHeight([[scrollView contentView] bounds])); // Calculate the end point to scroll to
    [[scrollView documentView] scrollPoint:scrollOrigin];   // Scroll the view to the end point
    [consoleView setNeedsDisplay:YES];                      // Mark the WebView for update
    [[CPRunLoop currentRunLoop] limitDateForMode:CPDefaultRunLoopMode]; // Pump the runloop
}

- (void)writeLineToConsole:(CPString)line
{
    [self writeLineToConsole:line withColor:[CPColor whiteColor]];
}




@end