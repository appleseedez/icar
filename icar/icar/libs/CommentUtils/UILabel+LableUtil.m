//
//  UILabel+LableUtil.m
//  geoy
//
//  Created by Pharaoh on 13-3-17.
//  Copyright (c) 2013年 geoy. All rights reserved.
//

#import "UILabel+LableUtil.h"
#import <QuartzCore/QuartzCore.h>
@implementation UILabel (LableUtil)
-(void)addBorderAtBottomWithFrame:(CGRect) frame{
	CALayer* bottomBorderLayer = [CALayer layer];
	bottomBorderLayer.borderWidth = .5;
	bottomBorderLayer.frame = frame;//;
	bottomBorderLayer.borderColor = [UIColor colorWithRed:0.871 green:0.871 blue:0.871 alpha:1].CGColor;
	[self.layer insertSublayer:bottomBorderLayer atIndex:0];
}

- (void)addBorderAtMid{
	CALayer* borderLayer = [CALayer layer];
	borderLayer.borderWidth = 1;
	
	CGFloat width = [self.text sizeWithFont:self.font constrainedToSize:CGSizeMake(self.bounds.size.width, 1000) lineBreakMode:self.lineBreakMode].width;
	borderLayer.frame = CGRectMake((self.bounds.size.width-width)*.5-1, self.bounds.size.height/2,width+2,1);
	borderLayer.borderColor = [UIColor darkGrayColor].CGColor;
	[self.layer addSublayer:borderLayer];
}

@end
