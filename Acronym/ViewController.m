//
//  ViewController.m
//  Acronym
//
//  Created by Surendra.Singh on 10/8/15.
//  Copyright (c) 2015 Surendra.Singh. All rights reserved.
//

#import "ViewController.h"
#import "AcronymsTableViewController.h"
#import "Constants.h"
#import "AFNetworking.h"
#import "MBProgressHUD.h"



@interface ViewController (){
   
 
}


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    // Do any additional setup after loading the view, typically from a nib.
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)searchButtonPressed:(UIButton *)sender {
    
    [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    
    if (self.searchTextField.text.length > 0) {
   
           NSString *string = [NSString stringWithFormat:@"%@?sf=%@", acronymURLString,self.searchTextField.text];
    NSURL *url = [NSURL URLWithString:string];
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc ] initWithURL:url];
    [request setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
    [request setHTTPMethod:@"GET"];
    
    AFHTTPRequestOperation *operation = [[AFHTTPRequestOperation alloc] initWithRequest:request];
    operation.responseSerializer = [AFJSONResponseSerializer serializer];
    operation.responseSerializer.acceptableContentTypes = [NSSet setWithObject:@"text/plain"];
    
    [operation setCompletionBlockWithSuccess:^(AFHTTPRequestOperation *operation, id responseObject) {
        
 
        
        [self showListOfAcronym:  (NSArray *)responseObject];
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        
    }];
    
    // 5
    [operation start];
}

}

-(void)showListOfAcronym:(NSArray*)data{
   
    UIStoryboard * mainStoryboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    AcronymsTableViewController *acronymsTableViewController = (AcronymsTableViewController*)[mainStoryboard instantiateViewControllerWithIdentifier:@"AcronymsTableViewController"];
    acronymsTableViewController.recievedData = data;
    
    [self.navigationController pushViewController:acronymsTableViewController animated:true];
    [MBProgressHUD hideHUDForView:self.view animated:YES];


}
@end
