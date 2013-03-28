//
//  GEOGoodsIndexViewController.m
//  icar
//
//  Created by Pharaoh on 13-3-26.
//  Copyright (c) 2013年 365icar. All rights reserved.
//

#import "GEOGoodsIndexViewController.h"
#import "GEOGoodsIndexDataFetcher.h"
#import "Goody+JSONFormat.h"
#import "GoodsIndexCell.h"
@interface GEOGoodsIndexViewController ()
@property (nonatomic,readonly) CLLocationManager* locationManager;
@end

@implementation GEOGoodsIndexViewController
/*
  当列表页面加载时. 检查数据文件是否加载
 */
- (void)viewWillAppear:(BOOL)animated{
	[super viewWillAppear:animated];
	self.searchRange = 50.0f; // 单位公里
	if (self.iCarDatabase == nil) {
		self.iCarDatabase = [[CoreDataManager share] managedDocument];
	}

	// 检测是否开启定位
	if ([CLLocationManager locationServicesEnabled]) {
		self.locationManager.delegate=self;
		[self.locationManager startMonitoringSignificantLocationChanges];
	}else{
		// 没开启定位服务. 在此处开始加载数据
		[self useDocument];
	}
	
	
}

#pragma mark - CLLocation delegate
/*
  for ios5 由于ios5 还是使用的这个方法. 所以做了个转发
 */
-(void)locationManager:(CLLocationManager *)manager didUpdateToLocation:(CLLocation *)newLocation fromLocation:(CLLocation *)oldLocation{
	NSArray* locations;
	if (oldLocation != nil) {
		locations = @[oldLocation,newLocation];
	}else{
		locations = @[newLocation];
	}
	
	[self locationManager:manager didUpdateLocations:locations];
}
/*
  for ios6
 */
- (void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray *)locations{
	[self.locationManager stopMonitoringSignificantLocationChanges];
	NSAssert([locations count]>=1, @"获取当前位置失败了");
	self.currentLocation = [locations lastObject];
	self.lastLocation = [locations objectAtIndex:0];

	[self useDocument];
}


