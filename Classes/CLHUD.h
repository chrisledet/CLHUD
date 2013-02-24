//
//  CLHUD.h
//  CLHUD
//
//  Created by Chris Ledet on 2/21/13.
//  Copyright (c) 2013 imicit. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CLHUD : UIView

@property (nonatomic, copy)   NSString* text;
@property (nonatomic, strong) UIFont*   textFont;

/* Initializers*/
- (id)initWithText:(NSString*)text;
- (id)initWithText:(NSString*)text andFont:(UIFont*)textFont;

/* Display */
- (void)displayOnView:(UIView*)view;
- (void)displayOnView:(UIView*)view for:(float)secs;

@end
