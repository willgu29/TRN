//
//  SendInvitesViewController.h
//  TRN
//
//  Created by William Gu on 3/17/15.
//  Copyright (c) 2015 William Gu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ContactListFetcher.h"


@interface SendInvitesViewController : UIViewController <ContactListFetcherDelegate, UITableViewDataSource, UITableViewDelegate>

@end
