//
//  Event.h
//  TRN
//
//  Created by William Gu on 3/22/15.
//  Copyright (c) 2015 William Gu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MapKit/MapKit.h>

@interface Event : NSObject

@property (nonatomic, strong) NSString *eventName;
@property (nonatomic, strong) NSString *eventActivity;
@property (nonatomic, strong) NSString *hostName;
@property (nonatomic, strong) NSString *eventLocation;
@property (nonatomic) CLLocationCoordinate2D *eventLocationCoordinate;
@property (nonatomic) BOOL allowFeedback;
@property (nonatomic) int whoCanSeeEvent;
@property (nonatomic) int uuid;


@end
