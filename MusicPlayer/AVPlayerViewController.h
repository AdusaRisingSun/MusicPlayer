//
//  AVPlayerViewController.h
//  MusicPlayer
//
//  Created by Adusa on 15/8/17.
//  Copyright (c) 2015年 Adusa. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AVFoundation/AVFoundation.h>
@interface AVPlayerViewController : UIViewController
@property (weak, nonatomic) IBOutlet UIButton *playButton;
@property (weak, nonatomic) IBOutlet UIButton *stopButton;
- (IBAction)playButtonClicked:(UIButton *)sender;
- (IBAction)stopButtonClicked:(UIButton *)sender;
@property (strong,nonatomic) AVAudioPlayer * avPlayer;
@property (retain,nonatomic)NSArray *musicArray;
@property (assign,nonatomic)int musicCount;
- (IBAction)previousButtonClicked:(UIButton *)sender;
- (IBAction)nextButtonClicked:(UIButton *)sender;
@end
