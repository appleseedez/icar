//
//  CartItemCell.m
//  icar
//
//  Created by Pharaoh on 13-4-10.
//  Copyright (c) 2013年 365icar. All rights reserved.
//

#import "CartItemCell.h"
#define SELECTED_COLOR [UIColor colorWithRed:0.651 green:0.788 blue:0.859 alpha:1]
#define NORMAL_BORDER_COLOR [UIColor colorWithRed:0.87 green:0.87 blue:0.87 alpha:1]
#define BACKGROUND_COLOR [UIColor colorWithRed:0.969 green:0.969 blue:0.969 alpha:1]
#define BACKGROUND_BORDER_WIDTH 0.5
#define SELECTED_BORDER_WIDTH 0.5
#define SELECT_TRIANGLE_CLIP_SIZE 16
@implementation CartItemCell



// 从nib文件中加载的对象和关联的对象都已经链接完成(比如.IBOutlet)时,view会调用一次这个方法. 这里就是进行subview初始化的合适地方
- (void)awakeFromNib{
	[super awakeFromNib];
	[self.thumbView addBorder];
	[self.oldPriceLabel addBorderAtMid];
	self.backgroundView = [[UIView alloc] initWithFrame:self.contentView.frame];
	self.backgroundView.layer.borderWidth = BACKGROUND_BORDER_WIDTH;
	self.backgroundView.layer.borderColor =  NORMAL_BORDER_COLOR.CGColor;
	[self enabledSelectEffect];

}

- (void)enabledSelectEffect{
	
	self.selectedBackgroundView = [[UIView alloc] initWithFrame:self.contentView.frame];
	// 右上角的小三角 16x16
	UIBezierPath* path = [UIBezierPath bezierPath];
	[path moveToPoint:CGPointMake(0,0)];
	[path addLineToPoint:CGPointMake(0,SELECT_TRIANGLE_CLIP_SIZE)];
	[path addLineToPoint:CGPointMake(SELECT_TRIANGLE_CLIP_SIZE,SELECT_TRIANGLE_CLIP_SIZE)];
	[path closePath];
	
	CAShapeLayer* layer = [CAShapeLayer layer];
	layer.backgroundColor =BACKGROUND_COLOR.CGColor;
	layer.frame =CGRectMake(self.contentView.bounds.size.width-SELECT_TRIANGLE_CLIP_SIZE, 0, SELECT_TRIANGLE_CLIP_SIZE, SELECT_TRIANGLE_CLIP_SIZE);
	layer.path = [path CGPath];
	[layer setFillColor: SELECTED_COLOR.CGColor];
	[layer setStrokeColor:SELECTED_COLOR.CGColor];
	[layer setLineWidth:1]; // 如果设置为1px会出现锯齿.
	[layer setLineJoin:kCALineJoinBevel];
	
	// 作为选中时的背景边框. 因为直接给selectedBackgroundView设置边框会导致selectedBackgroundView的sublayer遮不住selectedBackgroundView的边框
	// 换言之, calayer的相互层叠只在两个同级layer间有效. 父子layer的情况,父级layer的边框始终可见
	CALayer* selectedBorderLayer = [CALayer layer];
	selectedBorderLayer.borderWidth = SELECTED_BORDER_WIDTH;
	selectedBorderLayer.borderColor = SELECTED_COLOR.CGColor;
	selectedBorderLayer.frame = self.selectedBackgroundView.frame;
	[self.selectedBackgroundView.layer addSublayer:selectedBorderLayer];
	[self.selectedBackgroundView.layer addSublayer:layer];
}


- (void)disableSelectEffect{
	self.selectedBackgroundView = nil;
}
@end
