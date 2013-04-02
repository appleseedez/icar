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
	innerBorder.borderWidth = (self.bounds.size.width*.08);
	innerBorder.frame = CGRectMake(0, 0, self.bounds.size.width, self.bounds.size.height);
	self.backgroundColor = [UIColor colorWithRed:0.949 green:0.949 blue:0.949 alpha:1];
	[self.layer addSublayer:innerBorder];
	
	[self.layer setBorderColor:[UIColor colorWithRed:0.871 green:0.871 blue:0.871 alpha:1].CGColor];
	[self.layer setBorderWidth:0.5];
}
@end
