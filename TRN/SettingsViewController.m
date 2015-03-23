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
#import "ResourcesViewController.h"
#import "EditUserProfileViewController.h"

@interface SettingsViewController ()

@end

@implementation SettingsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"Settings";
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
-(IBAction)editProfile:(UIButton *)sender
{
    EditUserProfileViewController *editVC = [[EditUserProfileViewController alloc] initWithNibName:@"EditUserProfileViewController" bundle:nil];
    [self.navigationController pushViewController:editVC animated:YES];
}
-(IBAction)about:(UIButton *)sender
{
    AboutUsViewController *aboutVC = [[AboutUsViewController alloc] initWithNibName:@"AboutUsViewController" bundle:nil];
    [self.navigationController pushViewController:aboutVC animated:YES];
}
-(IBAction)resources:(UIButton *)sender
{
    ResourcesViewController *resourcesVC = [[ResourcesViewController alloc] initWithNibName:@"ResourcesViewController" bundle:nil];
    [self.navigationController pushViewController:resourcesVC animated:YES];
}
-(IBAction)feedback:(UIButton *)sender
{
    FeedbackViewController *feedbackVC = [[FeedbackViewController alloc] initWithNibName:@"FeedbackViewController" bundle:nil];
    [self.navigationController pushViewController:feedbackVC animated:YES];
}


@end
