//
//  Comment+JSONFormat.m
//  icar
//
//  Created by Pharaoh on 13-3-29.
//  Copyright (c) 2013年 365icar. All rights reserved.
//

#import "Comment+JSONFormat.h"

@implementation Comment (JSONFormat)
+ (Comment *)commentWithJSONFormatInfo:(NSDictionary *)jsonInfo inManagedObjectContext:(NSManagedObjectContext *)context{
	Comment* comment = nil;
	NSFetchRequest* request = [[NSFetchRequest alloc] initWithEntityName:@"Comment"];
	request.predicate = [NSPredicate predicateWithFormat:@"oid=%@",[[jsonInfo valueForKey:@"_id"] valueForKey:@"$oid"]];
	
	NSError* requestError = nil;
	NSArray* matches = [context executeFetchRequest:request error:&requestError];
	NSAssert(matches!=nil && [matches count]<=1, @"Error from the core data:%@ didn't work",request.predicate.description);
	if([matches count] == 0){
		comment = [NSEntityDescription insertNewObjectForEntityForName:@"Comment" inManagedObjectContext:context];
		comment.oid = [[jsonInfo valueForKey:@"_id"] valueForKey:@"$oid"];
		
		
	}else{
		comment = [matches lastObject];
	}
	comment.commentor = [jsonInfo valueForKey:@"commentor"];
	comment.body = [jsonInfo valueForKey:@"body"];
	comment.score =[jsonInfo valueForKey:@"score"];
	comment.thumb = [jsonInfo valueForKey:@"thumb"];
	comment.goodyId = [[jsonInfo valueForKey:@"goody_id"] valueForKey:@"$oid"];
	
	return comment;
}
@end
