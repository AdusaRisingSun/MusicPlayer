//
//  AVPlayerViewController.m
//  MusicPlayer
//
//  Created by Adusa on 15/8/17.
//  Copyright (c) 2015年 Adusa. All rights reserved.
//

#import "AVPlayerViewController.h"

@interface AVPlayerViewController ()

@end

@implementation AVPlayerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSBundle *mainBundle=[NSBundle mainBundle];
    NSURL *musicURL=[NSURL fileURLWithPath:[mainBundle pathForResource:@"北京北京" ofType:@"mp3"]];
    _avPlayer=[[AVAudioPlayer alloc]initWithContentsOfURL:musicURL error:nil];
    [_avPlayer prepareToPlay];
    _musicArray=[[NSArray alloc]initWithObjects:@"北京北京",@"春天里",@"像梦一样自由", nil];
    _musicCount=0;
    // Do any additional setup after loading the view from its nib.
}

-(void)buildAVPlayer
{
    if (!_avPlayer){
    NSString *music=[_musicArray objectAtIndex:_musicCount];
    NSBundle *mainBundle=[NSBundle mainBundle];
    NSURL *musicURL=[NSURL fileURLWithPath:[mainBundle pathForResource:music ofType:@"mp3"]];
    _avPlayer=[[AVAudioPlayer alloc]initWithContentsOfURL:musicURL error:nil];
    [_avPlayer prepareToPlay];
}
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)playButtonClicked:(UIButton *)sender {
    [self buildAVPlayer];
    if (!_avPlayer.playing) {
        [_avPlayer play];
        _playButton.selected=YES;
    }
   else
   {
       [_avPlayer pause];
       _playButton.selected=NO;
   }
}

- (IBAction)stopButtonClicked:(UIButton *)sender {
    [_avPlayer stop];
    _avPlayer=nil;
    _playButton.selected=NO;
}
- (IBAction)previousButtonClicked:(UIButton *)sender {
    _avPlayer=nil;
    if ((_musicCount>0)&&(_musicCount<=2)) {
        _musicCount--;
    }
    else
    {
        _musicCount=2;
    }
    [self buildAVPlayer];
    [_avPlayer play];
}

- (IBAction)nextButtonClicked:(UIButton *)sender {
    _avPlayer=nil;
    if ((_musicCount>=0)&&(_musicCount<=1)) {
        _musicCount++;
    }
    else
    {
        _musicCount=0;
    }
    [self buildAVPlayer];
    [_avPlayer play];
}
@end