- (void)locationManager:(CLLocationManager *)manager didFailWithError:(NSError *)error{

	NSString* errorMessage = [error localizedFailureReason]?[error localizedFailureReason]:@"定位失败了";	
	NSLog(@"%@",errorMessage);
}
#pragma mark - tableview datasource
/*
 单元格高度80pt
 */
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
	return 80.0f;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"GoodsIndexCell";
    GoodsIndexCell *cell = (GoodsIndexCell*)[tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    if (nil == cell) {
		cell = [[GoodsIndexCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
	}
	Goody* goody = [self.fetchedResultsController objectAtIndexPath:indexPath];

	cell.serviceTitleLabel.text = goody.name;
	cell.priceLabel.text = [NSString stringWithFormat:@"$ %@",goody.price];
	if ([goody.distanceFromCurrent doubleValue]>0) {
		cell.distanceLabel.text = [NSString stringWithFormat:@"%.1f 公里",[goody.distanceFromCurrent doubleValue]];
	}else{
		cell.distanceLabel.text = @"获取位置中...";
	}
	
	[cell.thumbView setImageWithURL:[NSURL URLWithString:goody.thumb] placeholderImage:[UIImage imageNamed:@"index-thumb"]];
    return cell;
}
/*
 其他方法由基类实现
 */

#pragma mark - property
@synthesize locationManager = _locationManager;

- (CLLocationManager *)locationManager{
	if (_locationManager != nil) {
		return _locationManager;
	}
	_locationManager = [CLLocationManager new];
	return _locationManager;
}




#pragma  mark - setup the FetchResultController
-(void) setupFetchResultController{
	[self setupFetchResultControllerAtRange:[[NSDecimalNumber alloc] initWithDouble:100.0f]];
}


- (void) setupFetchResultControllerAtRange:(NSDecimalNumber*) range{
	
	NSFetchRequest* fetchAllServiceRequest = [NSFetchRequest fetchRequestWithEntityName:@"Goody"];
	fetchAllServiceRequest.predicate = [NSPredicate predicateWithFormat:@"distanceFromCurrent <= %@",range];
	fetchAllServiceRequest.sortDescriptors = @[[NSSortDescriptor sortDescriptorWithKey:@"distanceFromCurrent" ascending:YES]];
	
	
	self.fetchedResultsController = [[NSFetchedResultsController alloc] initWithFetchRequest:fetchAllServiceRequest managedObjectContext:self.iCarDatabase.managedObjectContext sectionNameKeyPath:nil cacheName:nil];
}


# pragma mark - fetch from server
/*
 从服务器去取商品列表数据 保存到本地
 */
#define JSON_URL_SERVICE @"https://api.mongolab.com/api/1/databases/yangche-geo/collections/services?apiKey=1gdxdp157X9xPkkGHFsH4MYBWWYaS37o"
- (void) fetchDataFromServer{
	NSURLRequest* request = [NSURLRequest requestWithURL:[NSURL URLWithString:JSON_URL_SERVICE]];
	[GEOGoodsIndexDataFetcher fetchDataWithURL:request success:^(NSURLRequest *request, NSHTTPURLResponse *response, id JSON) {
		// 由于取数据成功后,当前block会在main_queue执行.而接下来要做的是数据保存操作.所以另起一个queue
		dispatch_queue_t dataPersistQ = dispatch_queue_create("Persist Goods Index Data Queue", NULL);
		dispatch_async(dataPersistQ, ^{
			NSDictionary* goodsIndexData = JSON;
			NSLog(@"%@",self.currentLocation);
			[self.iCarDatabase.managedObjectContext performBlock:^{
				for (NSDictionary* dataItem in goodsIndexData) {
					[Goody goodsWithJSONFormatInfo:dataItem inManagedObjectContext:self.iCarDatabase.managedObjectContext AndLocation:self.currentLocation];
				}
				// 完成数据插入. 保存
				[self.iCarDatabase saveToURL:self.iCarDatabase.fileURL forSaveOperation:UIDocumentSaveForOverwriting completionHandler:^(BOOL success) {
					dispatch_async(dispatch_get_main_queue(), ^{
						//停止加载指示的动画
					});
				}];
			}];
			
		});
	} failure:^(NSURLRequest *request, NSHTTPURLResponse *response, NSError *error, id JSON) {
		NSString* errorMessage = [error localizedFailureReason]?[error localizedFailureReason]:@"取GoodsIndex数据失败";
		#pragma mark - debug
		NSLog(@"%@",errorMessage);
	}];
}

#pragma  mark - update distance task
/*
  更新商品距离用户的数据
 */
- (void)updateDistanceToCurrentLocation:(CLLocation*) currentLocation
					   fromLastLocation:(CLLocation*) lastLocation{
	[self updateDistanceToCurrentLocation:currentLocation fromLastLocation:lastLocation forRange:self.searchRange];
}

- (void) updateDistanceToCurrentLocation:(CLLocation*) currentLocation
						fromLastLocation:(CLLocation*) lastLocation
								forRange:(double)range
{
	if (currentLocation != nil) {
		dispatch_queue_t dataUpdateQ= dispatch_queue_create("Update Goods Index Data Queue", NULL);
		dispatch_async(dataUpdateQ, ^{
			//更新距离
			[self.iCarDatabase.managedObjectContext performBlock:^{
				[Goody updateDistanceInContext:self.iCarDatabase.managedObjectContext rangePredicate:range toCurrentLocation:currentLocation fromLastLocation:lastLocation];
				
			}];
		});
			
	}

}

/*
  打开coredata数据存储
 */
#pragma  mark - open database document
- (void) useDocument{
	if (![[NSFileManager defaultManager] fileExistsAtPath:[self.iCarDatabase.fileURL path]]) {
		[self.iCarDatabase saveToURL:self.iCarDatabase.fileURL forSaveOperation:UIDocumentSaveForCreating completionHandler:^(BOOL success) {
			// 设置好FetchResultController 等待数据变化
			[self setupFetchResultController];
			// 因为是首次打开,所以需要去服务端取
			[self fetchDataFromServer];
		}];
	}else if (self.iCarDatabase.documentState == UIDocumentStateClosed){
		[self.iCarDatabase openWithCompletionHandler:^(BOOL success) {
			// 设置好FetchResultController 等待数据变化
			[self setupFetchResultController];
			[self updateDistanceToCurrentLocation:self.currentLocation fromLastLocation:self.lastLocation];
		}];
	}else if (self.iCarDatabase.documentState == UIDocumentStateNormal){
		// 设置好FetchResultController 等待数据变化
		[self setupFetchResultController];
		[self updateDistanceToCurrentLocation:self.currentLocation fromLastLocation:self.lastLocation];
	}
}

@end
