//
//  Event.m
//  TRN
//
//  Created by William Gu on 3/22/15.
//  Copyright (c) 2015 William Gu. All rights reserved.
//

#import "Event.h"
#import <Parse/Parse.h>
#import "Location.h"

@implementation Event

-(instancetype)init
{
    self = [super init];
    if (self)
    {
        _uuid = [[NSUUID UUID] UUIDString];
        _hostName = [PFUser currentUser].username;
        _eventLocationCoordinate = [Location shared].userLocation;

    }
    return self;
}

@end
