//
//  UITableViewCell+BackgroundUtil.m
//  geoy
//
//  Created by Pharaoh on 13-3-17.
//  Copyright (c) 2013年 geoy. All rights reserved.
//

#import "UITableViewCell+BackgroundUtil.h"
#import <QuartzCore/QuartzCore.h>
@implementation UITableViewCell (BackgroundUtil)
- (void)addBackground{
	//渐变色背景 垂直渐变
	CAGradientLayer* backgroundLayer = [CAGradientLayer layer];
	backgroundLayer.frame = self.bounds;
	backgroundLayer.colors = @[(id)[UIColor whiteColor].CGColor,(id)[UIColor colorWithRed:0.949 green:0.949 blue:0.949 alpha:1].CGColor]; // #ffffff - #f2f2f2
	[self.contentView.layer insertSublayer:backgroundLayer atIndex:0];

}
@end
