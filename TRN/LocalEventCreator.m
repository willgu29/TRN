//
//  LocalEventCreator.m
//  TRN
//
//  Created by William Gu on 3/22/15.
//  Copyright (c) 2015 William Gu. All rights reserved.
//

#import "LocalEventCreator.h"
#import <Parse/Parse.h>

@implementation LocalEventCreator


-(void)createLocalParseEvent
{
    PFObject *localEvent = [PFObject objectWithClassName:@"LocalEvents"];
    
    [localEvent saveInBackgroundWithBlock:^(BOOL succeeded, NSError *error) {
        
    }];
}

@end
