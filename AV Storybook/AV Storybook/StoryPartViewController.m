//
//  StoryPartViewController.m
//  AV Storybook
//
//  Created by Paul on 2017-09-22.
//  Copyright © 2017 Paul. All rights reserved.
//

#import "StoryPartViewController.h"
@import AVFoundation;

@interface StoryPartViewController ()<UIImagePickerControllerDelegate, UINavigationControllerDelegate>

@property (nonatomic,strong) NSURL *audioFileURL;
@property (nonatomic,strong) AVAudioRecorder *recorder;
@property (nonatomic,strong) AVAudioPlayer *player;

@property (weak, nonatomic) IBOutlet UIImageView *imageView;


@end
//tapping image view plays the person's recording
@implementation StoryPartViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSString* docPath = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) firstObject];
     //    NSLog(@"Document dir = %@", docPath);
    self.audioFileURL = [[NSURL URLWithString:docPath] URLByAppendingPathComponent:@"recording.m4a"];
    //    NSLog(@"Audio file url = %@", self.audioFileURL);
    
    
}
- (IBAction)toggleMicrophone:(UIButton *)sender {
    if ([self.recorder isRecording]){
        [self.recorder stop];
        //changes the microphone title to record.
        [sender setTitle:@"Record" forState:UIControlStateNormal];
        return;
    }
    [sender setTitle:@"Stop" forState:UIControlStateNormal];
    
    NSError *err = nil;
    self.recorder = [[AVAudioRecorder alloc]initWithURL:self.audioFileURL settings:@{AVFormatIDKey: @(kAudioFormatMPEG4AAC),
                                                                                     AVNumberOfChannelsKey: @(2),
                                                                                     AVSampleRateKey: @(44100)} error:&err];
    
    if (err != nil){
        NSLog(@"Error creating recorder: %@", err.localizedDescription);
        abort();
    }
    [self.recorder record];
}






- (IBAction)camera:(UIButton *)sender {
    UIImagePickerController *picker =[[UIImagePickerController alloc]init];
    
    if ([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]) {
        picker.sourceType = UIImagePickerControllerSourceTypeCamera;
    } else {
        picker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
    }
    
    NSArray* mediaType = [UIImagePickerController availableMediaTypesForSourceType:picker.sourceType];
    NSLog(@"Source types: %@", mediaType);
    picker.mediaTypes = mediaType;
    picker.delegate = self;
    
    [self presentViewController:picker animated:YES completion:nil];
    
    
}

#pragma mark - UIImagePickerControllerDelegate
-(void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary<NSString *,id> *)info{

    NSLog(@"media info: %@", info);
    UIImage *image = info[UIImagePickerControllerOriginalImage];
    
    self.imageView.image = image;

    [self dismissViewControllerAnimated:YES completion:nil];

}



//responsible for playing the recording of the user as the user taps the picture.
- (IBAction)playAudioTap:(UITapGestureRecognizer *)sender {
    
    
}


/*
 - (IBAction)togglePlay:(UIButton *)sender {
 if ([self.player isPlaying]) {
 [self.player stop];
 [sender setTitle:@"Play" forState:UIControlStateNormal];
 return;
 }
 [sender setTitle:@"Stop" forState:UIControlStateNormal];
 
 NSError *err = nil;
 self.player = [[AVAudioPlayer alloc]
 initWithContentsOfURL:self.audioFileURL
 error:&err];
 if (err != nil) {
 NSLog(@"Error creating player: %@", err.localizedDescription);
 abort();
 }
 
 [self.player play];
 }
 
 
 
 
 */





@end
