//
//  GEOIndexViewController.m
//  icar
//
//  Created by Pharaoh on 13-3-26.
//  Copyright (c) 2013年 365icar. All rights reserved.
//

#import "GEOIndexViewController.h"

@interface GEOIndexViewController ()

@end

@implementation GEOIndexViewController


#pragma  mark - action
- (void)modalToGoodsIndexByTouch:(UIButton *)button{
	[self presentViewController:[[UIStoryboard storyboardWithName:@"GEOGoods" bundle:nil] instantiateInitialViewController] animated:YES completion:nil];
}
@end
