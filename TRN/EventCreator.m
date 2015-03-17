//
//  EventCreator.m
//  TRN
//
//  Created by William Gu on 3/16/15.
//  Copyright (c) 2015 William Gu. All rights reserved.
//

#import "EventCreator.h"
#import <Parse/Parse.h>

@implementation EventCreator


-(void)createEventOfTheDay
{
    
}
-(void)createLocalParseEvent
{
    PFObject *localEvent = [PFObject objectWithClassName:@"LocalEvents"];
    
    
}
-(void)createPrivateParseEvent
{
    PFObject *privateEvent = [PFObject objectWithClassName:@"PrivateEvents"];
    
    [privateEvent saveInBackgroundWithBlock:^(BOOL succeeded, NSError *error) {
        
    }];

}

@end
