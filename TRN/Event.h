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

@property (nonatomic, strong) NSString *eventActivity;
@property (nonatomic, strong) NSString *hostName;
@property (nonatomic, strong) NSString *eventLocation;
@property (nonatomic, strong) CLLocation *eventLocationCoordinate;
@property (nonatomic) BOOL allowFeedback;
@property (nonatomic) int whoCanSeeEvent;
@property (nonatomic, strong) NSString* uuid; //Automatically created on init

-(instancetype)init;

@end
