//
//  ContactListFetcher.m
//  TRN
//
//  Created by William Gu on 3/17/15.
//  Copyright (c) 2015 William Gu. All rights reserved.
//

#import "ContactListFetcher.h"
#import <AddressBook/AddressBook.h>

@implementation ContactListFetcher

-(BOOL)isAppAuthorizedToGetContactList
{
    ABAuthorizationStatus status = ABAddressBookGetAuthorizationStatus();
    if (status == kABAuthorizationStatusAuthorized)
    {
        return YES;
    }
    else if (status == kABAuthorizationStatusNotDetermined) {
        return NO;
    }
    else if (status == kABAuthorizationStatusDenied || status == kABAuthorizationStatusRestricted)
    {
        return NO;
    }
    return NO;
}

-(void)requestAccessToContactList
{
    ABAddressBookRequestAccessWithCompletion(nil, ^(bool granted, CFErrorRef error) {
        if (granted) {
            [_delegate contactListAccessGranted];
        } else {
            [_delegate contactListAccessDenied:CFBridgingRelease(error)];
        }
    });
}
-(void)accessToContactListError
{
    NSError *error = [[NSError alloc] initWithDomain:@"This app requires access to your contacts book" code:1 userInfo:nil];
}
-(NSArray *)getContactList
{
    CFErrorRef error = NULL;
    ABAddressBookRef addressBook = ABAddressBookCreateWithOptions(NULL, &error);
    if (error)
    {
        NSLog(@"Error Address Book: %@", error);
        
    }
    NSArray *allPeople = CFBridgingRelease(ABAddressBookCopyArrayOfAllPeople(addressBook));
    return allPeople;
}
-(void)


@end
