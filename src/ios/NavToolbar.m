//
//  LoadingSpinner.m
//  nav
//
//  Created by ParkJooHyeon on 2016. 12. 2..
//
//

#import "NavToolbar.h"


@implementation NavToolbar

- (void)pluginInitialize {
    [self initToolbar];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(recvNoti:) name:CDVPageDidLoadNotification object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(recvNoti:) name:CDVPluginResetNotification object:nil];
    
}

- (void) initToolbar
{
    CGRect sr = [[UIScreen mainScreen] bounds];
    CGRect r = self.webView.frame;
    CGSize statusBarSize = [[UIApplication sharedApplication] statusBarFrame].size;
    
    self.webView.frame = CGRectMake(0, statusBarSize.height, r.size.width, r.size.height-44 - statusBarSize.height);
    
    UIToolbar *toolbar = [[UIToolbar alloc] init];
    toolbar.barTintColor = [UIColor whiteColor];
    
    toolbar.frame = CGRectMake(0, sr.size.height - 44, sr.size.width, 44);
    UIBarButtonItem* space = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:self action:@selector(barButtonPressed:)];
    
    self->btnRefresh = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemRefresh target:self action:@selector(barButtonPressed:)];
    self->btnLeft = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"left.png"] style:UIBarButtonItemStylePlain target:self action:@selector(barButtonPressed:)];
    self->btnRight = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"right.png"] style:UIBarButtonItemStylePlain target:self action:@selector(barButtonPressed:)];
    
    [toolbar setItems:[[NSArray alloc] initWithObjects:self->btnLeft, space, self->btnRight, space,space, self->btnRefresh, nil]];
    [self.viewController.view addSubview:toolbar];
}

- (void) recvNoti:(NSNotification *) notification
{
    
}

-(IBAction)barButtonPressed:(UIBarButtonItem*)btn
{
    if( btn == self->btnRefresh ){
        [[NSURLCache sharedURLCache] removeAllCachedResponses];
        UIWebView* v = (UIWebView*)self.webView;
        [v reload];
    }
    else if( btn == self->btnLeft ){
        UIWebView* v = (UIWebView*)self.webView;
        [v goBack];
    }
    else if( btn == self->btnRight ){
        UIWebView* v = (UIWebView*)self.webView;
        [v goForward];
    }

}


@end
