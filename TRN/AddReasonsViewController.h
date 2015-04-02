//
//  AddReasonsViewController.h
//  TRN
//
//  Created by William Gu on 3/23/15.
//  Copyright (c) 2015 William Gu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LocalEvent.h"
#import "Location.h"
#import "EventCreator.h"

@interface AddReasonsViewController : UIViewController <UITextFieldDelegate, EventCreatorDelegate>

@property (nonatomic, strong) LocalEvent *localEvent; //Get from parent 

@end
