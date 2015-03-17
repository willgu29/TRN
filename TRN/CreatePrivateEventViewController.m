//
//  CreatePrivateEventViewController.m
//  TRN
//
//  Created by William Gu on 3/16/15.
//  Copyright (c) 2015 William Gu. All rights reserved.
//

#import "CreatePrivateEventViewController.h"
#import "SendInvitesViewController.h"

@interface CreatePrivateEventViewController ()

@end

@implementation CreatePrivateEventViewController

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
-(IBAction)submit:(UIButton *)sender
{
    SendInvitesViewController *sendVC = [[SendInvitesViewController alloc] initWithNibName:@"SendInvitesViewController" bundle:nil];
    [self.navigationController pushViewController:sendVC animated:YES];
}


@end
