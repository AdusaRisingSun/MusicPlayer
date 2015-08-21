//
//  ViewController.m
//  MusicPlayer
//
//  Created by Adusa on 15/8/17.
//  Copyright (c) 2015年 Adusa. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UIButton *playButton=[UIButton buttonWithType:UIButtonTypeRoundedRect];
    playButton.frame=CGRectMake(20, 100, 120, 40);
    [playButton setTitle:@"开始" forState:UIControlStateNormal];
    [playButton setBackgroundColor:[UIColor yellowColor]];
    [playButton addTarget:self action:@selector(playButtonClicked:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:playButton];
    // Do any additional setup after loading the view, typically from a nib.
}

-(void)playButtonClicked:(UIButton *)btn
{
    NSBundle *mainBundle=[NSBundle mainBundle];
    NSString *yinxiaoPath=[mainBundle pathForResource:@"chupai" ofType:@"wav"];
    NSLog(@"yinxiaoPath=%@",yinxiaoPath);
    NSURL *url=[NSURL fileURLWithPath:yinxiaoPath];
    SystemSoundID soundID=1000;
    AudioServicesCreateSystemSoundID((__bridge CFURLRef)(url), &soundID);
    AudioServicesPlaySystemSound(soundID);
    AVPlayerViewController *avpvc=[[AVPlayerViewController alloc]init];
    [self presentViewController:avpvc animated:YES completion:^()
     {
         
     }];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
