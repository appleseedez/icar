//
//  GEOGoodsIndexDataFetcher.h
//  icar
//
//  Created by Pharaoh on 13-3-27.
//  Copyright (c) 2013年 365icar. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface GEOGoodsIndexDataFetcher : NSObject
+ (void) fetchDataWithURL:(NSURLRequest *)urlRequest
						   success:(void (^)(NSURLRequest *request, NSHTTPURLResponse *response, id JSON))success
						   failure:(void (^)(NSURLRequest *request, NSHTTPURLResponse *response, NSError *error, id JSON))failure;
@end
