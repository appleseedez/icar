//
//  CommentCell.m
//  icar
//
//  Created by Pharaoh on 13-3-29.
//  Copyright (c) 2013年 365icar. All rights reserved.
//

#import "CommentCell.h"

@implementation CommentCell

- (void)awakeFromNib{
	[super awakeFromNib];
	[self.thumbView addBorder];
}

- (void)drawRect:(CGRect)rect{
	[super drawRect:rect];
	self.bottomBorderLayer.frame = CGRectMake(0, self.contentView.bounds.size.height-1, self.contentView.bounds.size.width, .5);
	self.outterBorderLayer.frame = CGRectMake(0, self.contentView.bounds.size.height, self.contentView.bounds.size.width, .5);
}
@end
