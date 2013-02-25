/*
 CLHUD.m
 CLHUD
 Created by Chris Ledet on 2/21/13.
 Copyright (c) 2012 Chris Ledet
 
 Permission is hereby granted, free of charge, to any person obtaining a copy
 of this software and associated documentation files (the "Software"), to deal
 in the Software without restriction, including without limitation the rights
 to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
 copies of the Software, and to permit persons to whom the Software is
 furnished to do so, subject to the following conditions:
 
 The above copyright notice and this permission notice shall be included in
 all copies or substantial portions of the Software.
 
 THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
 OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
 THE SOFTWARE.
*/

#import "CLHUD.h"
#import <QuartzCore/QuartzCore.h>

#define CLHUD_DEFAULT_WIDTH   175.0
#define CLHUD_DEFAULT_HEIGHT  150.0
#define CLHUD_PADDING         5.0
#define CLHUD_DEFAULT_FADE    2.0

@interface CLHUD() {
    UIView*  _hudView;
    UILabel* _titleLabel;
}

@end

@implementation CLHUD

#pragma mark - Initializers

- (id)init
{
    self = [super init];
    
    if (self) {
        [self setUpView];
    }
    
    return self;
}

- (id)initWithText:(NSString *)text
{
    self = [self init];
    if (self) {
        self.text = text;
        self.textFont = [UIFont systemFontOfSize:20];
    }
    return self;
}

- (id)initWithText:(NSString*)text andFont:(UIFont*)textFont
{
    self = [self init];
    if (self) {
        self.text = text;
        self.textFont = textFont;
    }
    return self;
}

- (void)drawRect:(CGRect)rect
{
    //// General Declarations
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    //// Color Declarations
    UIColor* fillColor   = [UIColor colorWithRed: 1 green: 1 blue: 1 alpha: 1];
    UIColor* strokeColor = [UIColor colorWithRed: 0.325 green: 0.325 blue: 0.325 alpha: 1];
    UIColor* fadedColor  = [UIColor colorWithRed:0 green:0 blue:0 alpha:0.833];
    
    //// Shadow Declarations
    UIColor* shadow = [UIColor clearColor];
    CGSize shadowOffset = CGSizeMake(1.1, 1.1);
    CGFloat shadowBlurRadius = 5;
    
    //// CLHUD
    {
        //// HUD Drawing
        CGRect HUDRect = CGRectMake(CLHUD_PADDING, CLHUD_PADDING, CLHUD_DEFAULT_WIDTH - CLHUD_PADDING, CLHUD_DEFAULT_HEIGHT - CLHUD_PADDING);
        UIBezierPath* HUDPath = [UIBezierPath bezierPathWithRoundedRect:HUDRect cornerRadius:5];
        CGContextSaveGState(context);
        CGContextSetShadowWithColor(context, shadowOffset, shadowBlurRadius, shadow.CGColor);
        [fadedColor setFill];
        [HUDPath fill];
        CGContextRestoreGState(context);
        
        [strokeColor setStroke];
        HUDPath.lineWidth = 1;
        [HUDPath stroke];
        
        
        //// Text Drawing
        CGRect textRect = CGRectMake(5, 115, CLHUD_DEFAULT_WIDTH - CLHUD_PADDING, 30);
        [fillColor setFill];
        [self.text drawInRect:textRect withFont:self.textFont lineBreakMode:NSLineBreakByWordWrapping alignment:NSTextAlignmentCenter];
        
        //// Check Mark
        {
            //// Bezier 2 Drawing
            UIBezierPath* bezier2Path = [UIBezierPath bezierPath];
            [bezier2Path moveToPoint: CGPointMake(81.75, 87.51)];
            [bezier2Path addCurveToPoint: CGPointMake(126.75, 37.51) controlPoint1: CGPointMake(120.37, 45.07) controlPoint2: CGPointMake(126.75, 37.51)];
            [fillColor setStroke];
            bezier2Path.lineWidth = 15;
            [bezier2Path stroke];
            
            
            //// Bezier Drawing
            UIBezierPath* bezierPath = [UIBezierPath bezierPath];
            [bezierPath moveToPoint: CGPointMake(91.25, 87.51)];
            [bezierPath addCurveToPoint: CGPointMake(65.25, 66.51) controlPoint1: CGPointMake(68.93, 69.69) controlPoint2: CGPointMake(65.25, 66.51)];
            [fillColor setStroke];
            bezierPath.lineWidth = 15;
            [bezierPath stroke];
        }
    }
    
}

#pragma mark - Public

- (void)displayOnView:(UIView*)view
{
    [self displayOnView:view for:CLHUD_DEFAULT_FADE];
}

- (void)displayOnView:(UIView*)view for:(float)secs
{
    CGPoint origin = [self middlePointFromView:view];
    self.frame = CGRectMake(origin.x, origin.y, CLHUD_DEFAULT_WIDTH + CLHUD_PADDING, CLHUD_DEFAULT_HEIGHT + CLHUD_PADDING);
    [view addSubview:self];
    
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_BACKGROUND, 0), ^{
        
        sleep(secs);
        
        dispatch_async(dispatch_get_main_queue(), ^(void){
            [self fadeView:self in:1.0];
        });
    });
}

#pragma mark - Private
 
- (void)fadeView:(UIView*)view in:(NSInteger)secs
{
    [UIView animateWithDuration:secs
                     animations:^(void) {
                         view.alpha = 0.0;
                     }
                     completion:^(BOOL finished) {
                         [view removeFromSuperview];
                     }
     ];
}

- (CGPoint)middlePointFromView:(UIView*)view
{
    float originX = (view.bounds.size.width/2)  - (CLHUD_DEFAULT_WIDTH/2);
    float originY = (view.bounds.size.height/2) - (CLHUD_DEFAULT_HEIGHT/2);
    
    return CGPointMake(originX - CLHUD_PADDING, originY - CLHUD_PADDING);
}

- (void)setUpView
{
    self.backgroundColor = [UIColor clearColor];
}

@end
