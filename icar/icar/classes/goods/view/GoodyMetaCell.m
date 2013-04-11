//
//  GoodyMetaCell.m
//  geoy
//
//  Created by Pharaoh on 13-3-18.
//  Copyright (c) 2013年 geoy. All rights reserved.
//

#import "GoodyMetaCell.h"

@implementation GoodyMetaCell


- (void)awakeFromNib{
	[super awakeFromNib];
	[self.nameLabel addBorderAtBottomWithFrame:CGRectMake(0, self.nameLabel.bounds.size.height+4, self.nameLabel.bounds.size.width, .5)];
	
}
//由于单元格内容发生变化,需要重绘
- (void)drawRect:(CGRect)rect{
	[super drawRect:rect];
	self.bottomBorderLayer.frame = CGRectMake(0, self.contentView.bounds.size.height-1, self.contentView.bounds.size.width, .5);
	self.outterBorderLayer.frame = CGRectMake(0, self.contentView.bounds.size.height, self.contentView.bounds.size.width, .5);
}
@end
