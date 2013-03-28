//
//  UIStoryboardSegue+TopLevelViewController.m
//  geoy
//
//  Created by Pharaoh on 13-3-23.
//  Copyright (c) 2013年 geoy. All rights reserved.
//

#import "UIStoryboardSegue+TopLevelViewController.h"

@implementation UIStoryboardSegue (TopLevelViewController)
- (id)topLevelDestinationViewController{
	id destinationController = self.destinationViewController;
	if ([destinationController isKindOfClass:[UINavigationController class]]) {
		UINavigationController* navigationController = destinationController;
		destinationController = navigationController.topViewController;
	}
	return  destinationController;
}
@end
