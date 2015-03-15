//
//  LoginViewController.m
//  TRN
//
//  Created by William Gu on 3/15/15.
//  Copyright (c) 2015 William Gu. All rights reserved.
//

#import "LoginViewController.h"
#import "SetupViewController.h"

@interface LoginViewController ()

@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(IBAction)loginWithFB:(UIButton *)sender
{
    SetupViewController *setupVC = [[SetupViewController alloc] initWithNibName:@"SetupViewController" bundle:nil];
    [self presentViewController:setupVC animated:YES completion:nil];
}
-(IBAction)createAccount:(UIButton *)sender
{
    
}
@end
