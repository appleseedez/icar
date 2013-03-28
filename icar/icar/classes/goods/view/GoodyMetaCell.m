//
//  GoodyMetaCell.m
//  geoy
//
//  Created by Pharaoh on 13-3-18.
//  Copyright (c) 2013年 geoy. All rights reserved.
//

#import "GoodyMetaCell.h"

@implementation GoodyMetaCell


- (void)drawRect:(CGRect)rect{
	[super drawRect:rect];
	[self addBackground];
	[self.nameLabel addBorderAtBottomWithFrame:CGRectMake(0, self.nameLabel.bounds.size.height+4, self.nameLabel.bounds.size.width, .5)];
	
}
@end
