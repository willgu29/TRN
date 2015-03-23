//
//  LoginViewController.m
//  TRN
//
//  Created by William Gu on 3/15/15.
//  Copyright (c) 2015 William Gu. All rights reserved.
//

#import "LoginViewController.h"
#import "SetupViewController.h"
#import "EventFeedViewController.h"
#import <FacebookSDK/FacebookSDK.h>
#import <ParseFacebookUtils/PFFacebookUtils.h>
#import <Parse/Parse.h>
#import "ParseUserValues.h"
#import "NSUserDefaultValues.h"

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
    
    [PFFacebookUtils logInWithPermissions:[self getFBPermissions] block:^(PFUser *user, NSError *error) {
        if (!user) {
            [self displayPleaseLoginAlert];
        } else if (user.isNew) {
            [self getAndSaveFBDataForParseUserInCallback];
            [self segueToSetupViewController];
        } else {
            [self segueToMainViewController];
        }
    }];

}
-(IBAction)createAccount:(UIButton *)sender
{
    
}
#pragma mark - Helper functions
-(NSArray *)getFBPermissions
{
    return @[@"public_profile", @"email", @"user_friends", @"user_likes", @"user_birthday", @"user_interests"];
}
-(void)getAndSaveFBDataForParseUserInCallback
{
    [FBRequestConnection startForMeWithCompletionHandler:^(FBRequestConnection *connection, id result, NSError *error) {
        if (!error) {
            [self saveFBDataToParseUser:result];
        } else {
            // An error occurred, we need to handle the error
            // See: https://developers.facebook.com/docs/ios/errors
        }
    }];
}
-(void)saveFBDataToParseUser:(id)userInfo
{
    PFUser *currentUser = [PFUser currentUser];
    currentUser[U_FB_ID] = [userInfo valueForKey:@"id"];
    currentUser[U_DEVICE_TOKEN] = [[NSUserDefaults standardUserDefaults] stringForKey:N_DEVICE_TOKEN_STRING];
    currentUser[U_EMAIL] = [userInfo valueForKey:@"email"];
    currentUser[U_FIRST_NAME] = [userInfo valueForKey:@"first_name"];
    currentUser[U_LAST_NAME] = [userInfo valueForKey:@"last_name"];
    currentUser[U_FULL_NAME] = [userInfo valueForKey:@"name"];
    currentUser[U_BIRTHDAY] = [userInfo valueForKey:@"birthday"];
    currentUser[U_GENDER] = [userInfo valueForKey:@"gender"];
    currentUser[U_WARNINGS_GIVEN] = [NSNumber numberWithInt:0];
    [currentUser saveInBackground];
}
-(void)displayPleaseLoginAlert
{
    UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Uh oh.." message:@"Please login through facebook to continue!" delegate:nil cancelButtonTitle:@"Okay!" otherButtonTitles:nil];
    [alertView show];
}
-(void)segueToSetupViewController
{
    SetupViewController *setupVC = [[SetupViewController alloc] initWithNibName:@"SetupViewController" bundle:nil];
    [self presentViewController:setupVC animated:YES completion:nil];
}
-(void)segueToMainViewController
{
    EventFeedViewController *eventVC = [[EventFeedViewController alloc] initWithNibName:@"EventFeedViewController" bundle:nil];
    [self presentViewController:eventVC animated:YES completion:nil];
}

@end
