//
//  UIImageView+ImageUtil.m
//  geoy
//
//  Created by Pharaoh on 13-3-17.
//  Copyright (c) 2013年 geoy. All rights reserved.
//

#import "UIImageView+ImageUtil.h"
#import <QuartzCore/QuartzCore.h>
@implementation UIImageView (ImageUtil)
- (void)addBorder{
	
	CALayer* innerBorder = [CALayer layer];
	innerBorder.borderColor = [UIColor whiteColor].CGColor;// [UIColor colorWithRed:0.949 green:0.949 blue:0.949 alpha:1].CGColor; // #f2f2f2;
	innerBorder.borderWidth =2;
	innerBorder.frame = CGRectMake(0, 0, self.bounds.size.width, self.bounds.size.height);
	self.backgroundColor = [UIColor whiteColor];
	[self.layer addSublayer:innerBorder];
	
	[self.layer setBorderColor:[UIColor colorWithRed:0.878 green:0.878 blue:0.878 alpha:1].CGColor];
	[self.layer setBorderWidth:.5];
	
	CALayer *bottomBorderLayer = [CALayer layer];
	bottomBorderLayer.borderColor = [UIColor colorWithRed:0.878 green:0.878 blue:0.878 alpha:.5].CGColor;
	bottomBorderLayer.borderWidth = 4;
	bottomBorderLayer.frame = CGRectMake(0, self.bounds.size.height, self.bounds.size.width, 1);
	[self.layer addSublayer:bottomBorderLayer];
}
@end
