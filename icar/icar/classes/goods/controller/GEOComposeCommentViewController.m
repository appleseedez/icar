//
//  GEOComposeCommentViewController.m
//  icar
//
//  Created by Pharaoh on 13-3-29.
//  Copyright (c) 2013年 365icar. All rights reserved.
//

#import "GEOComposeCommentViewController.h"

@interface GEOComposeCommentViewController ()

@end

@implementation GEOComposeCommentViewController


#pragma mark - actions

- (void)close:(UIButton *)closeButton{
	[self dismissViewControllerAnimated:YES completion:nil];
}

- (void)deliver:(UIButton *)deliverButton{
	// deliver the comments
}
@end
