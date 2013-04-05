//
//  GoodyProviderCell.m
//  icar
//
//  Created by Pharaoh on 13-3-17.
//  Copyright (c) 2013年 icar. All rights reserved.
//

#import "GoodyProviderCell.h"

@implementation GoodyProviderCell


- (void)drawRect:(CGRect)rect{
	[super drawRect:rect];
	[self.thumbView addBorder];
	//[self.nameLabel addBorderAtBottomWithFrame:CGRectMake(0, self.nameLabel.bounds.size.height-2, self.nameLabel.bounds.size.width+8, .5)];
	
	
	CALayer *bottomBorderLayer = [CALayer layer];
	bottomBorderLayer.borderColor = [UIColor colorWithRed:0.878 green:0.878 blue:0.878 alpha:1].CGColor;
	bottomBorderLayer.borderWidth = 4;
	bottomBorderLayer.frame = CGRectMake(0, self.backGroundView.bounds.size.height, self.backGroundView.bounds.size.width, 1);
	[self.backGroundView.layer addSublayer:bottomBorderLayer];
	CALayer *outterBorderLayer = [CALayer layer];
	outterBorderLayer.borderColor = [UIColor colorWithRed:0.878 green:0.878 blue:0.878 alpha:.3].CGColor;
	outterBorderLayer.borderWidth = 4;
	outterBorderLayer.frame = CGRectMake(0, self.backGroundView.bounds.size.height+1, self.backGroundView.bounds.size.width, 1);
	[self.backGroundView.layer addSublayer:outterBorderLayer];
}
@end
