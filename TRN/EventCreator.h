//
//  EventCreator.h
//  TRN
//
//  Created by William Gu on 3/16/15.
//  Copyright (c) 2015 William Gu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "LocalEvent.h"

@protocol EventCreatorDelegate <NSObject>

-(void)eventCreationSuccess;
-(void)eventCreationFailure:(NSError *)error;

@end


@interface EventCreator : NSObject

-(void)createEventOfTheDay;
-(void)createLocalParseEvent:(LocalEvent *)localEvent;
-(void)createPrivateParseEvent;

+(instancetype)shared;
@property (nonatomic, assign) id delegate;

@end
