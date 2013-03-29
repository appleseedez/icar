//
//  Comment.h
//  icar
//
//  Created by Pharaoh on 13-3-29.
//  Copyright (c) 2013年 365icar. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface Comment : NSManagedObject

@property (nonatomic, retain) NSString * commentor;
@property (nonatomic, retain) NSString * thumb;
@property (nonatomic, retain) NSString * body;
@property (nonatomic, retain) NSNumber * score;
@property (nonatomic, retain) NSDate * createDate;
@property (nonatomic, retain) NSString * goodyId;
@property (nonatomic, retain) NSString * oid;

@end
