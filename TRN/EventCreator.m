//
//  EventCreator.m
//  TRN
//
//  Created by William Gu on 3/16/15.
//  Copyright (c) 2015 William Gu. All rights reserved.
//

#import "EventCreator.h"
#import <Parse/Parse.h>
#import "ParseEventValues.h"
#import <MapKit/MapKit.h>

@implementation EventCreator


-(void)createEventOfTheDay
{
    
}

-(void)createLocalParseEvent:(LocalEvent *)localEventData
{
    PFObject *localEvent = [PFObject objectWithClassName:@"LocalEvents"];
    localEvent[E_EVENT_ID] = localEventData.uuid;
    localEvent[E_HOST_USERNAME] = localEventData.hostName;
    localEvent[E_USERS_ACCEPTED] = [NSArray array];
    localEvent[E_USERS_DECLINED] = [NSArray array];
    localEvent[E_ACTIVITY] = localEventData.eventActivity;
    localEvent[EL_TYPE] = [NSNumber numberWithInt:localEventData.type];
    PFGeoPoint *geoPoint = [PFGeoPoint geoPointWithLatitude:localEventData.eventLocationCoordinate.latitude longitude:localEventData.eventLocationCoordinate.longitude];
    localEvent[EL_WHO_CAN_SEE] = [NSNumber numberWithInt:localEventData.whoCanSeeEvent];
    localEvent[EL_LOCATION_COORDINATE] = geoPoint;
    localEvent[EL_VIEWS] = [NSArray array];
    localEvent[EL_STATUS] = [NSNumber numberWithInt:EL_STATUS_IS_ACTIVE];
    localEvent[EL_WHY_MEET] = localEventData.whyMeet;
    [localEvent saveInBackgroundWithBlock:^(BOOL succeeded, NSError *error) {
        if (succeeded) {
            [_delegate eventCreationSuccess];
        } else {
            [_delegate eventCreationFailure:error];
        }
        
    }];

}

-(void)createPrivateParseEvent
{
    PFObject *privateEvent = [PFObject objectWithClassName:@"PrivateEvents"];
    
    [privateEvent saveInBackgroundWithBlock:^(BOOL succeeded, NSError *error) {
        
    }];

}

+(instancetype)shared
{

    static EventCreator *_instance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _instance = [[EventCreator alloc] init];
    });
    return _instance;
    
}

@end
