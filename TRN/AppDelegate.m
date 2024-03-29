//
//  AppDelegate.m
//  TRN
//
//  Created by William Gu on 3/15/15.
//  Copyright (c) 2015 William Gu. All rights reserved.
//

#import "AppDelegate.h"
#import "EventFeedViewController.h"
#import "LoginViewController.h"
#import <Parse/Parse.h>
#import "NSDataConvert.h"
#import "ParseUserValues.h"
#import <ParseFacebookUtils/PFFacebookUtils.h>
#import <FacebookSDK/FacebookSDK.h>
#import "NSUserDefaultValues.h"
#import "Router.h"
#import "Location.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    [self setupParse:application withLaunchOptions:launchOptions];
    [self linkParseWithFacebook];
    [self setupPushNotifications:application];
    [self setupWindowWithRootViewController:[self getRootViewController]];
    [self getUserLocation];
    return YES;
}

#pragma mark - Register Location 


-(void)getUserLocation
{
    [[Location shared] updateUserLocation];
}

#pragma mark - Register Push Notifications
- (void)application:(UIApplication *)application didRegisterForRemoteNotificationsWithDeviceToken:(NSData *)deviceToken {

    [self saveDeviceTokenToParseAndUserDefaults:deviceToken];
    if ([self isLoggedIn])
    {
        
        [self updateParseCurrentUserDeviceToken:[deviceToken hexadecimalString]];
    }
}


- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    
    // Logs 'install' and 'app activate' App Events.
    [FBAppEvents activateApp];
    [FBAppCall handleDidBecomeActiveWithSession:[PFFacebookUtils session]];
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

- (BOOL)application:(UIApplication *)application
            openURL:(NSURL *)url
  sourceApplication:(NSString *)sourceApplication
         annotation:(id)annotation {
    
    // attempt to extract a token from the url
    return [FBAppCall handleOpenURL:url
                  sourceApplication:sourceApplication
                        withSession:[PFFacebookUtils session]];
}

#pragma mark - Helper functions

-(void)getUserLocationCoordinates
{
    //TODO: Get user location coordinates
}

-(void)linkParseWithFacebook
{
    [PFFacebookUtils initializeFacebook];
}

-(void)saveDeviceTokenToParseAndUserDefaults:(NSData *)deviceToken
{
    [self saveDeviceTokenToParse:deviceToken];
    [self saveDeviceTokenToUserDefaults:deviceToken withKey:N_DEVICE_TOKEN_DATA];
    [self saveDeviceTokenToUserDefaults:[deviceToken hexadecimalString] withKey:N_DEVICE_TOKEN_STRING];
}

-(void)setupParse:(UIApplication *)application withLaunchOptions:(NSDictionary *)lauchOptions
{
    [Parse enableLocalDatastore];
    [Parse setApplicationId:@"jZU7AQ02iAtDhPQlZt21V4PW0nFpAm3QhLAC77Zq"
                  clientKey:@"m6qGTPDhpIg371cdMtMnaC73F0ZcB6CKKnp9I9uk"];
    [PFAnalytics trackAppOpenedWithLaunchOptions:lauchOptions];
 
}
-(void)setupPushNotifications:(UIApplication *)application
{
    if ([application respondsToSelector:@selector(registerForRemoteNotifications)]) {
        // Register device for iOS8
        UIUserNotificationType userNotificationTypes = (UIUserNotificationTypeAlert |
                                                        UIUserNotificationTypeBadge |
                                                        UIUserNotificationTypeSound);
        UIUserNotificationSettings *settings = [UIUserNotificationSettings settingsForTypes:userNotificationTypes
                                                                                 categories:nil];
        [application registerUserNotificationSettings:settings];
        [application registerForRemoteNotifications];
        
    } else {
        // Register device for iOS7
        [application registerForRemoteNotificationTypes:UIRemoteNotificationTypeAlert | UIRemoteNotificationTypeSound | UIRemoteNotificationTypeBadge];
    }
}

-(void)saveDeviceTokenToParse:(NSData *)deviceToken
{
    PFInstallation *currentInstallation = [PFInstallation currentInstallation];
    [currentInstallation setDeviceTokenFromData:deviceToken];
    [currentInstallation saveInBackground];
}
-(void)saveDeviceTokenToUserDefaults:(id)deviceToken withKey:(NSString *)key
{
    [[NSUserDefaults standardUserDefaults] setObject:deviceToken forKey:key];
    [[NSUserDefaults standardUserDefaults] synchronize];
}
-(BOOL)isLoggedIn
{
    PFUser *currentUser = [PFUser currentUser];
    if (currentUser)
    {
        return YES;
    }
    return NO;
}
-(void)updateParseCurrentUserDeviceToken:(NSString *)deviceToken
{
    PFUser *currentUser = [PFUser currentUser];
    currentUser[U_DEVICE_TOKEN] = deviceToken;
    [currentUser saveInBackground];
}
-(void)setupWindowWithRootViewController:(UIViewController *)rootVC
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    self.window.rootViewController = rootVC;
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
}
-(UIViewController *)getRootViewController
{
    if ([self isLoggedIn])
    {
        return [Router createMainInterfaceWithNavVC];
    }
    LoginViewController *loginVC = [[LoginViewController alloc] initWithNibName:@"LoginViewController" bundle:nil];
    return loginVC;
}

@end
