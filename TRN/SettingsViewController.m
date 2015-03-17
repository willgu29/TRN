//
//  SettingsViewController.m
//  TRN
//
//  Created by William Gu on 3/16/15.
//  Copyright (c) 2015 William Gu. All rights reserved.
//

#import "SettingsViewController.h"
#import "AboutUsViewController.h"
#import "FeedbackViewController.h"

@interface SettingsViewController ()

@end

@implementation SettingsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

-(void)viewWillAppear:(BOOL)animated
{
    self.navigationController.navigationBarHidden = NO;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark -IBActions
-(IBAction)about:(UIButton *)sender
{
    AboutUsViewController *aboutVC = [[AboutUsViewController alloc] initWithNibName:@"AboutUsViewController" bundle:nil];
    [self.navigationController pushViewController:aboutVC animated:YES];
}
-(IBAction)feedback:(UIButton *)sender
{
    FeedbackViewController *feedbackVC = [[FeedbackViewController alloc] initWithNibName:@"FeedbackViewController" bundle:nil];
}

@end
