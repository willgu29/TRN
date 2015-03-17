//
//  EventFeedViewController.m
//  TRN
//
//  Created by William Gu on 3/15/15.
//  Copyright (c) 2015 William Gu. All rights reserved.
//

#import "EventFeedViewController.h"
#import "SettingsViewController.h"
#import "CreateEventViewController.h"

@interface EventFeedViewController ()

@end

@implementation EventFeedViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}
-(void)viewWillAppear:(BOOL)animated
{
    self.navigationController.navigationBarHidden = YES;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - IBActons

-(IBAction)settings:(UIButton *)sender
{
    SettingsViewController *settingsVC = [[ SettingsViewController alloc] initWithNibName:@"SettingsViewController" bundle:nil];
    [self.navigationController pushViewController:settingsVC animated:YES];
}
-(IBAction)addEvent:(UIButton *)sender
{
    CreateEventViewController *createVC = [[CreateEventViewController alloc] initWithNibName:@"CreateEventViewController" bundle:nil];
    [self.navigationController pushViewController:createVC animated:YES];
}


@end
