//
//  ViewController.h
//  Acronym
//
//  Created by Surendra.Singh on 10/8/15.
//  Copyright (c) 2015 Surendra.Singh. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface ViewController : UIViewController

@property (weak, nonatomic) IBOutlet UITextField *searchTextField;
- (IBAction)searchButtonPressed:(UIButton *)sender;

@end

