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

@implementation StoryPartViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSString* docPath = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) firstObject];
     //    NSLog(@"Document dir = %@", docPath);
    self.audioFileURL = [[NSURL URLWithString:docPath] URLByAppendingPathComponent:@"recording.m4a"];
    //    NSLog(@"Audio file url = %@", self.audioFileURL);
    
    
}
- (IBAction)toggleMicrophone:(UIButton *)sender {
    
    
}


/*
 
 - (IBAction)toggleRecord:(UIButton *)sender {
 if ([self.recorder isRecording]) {
 [self.recorder stop];
 [sender setTitle:@"Record" forState:UIControlStateNormal];
 return;
 }
 [sender setTitle:@"Stop" forState:UIControlStateNormal];
 
 NSError *err = nil;
 self.recorder = [[AVAudioRecorder alloc]
 initWithURL:self.audioFileURL
 settings:@{AVFormatIDKey: @(kAudioFormatMPEG4AAC),
 AVNumberOfChannelsKey: @(2),
 AVSampleRateKey: @(44100)}
 error:&err];
 if (err != nil) {
 NSLog(@"Error creating recorder: %@", err.localizedDescription);
 abort();
 }
 [self.recorder record];
 }
 
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




- (IBAction)userTap:(UITapGestureRecognizer *)sender {
    
    
    
}






/* 
 Your part controller class should have one AVAudioPlayer, and one AVAudioRecorder. Think about where you're recording your data to, and how that will scale if you have five view controllers doing the same thing.
 
 */




@end
