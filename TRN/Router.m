//
//  Router.m
//  TRN
//
//  Created by William Gu on 3/16/15.
//  Copyright (c) 2015 William Gu. All rights reserved.
//

#import "Router.h"
#import "EventFeedViewController.h"

@implementation Router

+(UIViewController *)createMainInterfaceWithNavVC
{
    EventFeedViewController *eventVC = [[EventFeedViewController alloc] initWithNibName:@"EventFeedViewController" bundle:nil];
    UINavigationController *navVC = [[UINavigationController alloc] initWithRootViewController:eventVC];
    return navVC;
}

@end
