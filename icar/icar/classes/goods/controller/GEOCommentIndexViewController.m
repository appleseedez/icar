//
//  GEOCommentViewController.m
//  icar
//
//  Created by Pharaoh on 13-3-29.
//  Copyright (c) 2013年 365icar. All rights reserved.
//

#import "GEOCommentIndexViewController.h"
#import "CommentCell.h"
#import "GEODataFetcher.h"
#import "Comment+JSONFormat.h"
@interface GEOCommentIndexViewController ()
@property (nonatomic) BOOL lock; // 防止多次调用useDoument导致多次打开UIDocument的错误
@end

@implementation GEOCommentIndexViewController

- (void)viewWillAppear:(BOOL)animated{
	[super viewWillAppear:animated];
	if (self.iCarDatabase == nil) {
		self.iCarDatabase = [[CoreDataManager share] managedDocument];
	}
	self.lock = NO;
	[self useDocument];
}


#pragma mark - setup the FetchResultController
-(void) setupFetchResultController{
	NSFetchRequest* fetchAllServiceRequest = [NSFetchRequest fetchRequestWithEntityName:@"Comment"];
	//create a time predicate here
	
	fetchAllServiceRequest.sortDescriptors = @[[NSSortDescriptor sortDescriptorWithKey:@"commentor" ascending:YES]];
	
	
	self.fetchedResultsController = [[NSFetchedResultsController alloc] initWithFetchRequest:fetchAllServiceRequest managedObjectContext:self.iCarDatabase.managedObjectContext sectionNameKeyPath:nil cacheName:nil];
}

#define JSON_URL_COMMENT @"https://api.mongolab.com/api/1/databases/yangche-geo/collections/comments?apiKey=1gdxdp157X9xPkkGHFsH4MYBWWYaS37o"
#pragma mark - fetch from server
- (void) fetchDataFromServer{
	
	NSURLRequest* request = [NSURLRequest requestWithURL:[NSURL URLWithString:JSON_URL_COMMENT]];
	[GEODataFetcher fetchDataWithURL:request success:^(NSURLRequest *request, NSHTTPURLResponse *response, id JSON) {
		// 由于取数据成功后,当前block会在main_queue执行.而接下来要做的是数据保存操作.所以另起一个queue
		dispatch_queue_t dataPersistQ = dispatch_queue_create("Persist Comment Index Data Queue", NULL);
		dispatch_async(dataPersistQ, ^{
			NSDictionary* commentIndexData = JSON;
			
			[self.iCarDatabase.managedObjectContext performBlock:^{
				for (NSDictionary* dataItem in commentIndexData) {
					[Comment commentWithJSONFormatInfo:dataItem inManagedObjectContext:self.iCarDatabase.managedObjectContext];
				}
				// 完成数据插入. 保存
				[self.iCarDatabase saveToURL:self.iCarDatabase.fileURL forSaveOperation:UIDocumentSaveForOverwriting completionHandler:^(BOOL success) {
					dispatch_async(dispatch_get_main_queue(), ^{
						
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
#pragma  mark - open database document
- (void) useDocument{
	if (self.lock) {
		return;
	}
	self.lock = YES;
	
	if (![[NSFileManager defaultManager] fileExistsAtPath:[self.iCarDatabase.fileURL path]]) {
		[self.iCarDatabase saveToURL:self.iCarDatabase.fileURL forSaveOperation:UIDocumentSaveForCreating completionHandler:^(BOOL success) {
			self.lock = NO;
			// 设置好FetchResultController 等待数据变化
			[self setupFetchResultController];
			// 因为是首次打开,所以需要去服务端取
			[self fetchDataFromServer];
		}];
	}else if (self.iCarDatabase.documentState == UIDocumentStateClosed){
		[self.iCarDatabase openWithCompletionHandler:^(BOOL success) {
			self.lock = NO;
			// 设置好FetchResultController 等待数据变化
			[self setupFetchResultController];
			
			[self fetchDataFromServer];
		}];
	}else if (self.iCarDatabase.documentState == UIDocumentStateNormal){
		// 设置好FetchResultController 等待数据变化
		[self setupFetchResultController];
		
	}
}


#pragma mark - tableview datasource
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"CommentCell";
    CommentCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
   
    if (nil == cell) {
		cell = [[CommentCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
	}
    Comment* comment = [self.fetchedResultsController objectAtIndexPath:indexPath];
	cell.nameLabel.text = comment.commentor;
	cell.comentLabel.text = comment.body;
	[cell.comentLabel sizeToFit];
	
	[cell.thumbView setImageWithURL:[NSURL URLWithString:comment.thumb] placeholderImage:[UIImage imageNamed:@"index-thumb"]];
	
	return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
	
	float prototypeHeight = 58.0f;
	NSString* commentBody = [[self.fetchedResultsController objectAtIndexPath:indexPath] body];
	CGSize bodySize = [commentBody sizeWithFont:[UIFont systemFontOfSize:10] constrainedToSize:CGSizeMake(242.0f, 1000.0f) lineBreakMode:NSLineBreakByCharWrapping];
	if (bodySize.height>21.0f) {
		return prototypeHeight + bodySize.height -21.0 + 6.0;
	}else{
		return prototypeHeight;
	}
}






- (void)close:(UIButton *)closeButtion{
	[self dismissViewControllerAnimated:YES completion:nil];
}

@end
