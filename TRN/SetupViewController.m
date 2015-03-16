//
//  SetupViewController.m
//  TRN
//
//  Created by William Gu on 3/15/15.
//  Copyright (c) 2015 William Gu. All rights reserved.
//

#import "SetupViewController.h"
#import <MDCSwipeToChoose/MDCSwipeToChoose.h>
#import "EventFeedViewController.h"

@interface SetupViewController ()

@end

@implementation SetupViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    MDCSwipeToChooseView *swipeView = [self createNewMDCSwipeToChoose];
    UIImage *swipeImage = [self getImageFromURL:@"http://tupleapp.com/someImageHosting/emailLogo.png"];


    
    swipeView.imageView.image = swipeImage;
    [self.view addSubview:swipeView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - IBActions

-(IBAction)submitAnswers:(UIButton *)sender
{
    EventFeedViewController *eventVC = [[EventFeedViewController alloc] initWithNibName:@"EventFeedViewController" bundle:nil];
    [self presentViewController:eventVC animated:YES completion:nil];
}


#pragma mark - MDCSwipeToChooseDelegate Callbacks

// This is called when a user didn't fully swipe left or right.
- (void)viewDidCancelSwipe:(UIView *)view {
    NSLog(@"Couldn't decide, huh?");
}

// Sent before a choice is made. Cancel the choice by returning `NO`. Otherwise return `YES`.
- (BOOL)view:(UIView *)view shouldBeChosenWithDirection:(MDCSwipeDirection)direction {
    if (direction == MDCSwipeDirectionLeft) {
        return YES;
    } else if (direction == MDCSwipeDirectionRight){
        return YES;
    } else {
        // Snap the view back and cancel the choice.
        [UIView animateWithDuration:0.16 animations:^{
            view.transform = CGAffineTransformIdentity;
            view.center = self.view.center;
        }];
        return NO;
    }
}

// This is called then a user swipes the view fully left or right.
- (void)view:(UIView *)view wasChosenWithDirection:(MDCSwipeDirection)direction {
    if (direction == MDCSwipeDirectionLeft) {
        NSLog(@"Photo deleted!");
    } else {
        NSLog(@"Photo saved!");
    }
}

#pragma mark - Helpers
-(MDCSwipeToChooseView *)createNewMDCSwipeToChoose
{
    // You can customize MDCSwipeToChooseView using MDCSwipeToChooseViewOptions.
    MDCSwipeToChooseViewOptions *options = [MDCSwipeToChooseViewOptions new];
    options.delegate = self;
    options.likedText = @"YES";
    options.likedColor = [UIColor greenColor];
    options.nopeText = @"NO";
    options.onPan = ^(MDCPanState *state){
        if (state.thresholdRatio == 1.f && state.direction == MDCSwipeDirectionLeft) {
            NSLog(@"Let go now to delete the photo!");
        }
        else if (state.thresholdRatio == 1.f && state.direction == MDCSwipeDirectionRight)
        {
            NSLog(@"let go now to swipe right!");
        }
    };
    CGRect frame =  CGRectMake(self.view.bounds.size.width/3, self.view.bounds.size.height/3, self.view.bounds.size.width/2, self.view.bounds.size.height/2);

    MDCSwipeToChooseView *view = [[MDCSwipeToChooseView alloc] initWithFrame:frame
                                                                     options:options];
    return view;
}
-(UIImage *)getImageFromURL:(NSString *)path
{
    NSURL *url = [NSURL URLWithString:path];
    NSData *data = [NSData dataWithContentsOfURL:url];
    UIImage *img = [[UIImage alloc] initWithData:data];
    return img;
}

@end
