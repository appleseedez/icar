//
//  GEOGoodsIndexDataFetcher.m
//  icar
// 从服务器取列表数据
//  Created by Pharaoh on 13-3-27.
//  Copyright (c) 2013年 365icar. All rights reserved.
//

#import "GEOGoodsIndexDataFetcher.h"

@implementation GEOGoodsIndexDataFetcher
+ (void)fetchDataWithURL:(NSURLRequest *)urlRequest success:(void (^)(NSURLRequest *, NSHTTPURLResponse *, id))success failure:(void (^)(NSURLRequest *, NSHTTPURLResponse *, NSError *, id))failure{
	AFJSONRequestOperation* operation=[AFJSONRequestOperation JSONRequestOperationWithRequest:urlRequest success:success failure:failure];
	[operation start];
}
@end
