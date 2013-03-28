//
//  Goody.h
//  icar
//
//  Created by Pharaoh on 13-3-28.
//  Copyright (c) 2013年 365icar. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface Goody : NSManagedObject

@property (nonatomic, retain) NSDecimalNumber * distanceFromCurrent;
@property (nonatomic, retain) id location;
@property (nonatomic, retain) NSString * name;
@property (nonatomic, retain) NSString * oid;
@property (nonatomic, retain) NSDecimalNumber * price;
@property (nonatomic, retain) NSString * storeId;
@property (nonatomic, retain) NSString * thumb;

@end
