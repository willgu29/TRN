//
//  ContactListParser.h
//  TRN
//
//  Created by William Gu on 3/21/15.
//  Copyright (c) 2015 William Gu. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ContactListParser : NSObject

-(NSArray *)parseContactList:(NSArray *)ABPersonReferences;


@end
