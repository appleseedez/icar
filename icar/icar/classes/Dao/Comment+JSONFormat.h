//
//  Comment+JSONFormat.h
//  icar
//
//  Created by Pharaoh on 13-3-29.
//  Copyright (c) 2013年 365icar. All rights reserved.
//

#import "Comment.h"

@interface Comment (JSONFormat)
+ (Comment*) commentWithJSONFormatInfo:(NSDictionary*) jsonInfo
				inManagedObjectContext:(NSManagedObjectContext*)context;
@end
