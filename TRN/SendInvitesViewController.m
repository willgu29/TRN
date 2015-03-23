//
//  SendInvitesViewController.m
//  TRN
//
//  Created by William Gu on 3/17/15.
//  Copyright (c) 2015 William Gu. All rights reserved.
//

#import "SendInvitesViewController.h"

@interface SendInvitesViewController ()

@property (nonatomic, strong) ContactListFetcher *contactFetcher;

@end

@implementation SendInvitesViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _contactFetcher = [[ContactListFetcher alloc] init];
    _contactFetcher.delegate = self;
    
}
-(void)viewWillAppear:(BOOL)animated
{
    [self something];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - TableView Delegate
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

#pragma mark - Helper functions
-(void)something
{
    if([_contactFetcher isAppAuthorizedToGetContactList])
    {
        NSArray *contactList = [_contactFetcher getContactList];
        NSLog(@"Contact List :%@" ,contactList);
    }
    else
    {
        [_contactFetcher requestAccessToContactList];
    }
}

-(void)contactListAccessGranted
{
    NSArray *contactList = [_contactFetcher getContactList];
    NSLog(@"On Access: %@", contactList);
}
-(void)contactListAccessDenied:(NSError *)error
{
    [[[UIAlertView alloc] initWithTitle:nil message:@"This app requires access to your contacts to function properly. Please visit to the \"Privacy\" section in the iPhone Settings app." delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil] show];
}


@end
