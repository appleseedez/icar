//
//  Goody+JSONFormat.h
//  icar
//
//  Created by Pharaoh on 13-3-27.
//  Copyright (c) 2013年 365icar. All rights reserved.
//

#import "Goody.h"

@interface Goody (JSONFormat)
+ (Goody *)goodsWithJSONFormatInfo:(NSDictionary *)jsonInfo
			inManagedObjectContext:(NSManagedObjectContext *)context
					   AndLocation:(CLLocation*)currentLocation;

+ (void) updateDistanceInContext:(NSManagedObjectContext*) context
					 rangePredicate:(double) range
				  toCurrentLocation:(CLLocation*) currentLocation
						   fromLastLocation:(CLLocation*) lastLocation;
@end

