//
//  AddReasonsViewController.m
//  TRN
//
//  Created by William Gu on 3/23/15.
//  Copyright (c) 2015 William Gu. All rights reserved.
//

#import "AddReasonsViewController.h"

@interface AddReasonsViewController ()

@property (nonatomic, weak) IBOutlet UITextField *whyMeet;

@end

@implementation AddReasonsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - IBActions

-(IBAction)createEvent:(UIButton *)sender
{
    //TODO: Error Check
    //TODO: Save all data, make parse event
    
}


@end
