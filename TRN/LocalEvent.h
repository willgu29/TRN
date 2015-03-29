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
@property (nonatomic, strong) NSString *giveWhat;
@property (nonatomic, strong) NSString *findWhat;
@property (nonatomic) CLLocationCoordinate2D hostLocation;

@property (nonatomic) int viewsGotten;
@property (nonatomic) int type; //give or find
@property (nonatomic) BOOL isFlexibleAboutEvent;

@end
