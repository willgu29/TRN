//
//  Event.m
//  TRN
//
//  Created by William Gu on 3/22/15.
//  Copyright (c) 2015 William Gu. All rights reserved.
//

#import "Event.h"
#import <Parse/Parse.h>

@implementation Event

-(instancetype)init
{
    self = [super init];
    if (self)
    {
        _uuid = [[NSUUID UUID] UUIDString];
        _hostName = [PFUser currentUser].username;
    }
    return self;
}

@end
