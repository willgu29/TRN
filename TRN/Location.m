//
//  Location.m
//  TRN
//
//  Created by William Gu on 4/2/15.
//  Copyright (c) 2015 William Gu. All rights reserved.
//

#import "Location.h"

@interface Location()

@property (nonatomic, strong) CLLocationManager *manager;

@end

@implementation Location

-(void)updateUserLocation
{
    if (_manager == nil)
        _manager = [[CLLocationManager alloc] init];
    _manager.delegate = self;
    if ([_manager respondsToSelector:@selector(requestWhenInUseAuthorization)])
    {
        [self authenticateLocationManager];
    }
    else
    {
        [self startUpdatingLocation];
    }
}




+(instancetype)shared
{
    static Location *_instance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _instance = [[Location alloc] init];
    });
    return _instance;
}


#pragma mark - Location Manager Delegate
-(void)locationManager:(CLLocationManager *)manager didChangeAuthorizationStatus:(CLAuthorizationStatus)status
{
    if (status == kCLAuthorizationStatusAuthorized || status == kCLAuthorizationStatusAuthorizedWhenInUse)
    {
        [self startUpdatingLocation];
    }
}
-(void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray *)locations
{
    _userLocation = [locations lastObject];
    [_delegate userlocationCoordinate:[locations lastObject]];
    [_manager stopUpdatingLocation];
}

#pragma mark - Helper functions
-(void)authenticateLocationManager
{
    
    
    CLAuthorizationStatus status = [CLLocationManager authorizationStatus];
    if (status == kCLAuthorizationStatusDenied)
    {
        //TODO: Error message on location auth problem
    }
    else
    {
        [_manager requestWhenInUseAuthorization];
    }
}

-(void)startUpdatingLocation
{
    [_manager startUpdatingLocation];
}

@end
