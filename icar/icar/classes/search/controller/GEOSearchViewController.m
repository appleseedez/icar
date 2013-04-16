//
//  GEOSearchViewController.m
//  icar
//
//  Created by Pharaoh on 13-4-14.
//  Copyright (c) 2013年 365icar. All rights reserved.
//

#import "GEOSearchViewController.h"

@interface GEOSearchViewController ()
@property(nonatomic) NSMutableArray* results;
@end

@implementation GEOSearchViewController

- (void)viewWillAppear:(BOOL)animated{
	[super viewWillAppear:animated];
	
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	
	self.results = [NSMutableArray new];

}


#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{

    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{

    // Return the number of rows in the section.
    return [self.results count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    if (nil == cell) {
		cell=[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
	}
    
	
    return cell;
}

- (BOOL)searchDisplayController:(UISearchDisplayController *)controller shouldReloadTableForSearchScope:(NSInteger)searchOption{
	return YES;
}

- (BOOL)searchDisplayController:(UISearchDisplayController *)controller shouldReloadTableForSearchString:(NSString *)searchString{
	return YES;
}
@end
