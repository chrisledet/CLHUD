//
//  IMAppDelegate.h
//  CLHUD
//
//  Created by Chris Ledet on 2/21/13.
//  Copyright (c) 2013 imicit. All rights reserved.
//

#import <UIKit/UIKit.h>

@class IMViewController;

@interface IMAppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (strong, nonatomic) IMViewController *viewController;

@end
