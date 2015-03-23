//
//  EventFeedViewController.m
//  TRN
//
//  Created by William Gu on 3/15/15.
//  Copyright (c) 2015 William Gu. All rights reserved.
//

#import "EventFeedViewController.h"
#import "SettingsViewController.h"
#import "Router.h"
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

#pragma mark - UITableView Delegate
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 1;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *simpleTableIdentifier = [NSString stringWithFormat:@"%ld_%ld", (long)indexPath.section, (long)indexPath.row];
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:simpleTableIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:simpleTableIdentifier];
        
    }
    cell.textLabel.text = @"HI";
    
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [self presentUserProfileVC:@"Will Gu"];
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}


#pragma mark - Helper Functions
-(void)presentUserProfileVC:(NSString *)username
{
    UIViewController *userProfileVC = [Router createUserProfileVCWithUsername:username];
    [self.navigationController pushViewController:userProfileVC animated:YES];
}

@end
