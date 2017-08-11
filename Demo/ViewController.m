//
//  ViewController.m
//  Demo
//
//  Created by Sam Meech-Ward on 2017-08-11.
//  Copyright © 2017 Sam Meech-Ward. All rights reserved.
//

#import "ViewController.h"
@import AVFoundation;

@interface ViewController () <UIImagePickerControllerDelegate, UINavigationControllerDelegate>

@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (nonatomic, strong) AVAudioPlayer *player;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    NSString *pathToFile = [[NSBundle mainBundle] resourcePath];
    NSString *fileName = @"mario_its_me.wav";
    NSURL *urlToFile = [NSURL URLWithString:[NSString stringWithFormat:@"%@/%@", pathToFile, fileName]];
    
    NSError *error = nil;
    
    self.player = [[AVAudioPlayer alloc] initWithContentsOfURL:urlToFile error:&error];
    
    // if error is still nil here, then everything is good
    if (error) {
        NSLog(@"error with audio %@", error.localizedDescription);
    } else {
        NSLog(@"Success!!!");
    }
}
//

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)selectImage:(id)sender {
    
    UIImagePickerController *imagePickerController = [[UIImagePickerController alloc] init];
    
    if ([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]) {
        imagePickerController.sourceType = UIImagePickerControllerSourceTypeCamera;
        imagePickerController.cameraDevice = UIImagePickerControllerCameraDeviceFront;
    } else if ([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypePhotoLibrary]) {
        imagePickerController.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
    } else {
        NSLog(@"you're just 💩 out of luck");
    }
    
    imagePickerController.delegate = self;
    
    [self presentViewController:imagePickerController animated:YES completion:nil];
}

- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker {
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary<NSString *,id> *)info {
    
    [self dismissViewControllerAnimated:YES completion:nil];
    
    // Add the image to the image view
    UIImage *selectedImage = [info objectForKey:UIImagePickerControllerOriginalImage];
    
    self.imageView.image = selectedImage;
}

- (IBAction)playSomeSound:(id)sender {
    [self.player play];
}

@end
