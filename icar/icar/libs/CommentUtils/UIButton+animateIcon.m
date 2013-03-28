//
//  UIButton+animateIcon.m
//  geoy
//
//  Created by Pharaoh on 13-3-17.
//  Copyright (c) 2013年 geoy. All rights reserved.
//

#import "UIButton+animateIcon.h"

@implementation UIButton (animateIcon)
/*
 让按钮能够像activityIndicator一样播放操作正在进行动画
 */
- (void) cosplayActivityIndicator{
	UIImage* animateFrame0 = [UIImage imageNamed:@"search-refresh"];
	UIImage* animateFrame1 = [UIImage imageNamed:@"search-refresh01"];
	UIImage* animateFrame2 = [UIImage imageNamed:@"search-refresh02"];
	UIImage* animateFrame3 = [UIImage imageNamed:@"search-refresh03"];
	UIImage* animateFrame4 = [UIImage imageNamed:@"search-refresh04"];
	UIImage* animateFrame5 = [UIImage imageNamed:@"search-refresh05"];
	UIImage* animateFrame6 = [UIImage imageNamed:@"search-refresh06"];
	UIImage* animateFrame7 = [UIImage imageNamed:@"search-refresh07"];
	self.imageView.animationImages =@[animateFrame0,animateFrame0,animateFrame0,animateFrame0,animateFrame0,animateFrame1,animateFrame1,animateFrame1,animateFrame1,animateFrame1,animateFrame2,animateFrame2,animateFrame2,animateFrame2,animateFrame2,animateFrame3,animateFrame3,animateFrame3,animateFrame3,animateFrame3,animateFrame4,animateFrame4,animateFrame4,animateFrame4,animateFrame4,animateFrame5,animateFrame5,animateFrame5,animateFrame5,animateFrame5,animateFrame6,animateFrame6,animateFrame6,animateFrame6,animateFrame6,animateFrame7,animateFrame7,animateFrame7,animateFrame7,animateFrame7,animateFrame0,animateFrame0,animateFrame0,animateFrame0,animateFrame0];
	self.imageView.animationDuration = 1;
}

- (void)stepByStepButton{

}
@end
