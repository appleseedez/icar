//
//  UIViewController+LoginManager.h
//  icar
//
//  Created by Pharaoh on 13-4-8.
//  Copyright (c) 2013年 365icar. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIViewController (LoginManager)
- (void) checkLoginWithSuccessBlock:(void(^)(void)) success
						  failBlock:(void(^)(void)) failure;
@end
