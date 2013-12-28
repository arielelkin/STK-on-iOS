//
//  ViewController.m
//  STK on iOS
//
//  Created by Ariel Elkin on 08/09/2013.
//  Copyright (c) 2013 ariel. All rights reserved.
//

#import "ViewController.h"
#import "AEAudioController.h"
#import "AEBlockChannel.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    //Create an AEAudioController to setup our realtime audio session:
    AEAudioController *audioController = [[AEAudioController alloc] initWithAudioDescription:
                                          [AEAudioController nonInterleavedFloatStereoAudioDescription]
                                                                                inputEnabled:NO
                                          ];
    
    NSError *errorAudioSetup = NULL;
    
    //Start the audio session:
    BOOL result = [audioController start:&errorAudioSetup];
    if ( !result ) NSLog(@"Error starting audio engine: %@", errorAudioSetup.localizedDescription);
    
    
    //We'll be using this channel to listen to the sound from the STK classes:
    AEBlockChannel *blockChannel = [AEBlockChannel channelWithBlock:^(const AudioTimeStamp *time, UInt32 frames, AudioBufferList *audio) {
        
        //The STK classes compute and output one sample at a time,
        //place them in the frames of the buffer:
        
        for ( int i=0; i<frames; i++ ) {
            
            ((float*)audio->mBuffers[0].mData)[i] =
            ((float*)audio->mBuffers[1].mData)[i] = 0;
        }

    }];
    
    [audioController addChannels:@[blockChannel]];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
