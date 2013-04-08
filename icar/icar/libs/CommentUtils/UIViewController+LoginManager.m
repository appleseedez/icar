//
//  UIViewController+LoginManager.m
//  icar
//
//  Created by Pharaoh on 13-4-8.
//  Copyright (c) 2013年 365icar. All rights reserved.
//

#import "UIViewController+LoginManager.h"
#import "GEOLoginViewController.h"
@implementation UIViewController (LoginManager)
- (void)checkLoginWithSuccessBlock:(void (^)(void))success failBlock:(void (^)(void))failure{
	NSAssert(success != nil, @"登錄成功回調函數不能為空");
	// 檢查用戶是否已經登錄
	if (YES ) {
		success();
	}else{
		[self presentViewController:[[UIStoryboard storyboardWithName:@"GEOLogin" bundle:nil] instantiateInitialViewController] animated:YES completion:^{
			
			if ([self.presentedViewController isKindOfClass:[UINavigationController class]]) {
				UINavigationController* loginNavController = (UINavigationController*)  self.presentedViewController;
				
				[(GEOLoginViewController*)loginNavController.topViewController setSuccessBlock:success];
				[(GEOLoginViewController*) loginNavController.topViewController setFailureBlock:failure];
			}
		}];
	}
	
}

@end
