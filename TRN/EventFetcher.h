//
//  EventFetcher.h
//  TRN
//
//  Created by William Gu on 3/15/15.
//  Copyright (c) 2015 William Gu. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface EventFetcher : NSObject

-(id)getEventOfTheDay;
-(NSArray *)getLocalEvents;
-(NSArray *)getPrivateEventsForUser:(NSString *)username;


@end
