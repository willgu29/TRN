//
//  Event.h
//  TRN
//
//  Created by William Gu on 3/22/15.
//  Copyright (c) 2015 William Gu. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Event : NSObject

@property (nonatomic, strong) NSString *eventName;
@property (nonatomic, strong) NSString *hostName;
@property (nonatomic) int uuid;


@end
