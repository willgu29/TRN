//
//  CreateEventViewController.m
//  TRN
//
//  Created by William Gu on 3/15/15.
//  Copyright (c) 2015 William Gu. All rights reserved.
//

#import "CreateEventViewController.h"
#import "CreateLocalEventViewController.h"
#import "CreatePrivateEventViewController.h"

@interface CreateEventViewController ()

@end

@implementation CreateEventViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

-(void)viewWillAppear:(BOOL)animated
{
    self.navigationController.navigationBarHidden = NO;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(IBAction)local:(UIButton *)sender
{
    CreateLocalEventViewController *localVC = [[CreateLocalEventViewController alloc] initWithNibName:@"CreateLocalEventViewController" bundle:nil];
    [self.navigationController pushViewController:localVC animated:YES];
}
-(IBAction)private:(UIButton *)sender
{
    CreatePrivateEventViewController *privateVC = [[CreatePrivateEventViewController alloc] initWithNibName:@"CreatePrivateEventViewController" bundle:nil];
    [self.navigationController pushViewController:privateVC animated:YES];
}


@end
