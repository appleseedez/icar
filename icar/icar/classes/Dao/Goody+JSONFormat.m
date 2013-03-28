//
//  Goody+JSONFormat.m
//  icar
//
//  Created by Pharaoh on 13-3-27.
//  Copyright (c) 2013年 365icar. All rights reserved.
//

#import "Goody+JSONFormat.h"

@implementation Goody (JSONFormat)
+(Goody *)goodsWithJSONFormatInfo:(NSDictionary *)jsonInfo
		   inManagedObjectContext:(NSManagedObjectContext *)context
					  AndLocation:(CLLocation*) currentLocation{
	Goody* goody = nil;
	
	NSFetchRequest* request=[[NSFetchRequest alloc] initWithEntityName:@"Goody"];
	request.predicate = [NSPredicate predicateWithFormat:@"oid=%@",[[jsonInfo valueForKey:@"_id"] valueForKey:@"$oid"]];
	
	NSError* requestError = nil;
	NSArray* matches = [context executeFetchRequest:request error:&requestError];
	NSAssert(matches!=nil && [matches count]<=1, @"Error from the core data:%@ didn't work",request.predicate.description);
	if([matches count] == 0){
		goody = [NSEntityDescription insertNewObjectForEntityForName:@"Goody" inManagedObjectContext:context];
		goody.oid = [[jsonInfo valueForKey:@"_id"] valueForKey:@"$oid"];
		
		
	}else{
		goody = [matches lastObject];
	}
	goody.name = [jsonInfo valueForKey:@"name"];
	goody.price = [jsonInfo valueForKey:@"price"];
	goody.location =[jsonInfo valueForKey:@"location"];
	goody.thumb = [jsonInfo valueForKey:@"thumb"];
	goody.storeId = [[jsonInfo valueForKey:@"shop_id"] valueForKey:@"$oid"];
	if (currentLocation == nil) {
		goody.distanceFromCurrent = [[NSDecimalNumber alloc] initWithDouble:-1.0f];
	}else{
		double lat = [[goody.location valueForKey:@"lat"] doubleValue];
		double lon = [[goody.location valueForKey:@"long"] doubleValue];
		CLLocation* goodsLocation = [[CLLocation alloc] initWithLatitude:lat longitude:lon];
		goody.distanceFromCurrent = [[NSDecimalNumber alloc] initWithDouble:[goodsLocation distanceFromLocation:currentLocation]*0.001];
	}
	
	return goody;
}


+ (void)updateDistanceInContext:(NSManagedObjectContext *)context rangePredicate:(double)range toCurrentLocation:(CLLocation *)currentLocation fromLastLocation:(CLLocation *)lastLocation
{
	NSAssert(currentLocation != nil, @"当前位置数据未取到"); //
	NSAssert(lastLocation != nil, @"上一次定位的位置未取到");
	double distanceBetweenLastAndCurrentLocation = [currentLocation distanceFromLocation:lastLocation]; // 单位是米
	
	double searchRange = range*1000 + distanceBetweenLastAndCurrentLocation;// range 的单位是公里
	NSError* requestError = nil;
	NSFetchRequest* request = [[NSFetchRequest alloc] initWithEntityName:@"Goody"];
	request.predicate = [NSPredicate predicateWithFormat:@"distanceFromCurrent<=%f",searchRange];
	NSArray* matches = [context executeFetchRequest:request error:&requestError];
	for (Goody* goody in matches) {
		double lat = [[goody.location valueForKey:@"lat"] doubleValue];
		double lon = [[goody.location valueForKey:@"long"] doubleValue];
		CLLocation* goodsLocation = [[CLLocation alloc] initWithLatitude:lat longitude:lon];
		goody.distanceFromCurrent = [[NSDecimalNumber alloc] initWithDouble:[goodsLocation distanceFromLocation:currentLocation]*0.001];
	}

}
@end
