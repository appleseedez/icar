//
//  CoreDataManager.h
//  icar
//
//  Created by Pharaoh on 13-3-26.
//  Copyright (c) 2013年 365icar. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CoreDataManager : NSObject
@property(nonatomic,readonly) UIManagedDocument* managedDocument;
+ (CoreDataManager*) share;
@property(nonatomic) int instanceCount;
@end
