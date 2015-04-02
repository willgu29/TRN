//
//  Location.h
//  TRN
//
//  Created by William Gu on 4/2/15.
//  Copyright (c) 2015 William Gu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MapKit/MapKit.h>

@protocol LocationDelegate <NSObject>

-(void)userlocationCoordinate:(CLLocation *)location;

@end

@interface Location : NSObject <CLLocationManagerDelegate>


@property (nonatomic, strong) CLLocation *userLocation;

-(void)updateUserLocation;
+(instancetype)shared;
@property (nonatomic, assign) id delegate;


@end
