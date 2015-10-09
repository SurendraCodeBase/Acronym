//
//  AcronymsTableViewController.m
//  Acronym
//
//  Created by Surendra.Singh on 10/8/15.
//  Copyright (c) 2015 Surendra.Singh. All rights reserved.
//

#import "AcronymsTableViewController.h"

@interface AcronymsTableViewController ()

@end

@implementation AcronymsTableViewController
@synthesize recievedData;
- (void)viewDidLoad {
    [super viewDidLoad];
    
  
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // Return the number of rows in the section.
    
    if (recievedData.count > 0){
    NSDictionary *acronyms = [recievedData objectAtIndex:0];
    NSArray * acronym = [acronyms objectForKey:@"lfs"];
    return acronym.count;
    }else{
        return  0;
    }
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    
    // Configure the cell...
    
    // Return the number of rows in the section.
    NSDictionary *acronyms = [recievedData objectAtIndex:0];
    NSArray * acronym = [acronyms objectForKey:@"lfs"];
    NSDictionary *item = [acronym objectAtIndex:indexPath.row];
    cell.textLabel.text = [item objectForKey:@"lf"];
    
    return cell;
}




@end
