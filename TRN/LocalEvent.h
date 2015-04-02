//
//  LocalEvent.h
//  TRN
//
//  Created by William Gu on 3/22/15.
//  Copyright (c) 2015 William Gu. All rights reserved.
//

#import "Event.h"
#import <MapKit/MapKit.h>

@interface LocalEvent : Event

@property (nonatomic, strong) NSString *whyMeet;
@property (nonatomic) CLLocationCoordinate2D hostLocation;

@property (nonatomic) int viewsGotten;
@property (nonatomic) int type; //give or find (0 or 1)
@property (nonatomic) BOOL isFlexibleAboutEvent;

@end
