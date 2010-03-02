@import <AppKit/CPViewController.j>
@import "YogoProcessManager.j"

@implementation YogoViewController : CPViewController
{
    CPView                  progressView;
    CPProgressIndicator     progressIndicator;
    CPTextField             progressLabel;
    CPWebView               browserView         @accessors(readonly);
    
    YogoProcessManager      processManager      @accessors(readonly);
    BOOL                    loading             @accessors;
}

- (id)init
{
    return [self initWithProcessManager:[[YogoProcessManager alloc] init]];
}

- (id)initWithProcessManager:(YogoProcessManager)manager
{
    self = [super initWithCibName:"YogoView" bundle:nil];
    if(self)
    {
        loading = false;
        processManager = manager;
                
        [[CPNotificationCenter defaultCenter] addObserver:self
                selector:@selector(processManagerProgressUpdated:)
                name:YogoProcessManagerProgressNotification
                object:processManager];
        
    }
    return self;
}

- (void)awakeFromCib
{
    [browserView setBackgroundColor:[CPColor whiteColor]];
    
    
    CPLog.debug("Swapping in real progressIndicator");
    var placeHolder = progressIndicator;
    // console.debug(placeHolder);
    var progressIndicator = [[CPProgressIndicator alloc] initWithFrame:CGRectMakeCopy([placeHolder frame])];
    [progressIndicator setAutoresizingMask:[placeHolder autoresizingMask]];
    // console.debug(progressIndicator);
    CPLog.debug("progressIndicator created");
    [progressView replaceSubview:placeHolder with:progressIndicator];
    [progressIndicator setDisplayedWhenStopped:YES];
    [progressIndicator setMinValue:0];
    [progressIndicator setMaxValue:100];
    [progressIndicator setIndeterminate:YES];
    [progressIndicator sizeToFit];
}

- (CPString)url
{
    return [browserView mainFrameURL];
}

- (void)setUrl:(CPString)url
{
    [browserView setMainFrameURL:url];
}

- (void)setLoading:(boolean)isLoading
{
    if(loading === isLoading)
        return;
    
    [self willChangeValueForKey:"loading"];
    loading = isLoading;
    [self didChangeValueForKey:"loading"];
    
    if([self loading])
    {
        [[self view] replaceSubview:browserView with:progressView];
        [progressView setFrame:[[self view] bounds]];
    }
    else
    {
        [[self view] replaceSubview:progressView with:browserView];
        [browserView setFrame:[[self view] bounds]];
    }
}


- (void)processManagerProgressUpdated:(CPNotification)notification
{
    [progressIndicator setDoubleValue:[processManager progress]];
    [progressLabel setObjectValue:[processManager message]];
}



@end