//
//  ViewController.m
//  LayerTest
//
//  Created by Yongjia Liu on 14-4-14.
//  Copyright (c) 2014年 Yongjia Liu. All rights reserved.
//

#import "ViewController.h"
#import "unlockLabel.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    unlockLabel *label=[[unlockLabel alloc]initWithFrame:CGRectMake(40, 40, 300, 300)];
    //unlockLabel *label=[[unlockLabel alloc]initWithFrame:CGRectMake(40, 40, 300, 300)];
    //UILabel *testLabel=[[UILabel alloc]initWithFrame:CGRectMake(30, 30, 200, 200)];
    //[testLabel setBackgroundColor:[UIColor blackColor]];
    label.text=@"slide to unlock";
    label.font=[UIFont fontWithName:@"Helvatica" size:30];
    label.textColor=[UIColor lightGrayColor];
    //[label setBackgroundColor:[UIColor grayColor]];
    [label startAnimation];
    [self.view setBackgroundColor:[UIColor whiteColor]];
    [self.view addSubview:label];
    //[self.view addSubview:testLabel];
    
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
