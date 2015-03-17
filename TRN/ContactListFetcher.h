//
//  ContactListFetcher.h
//  TRN
//
//  Created by William Gu on 3/17/15.
//  Copyright (c) 2015 William Gu. All rights reserved.
//

#import <Foundation/Foundation.h>

@class ContactListFetcherDelegate;
@protocol ContactListFetcherDelegate <NSObject>

-(void)contactListAccessGranted;
-(void)contactListAccessDenied:(NSError *)error;

@end

@interface ContactListFetcher : NSObject

@property (nonatomic, assign) id delegate;

-(BOOL)isAppAuthorizedToGetContactList;
-(void)requestAccessToContactList;
-(void)accessToContactListError;
-(NSArray *)getContactList;


@end
