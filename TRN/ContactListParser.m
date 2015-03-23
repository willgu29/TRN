//
//  ContactListParser.m
//  TRN
//
//  Created by William Gu on 3/21/15.
//  Copyright (c) 2015 William Gu. All rights reserved.
//

#import "ContactListParser.h"
#import <AddressBook/AddressBook.h>
#import "ContactListPerson.h"

@implementation ContactListParser

-(NSArray *)parseContactList:(NSArray *)ABPersonReferences
{
    NSMutableArray *contactList = [[NSMutableArray alloc] init];
    for (int i = 0; i < [ABPersonReferences count]; i++)
    {
        ABRecordRef personRef = (__bridge ABRecordRef)ABPersonReferences[i];
        ContactListPerson *person =  [self createDataFromPerson:personRef];
        if ([self isContactValid:person])
        {
            [contactList addObject:person];
        }
    }
    return contactList;
}

#pragma mark - Helper functions

-(NSArray *)getPhoneNumbersFromABRecordRefPerson:(ABRecordRef)person
{
    NSMutableArray *phoneNumbers = [[NSMutableArray alloc] init];
    ABMultiValueRef phoneNumbersRef = ABRecordCopyValue(person, kABPersonPhoneProperty);
    CFIndex numberOfPhoneNumbers = ABMultiValueGetCount(phoneNumbersRef);
    NSString *phoneNumber = nil;
    for (CFIndex i = 0; i < numberOfPhoneNumbers; i++)
    {
        phoneNumber = CFBridgingRelease(ABMultiValueCopyValueAtIndex(phoneNumbersRef, i));
        [phoneNumbers addObject:phoneNumber];
    }
    CFRelease(phoneNumbersRef);
    return phoneNumbers;
}

-(ContactListPerson *)createDataFromPerson:(ABRecordRef)personRef
{
    
    NSString *firstName = CFBridgingRelease(ABRecordCopyValue(personRef, kABPersonFirstNameProperty));
    NSString *lastName  = CFBridgingRelease(ABRecordCopyValue(personRef, kABPersonLastNameProperty));
    NSData *imageData = CFBridgingRelease(ABRecordCopyValue(personRef, kABPersonImageFormatThumbnail));
    NSArray *phoneNumbers = [self getPhoneNumbersFromABRecordRefPerson:personRef];
    ContactListPerson *person = [[ContactListPerson alloc] init];
    person.firstName = firstName;
    person.lastName = lastName;
    person.profilePicture = imageData;
    //TODO: add support for multiple phone numbers in 1 contact
    person.phoneNumber = [phoneNumbers lastObject];
    return person;
}
-(BOOL)isContactValid:(ContactListPerson *)person
{
    if (person.phoneNumber && (person.firstName || person.lastName))
    {
        return YES;
    }
    return NO;
}


@end
