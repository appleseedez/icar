//
//  GEOGoodiesIndexTests.m
//  icar
//
//  Created by Pharaoh on 13-3-26.
//  Copyright (c) 2013年 365icar. All rights reserved.
//

#import "GEOGoodiesIndexTests.h"

@implementation GEOGoodiesIndexTests
- (void) testFetchIndexFromServer{
	/*
	  描述: \
	 1. 从服务端异步加载全部商品索引.保存到本地
	 2. 根据当前用户位置计算商品和用户的距离, 按照距离由近到远排序后展示
	 3. 用户修改排序规则. 本地数据排序
	 4. 用户刷新,先向服务器发一次head查看当前索引版本是否有更新.有则重新下载索引.
	 */
	
}
- (void) testFetchIndexFromCoreData{
	
}
@end
