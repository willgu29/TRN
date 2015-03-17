//
//  ParseEventValues.h
//  TRN
//
//  Created by William Gu on 3/17/15.
//  Copyright (c) 2015 William Gu. All rights reserved.
//

#ifndef TRN_ParseEventValues_h
#define TRN_ParseEventValues_h
//E = shared
//EL = eventLocal
//EP = eventPrivate

#define E_TITLE @"title
#define E_EVENT_ID @"eventID"
#define E_HOST_USERNAME @"hostUsername
#define E_USERS_INVITED @"usersInvited"
#define E_USERS_ACCEPTED @"usersAccepted"
#define E_USERS_DECLINED @"usersDeclined"


#define EL_STATUS @"status"
#define EL_STATUS_IS_ACTIVE @"1"
#define EL_STATUS_IS_IN_PROGRESS @"2
#define EL_STATUS_IS_PAST_DATE @"3
#define EL_TYPE @"type"
#define EL_TYPE_FRIEND @"1" //activity is mainly for meeting new friends
#define EL_TYPE_DATE @"2" //activity is mainly for dating


#define EP_ACTIVITY @"activity"
#define EP_START_DATE @"startDate"
#define EP_DURATION @"duration"
#define EP_END_DATE @"endDate"
#define EP_TYPE @"type"
#define EP_TYPE_CLOSED @"1" //only host can invite people
#define EP_TYPE_OPEN @"2" //friends can invite their friends


#endif
