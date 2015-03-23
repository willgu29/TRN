//
//  ResourcesViewController.m
//  TRN
//
//  Created by William Gu on 3/22/15.
//  Copyright (c) 2015 William Gu. All rights reserved.
//

#import "ResourcesViewController.h"

@interface ResourcesViewController ()

@end

@implementation ResourcesViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(IBAction)moreResources:(UIButton *)sender
{
    UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Coming Soon!" message:@"Love these facts? Don't worry, we're coming up with a blog with more content. Let us know how these facts have helped you at contact@startruntest.com" delegate:nil cancelButtonTitle:@"Sweet!" otherButtonTitles:nil];
    [alertView show];
}
@end
