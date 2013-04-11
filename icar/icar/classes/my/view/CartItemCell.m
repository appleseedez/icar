//
//  CartItemCell.m
//  icar
//
//  Created by Pharaoh on 13-4-10.
//  Copyright (c) 2013年 365icar. All rights reserved.
//

#import "CartItemCell.h"

@implementation CartItemCell

- (void)drawRect:(CGRect)rect
{
	[super drawRect:rect];
	[self.thumbView addBorder];
	[self.oldPriceLabel addBorderAtMid];
	self.layer.borderWidth = .5;
	self.layer.borderColor =  [UIColor colorWithRed:0.878 green:0.878 blue:0.878 alpha:1].CGColor;
}

@end
