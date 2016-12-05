//
//  LoadingSpinner.h
//  nav
//
//  Created by ParkJooHyeon on 2016. 12. 2..
//
//

#import <Cordova/CDVPlugin.h>


@interface NavToolbar : CDVPlugin
{
    UIBarButtonItem* btnRefresh;
    UIBarButtonItem* btnLeft;
    UIBarButtonItem* btnRight;
}

- (void)pluginInitialize;

@end
