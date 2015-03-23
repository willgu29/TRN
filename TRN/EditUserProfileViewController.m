//
//  EditUserProfileViewController.m
//  TRN
//
//  Created by William Gu on 3/16/15.
//  Copyright (c) 2015 William Gu. All rights reserved.
//

#import "EditUserProfileViewController.h"

@interface EditUserProfileViewController ()

@end

@implementation EditUserProfileViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"Edit Profile";
}
-(void)viewWillAppear:(BOOL)animated
{
    self.navigationController.navigationBarHidden = NO;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
