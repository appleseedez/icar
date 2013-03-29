//
//  CoreDataManager.m
//  icar
//
//  Created by Pharaoh on 13-3-26.
//  Copyright (c) 2013年 365icar. All rights reserved.
//

#import "CoreDataManager.h"
#define DB_NAME @"GEO_iCar_DB"
static CoreDataManager* _coreDataManagerInstance;
@implementation CoreDataManager

+ (void)initialize{
	NSAssert(self==[CoreDataManager class], @"Singleton! NOT for subclass");
	_coreDataManagerInstance = [CoreDataManager new];
}

+ (CoreDataManager *)share{
	return _coreDataManagerInstance;
}

@synthesize managedDocument = _managedDocument;
#pragma mark - getter
- (UIManagedDocument *)managedDocument{
	if (_managedDocument == nil) {
		self.instanceCount +=1;
		NSAssert(self.instanceCount <=1, @"oops,another managedDocument been created");
		_managedDocument = [[UIManagedDocument alloc] initWithFileURL:[[self applicationDocumentsDirectory] URLByAppendingPathComponent:DB_NAME]];
	}

	return _managedDocument;
}


#pragma mark - util method
// 获取数据文件保存目录. 总是在应用的Document目录下
- (NSURL *)applicationDocumentsDirectory{
	return [[[NSFileManager defaultManager] URLsForDirectory:NSCachesDirectory inDomains:NSUserDomainMask] lastObject];
}
@end
