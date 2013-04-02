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
- (void)addGradientBackground{
	//渐变色背景 垂直渐变
	CAGradientLayer* backgroundLayer = [CAGradientLayer layer];
	backgroundLayer.frame = self.bounds;
	backgroundLayer.colors = @[(id)[UIColor whiteColor].CGColor,(id)[UIColor colorWithRed:0.949 green:0.949 blue:0.949 alpha:1].CGColor]; // #ffffff - #f2f2f2
	// 对于单元格高度动态变化的情况. 
	if ([self.contentView.layer.sublayers[0] isKindOfClass:[CAGradientLayer class]]) {
		[self.contentView.layer.sublayers[0] removeFromSuperlayer];
	}
	[self.contentView.layer insertSublayer:backgroundLayer atIndex:0];

}

- (void) addColorBackground{
	CALayer* backgroudLayer = [CALayer layer];
	backgroudLayer.frame = self.bounds;
	backgroudLayer.backgroundColor = [UIColor whiteColor].CGColor;
	[self.contentView.layer insertSublayer:backgroudLayer atIndex:0];
}
@end
