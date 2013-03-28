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
	[self.nameLabel addBorderAtBottomWithFrame:CGRectMake(0, self.nameLabel.bounds.size.height-2, self.nameLabel.bounds.size.width+8, .5)];
	[self addBackground];
}
@end
