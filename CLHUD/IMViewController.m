//
//  IMViewController.m
//  CLHUD
//
//  Created by Chris Ledet on 2/21/13.
//  Copyright (c) 2013 imicit. All rights reserved.
//

#import "IMViewController.h"
#import "CLHUD.h"

@interface IMViewController ()
@end

@implementation IMViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

    CLHUD* hud = [[CLHUD alloc] initWithText:@"Completed"];
    hud.textFont = [UIFont fontWithName:@"Courier" size:20.0f];
    [hud displayOnView:self.view for:21.0f];
//    sleep(3);
//    [hud displayOnView:self.view];
}


@end
