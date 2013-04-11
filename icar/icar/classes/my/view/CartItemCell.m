//
//  CartItemCell.m
//  icar
//
//  Created by Pharaoh on 13-4-10.
//  Copyright (c) 2013年 365icar. All rights reserved.
//

#import "CartItemCell.h"

@implementation CartItemCell


// 从nib文件中加载的对象和关联的对象都已经链接完成(比如.IBOutlet)时,view会调用一次这个方法. 这里就是进行subview初始化的合适地方
- (void)awakeFromNib{
	[super awakeFromNib];
	[self.thumbView addBorder];
	[self.oldPriceLabel addBorderAtMid];
	self.layer.borderWidth = .5;
	self.layer.borderColor =  [UIColor colorWithRed:0.878 green:0.878 blue:0.878 alpha:1].CGColor;

}

@end
