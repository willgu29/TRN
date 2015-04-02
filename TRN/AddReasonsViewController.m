//
//  AddReasonsViewController.m
//  TRN
//
//  Created by William Gu on 3/23/15.
//  Copyright (c) 2015 William Gu. All rights reserved.
//

#import "AddReasonsViewController.h"
#import "ErrorCodeValues.h"
#import "EventErrorChecker.h"
#import "Audio.h"
#import <AVFoundation/AVFoundation.h>

@interface AddReasonsViewController ()

@property (nonatomic, weak) IBOutlet UITextField *whyMeet;
@property (nonatomic, weak) IBOutlet UISegmentedControl *giveOrFind;
@property (nonatomic, weak) IBOutlet UISwitch *allowFeedback;

@property (nonatomic, strong) Audio *audioDevice;

@end

@implementation AddReasonsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.title = @"Create Local Event";
    [_giveOrFind addTarget:self action:@selector(segmentChanged:) forControlEvents:UIControlEventValueChanged];
}

-(void)viewWillAppear:(BOOL)animated
{
    [self updatePlaceHolderTextBasedOnSegmentValue];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)segmentChanged:(UISegmentedControl *)sender
{
    [self updatePlaceHolderTextBasedOnSegmentValue];
}

#pragma mark - IBActions

-(IBAction)createAudioClip:(UIButton *)sender
{
    _audioDevice = [[Audio alloc] init];
    [_audioDevice setupRecorder];
    AVAudioSession *session = [AVAudioSession sharedInstance];
    [session setActive:YES error:nil];
    [_audioDevice.recorder record];
}
-(IBAction)playRecording:(UIButton *)sender
{
    [_audioDevice startPlayback];
}
-(IBAction)stopRecording:(id)sender
{
    [_audioDevice.recorder stop];
    AVAudioSession *audioSession = [AVAudioSession sharedInstance];
    [audioSession setActive:NO error:nil];
}
-(IBAction)createEvent:(UIButton *)sender
{
    [self updateLocalEventObject];
    int errorCode = [self isLocalEventValid];
    if (errorCode == NO_ERROR)
    {
        [EventCreator shared].delegate = self;
        [[EventCreator shared] createLocalParseEvent:_localEvent];
    }
    else
    {
        [EventErrorChecker displayAlertErrorWithCode:errorCode];
    }
}

#pragma mark - UITextField Delegate

-(BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return YES;
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [_whyMeet resignFirstResponder];
}

-(void)updateLocalEventObject
{
    _localEvent.type = _giveOrFind.selectedSegmentIndex;
    _localEvent.allowFeedback = _allowFeedback.on;
    _localEvent.whyMeet = _whyMeet.text;
    //TODO: add promotional video type
}
-(int)isLocalEventValid
{
    if ([_localEvent.whyMeet isEqualToString:@""])
    {
        return NO_WHY_MEET;
    }
    return NO_ERROR;
}
-(void)updatePlaceHolderTextBasedOnSegmentValue
{
    if (_giveOrFind.selectedSegmentIndex == 0)
    {
        _whyMeet.placeholder = @"Describe what you have to offer to others.";
    }
    else if (_giveOrFind.selectedSegmentIndex == 1)
    {
        _whyMeet.placeholder = @"Describe what you're looking for.";
    }
}

#pragma mark - Location Delegate

-(void)eventCreationSuccess
{
    [self.navigationController popToRootViewControllerAnimated:YES];
    [self presentSuccessAlertView];

}
-(void)eventCreationFailure:(NSError *)error
{
    NSLog(@"Uh oh: %@", error);
}
#pragma mark - Helper functions
-(void)presentSuccessAlertView
{
    //TODO: Limit # of events possible to create
    NSString *alertString = [NSString stringWithFormat:@"Your event was created and will expire in 7 days. You can create %d more events.",3];
    UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Awesome!" message:alertString delegate:nil cancelButtonTitle:@"Okay"otherButtonTitles:nil];
    [alertView show];
}

@end
