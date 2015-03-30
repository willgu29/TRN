//
//  Audio.m
//  TRN
//
//  Created by William Gu on 3/29/15.
//  Copyright (c) 2015 William Gu. All rights reserved.
//

#import "Audio.h"
#import <AVFoundation/AVFoundation.h>
#import <UIKit/UIKit.h>

@implementation Audio

-(void)playground
{
    
    
    
   

    
}

- (void) audioRecorderDidFinishRecording:(AVAudioRecorder *)avrecorder successfully:(BOOL)flag{

}
- (void) audioPlayerDidFinishPlaying:(AVAudioPlayer *)player successfully:(BOOL)flag{
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle: @"Done"
                                                    message: @"Finish playing the recording!"
                                                   delegate: nil
                                          cancelButtonTitle:@"OK"
                                          otherButtonTitles:nil];
    [alert show];
}

#pragma mark - helper functions

-(AVAudioRecorder *)setupRecorder
{
    AVAudioRecorder *recorder;
    // Set the audio file
    NSArray *pathComponents = [NSArray arrayWithObjects:
                               [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject],
                               @"MyAudioMemo.m4a",
                               nil];
    NSURL *outputFileURL = [NSURL fileURLWithPathComponents:pathComponents];
    
    // Setup audio session
    AVAudioSession *session = [AVAudioSession sharedInstance];
    [session setCategory:AVAudioSessionCategoryPlayAndRecord error:nil];
    
    // Define the recorder setting
    NSMutableDictionary *recordSetting = [[NSMutableDictionary alloc] init];
    
    [recordSetting setValue:[NSNumber numberWithInt:kAudioFormatMPEG4AAC] forKey:AVFormatIDKey];
    [recordSetting setValue:[NSNumber numberWithFloat:44100.0] forKey:AVSampleRateKey];
    [recordSetting setValue:[NSNumber numberWithInt: 2] forKey:AVNumberOfChannelsKey];
    
    // Initiate and prepare the recorder
    recorder = [[AVAudioRecorder alloc] initWithURL:outputFileURL settings:recordSetting error:NULL];
    recorder.delegate = self;
    recorder.meteringEnabled = YES;
    [recorder prepareToRecord];
    return recorder;
    
}
-(void)setupPlayer
{
    AVAudioPlayer *player;
    AVAudioRecorder *recorder = [self setupRecorder];
    if (player.playing) {
        [player stop];
    }
    
    if (!recorder.recording) {
        AVAudioSession *session = [AVAudioSession sharedInstance];
        [session setActive:YES error:nil];
        // Start recording
        [recorder record];
        
    } else {
        // Pause recording
        [recorder pause];
    }
    [recorder stop];
    
    
    AVAudioSession *audioSession = [AVAudioSession sharedInstance];
    [audioSession setActive:NO error:nil];
    

}
-(void)startPlaybackWithURL:(NSURL *)recordingURL
{
    AVAudioPlayer *player;
    player = [[AVAudioPlayer alloc] initWithContentsOfURL:recordingURL  error:nil];
    [player setDelegate:self];
    [player play];
}

@end
