//
//  coreDataManagerTests.m
//  icar
//
//  Created by Pharaoh on 13-3-26.
//  Copyright (c) 2013年 365icar. All rights reserved.
//

#import "coreDataManagerTests.h"
#import "CoreDataManager.h"
@implementation coreDataManagerTests
- (void)testCoreDataManager
{
	UIManagedDocument* doc = [[CoreDataManager share] managedDocument];
	UIManagedDocument* doc2 = [[CoreDataManager share] managedDocument];
	
	int count = [[CoreDataManager share] instanceCount];
	STAssertEqualObjects(doc, doc2, @"测试多次获取的ManageDocument相同");
	STAssertTrue(count== 1, @"测试CoreManager是单例");
}
@end
