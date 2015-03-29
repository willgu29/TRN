//
//  EventErrorChecker.m
//  TRN
//
//  Created by William Gu on 3/29/15.
//  Copyright (c) 2015 William Gu. All rights reserved.
//

#import "EventErrorChecker.h"
#import "ErrorCodeValues.h"
#import <UIKit/UIKit.h>

@implementation EventErrorChecker

+(void)displayAlertErrorWithCode:(int)errorCode
{
    UIAlertView *alertView;
    if (errorCode == NO_EVENT_NAME)
    {
        alertView = [[UIAlertView alloc] initWithTitle:@"Oops" message:@"You haven't given your event a name yet. Type one in then try again." delegate:nil cancelButtonTitle:@"Okay" otherButtonTitles:nil];
        
    }
    else if (errorCode == NO_EVENT_ACTIVITY)
    {
        alertView = [[UIAlertView alloc] initWithTitle:@"Oops" message:@"You haven't typed in an activity for your event yet. Suggest anything, like going for a walk." delegate:nil cancelButtonTitle:@"Okay" otherButtonTitles:nil];
    }
    else if (errorCode == NO_HOST_USERNAME)
    {
        alertView = [[UIAlertView alloc] initWithTitle:@"We're sorry." message:@"This shouldn't have happened but for some reason we could not get your account ID to create the event. Please try logging out and signing in again. Let us know at contact@gustudios.com how else we can help you." delegate:nil cancelButtonTitle:@"Okay" otherButtonTitles:nil];
    }
    else if (errorCode == NO_WHY_MEET)
    {
        alertView = [[UIAlertView alloc] initWithTitle:@"Hmm" message:@"Please type in a reason for meeting people, whether you're giving or finding. Its important to know what you can offer or who you want to find." delegate:nil cancelButtonTitle:@"Okay" otherButtonTitles:nil];
    }
    else if (errorCode == NO_AUDIO_CLIP)
    {
        alertView = [[UIAlertView alloc] initWithTitle:@"Uh oh.." message:@"Please select or a record an audio clip. Audio clips let others know more about you and who you are. Just wing it, and say a little about yourself." delegate:nil cancelButtonTitle:@"Okay" otherButtonTitles:nil];
    }
    
    [alertView show];
}

@end
