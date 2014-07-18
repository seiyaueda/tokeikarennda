//
//  ViewController.m
//  tokeikarennda
//
//  Created by はしら on 2014/03/25.
//  Copyright (c) 2014年 com.litech. All rights reserved.
//

#import "ViewController.h"
#import "DetailViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    
    
    
    
    today = [NSDate date];
    NSLog(@"(｀・ω・´)");
    NSLog(@"%@", today);
    NSDateFormatter*outputFormatter = [[NSDateFormatter alloc]init];
    [outputFormatter setDateFormat:@"yyyy-MM-dd"];
    NSString *newDateString = [outputFormatter stringFromDate:today];

    NSLog(@"newDateString %@", newDateString);
    
    NSArray *seya = [newDateString componentsSeparatedByString:@"-"];
    
    // update Outlets
    NSLog(@"%@年%@月%@日", seya[0], seya[1], seya[2]);
    NSLog(@"%@年%@月%d日", seya[0], seya[1], [seya[2] integerValue] -1);
    NSLog(@"%@年%@月%d日", seya[0], seya[1], [seya[2] integerValue] +1);
}

- (void)viewDidAppear:(BOOL)animated
{
    NSCalendar *cal = [NSCalendar currentCalendar];
    NSDateComponents *gantanComponents = [[NSDateComponents alloc] init]; // メモリ領域の確保、初期化
    gantanComponents.year = 2014; // 今年
    gantanComponents.month = 1;
    gantanComponents.day = 1;
    NSDate *gantanDate = [cal dateFromComponents:gantanComponents]; // 日本時刻(cal)をもとに、2014/1/1(gantanComponents)の時刻を作る(gantanDate)
    
    
    NSDateComponents *def = [cal components:NSYearCalendarUnit |
                             NSDayCalendarUnit
                                   fromDate:gantanDate toDate:[NSDate date] options:0]; // 元旦時刻と現在時刻の差を求める
    NSLog(@"求めた差 : %@", def);
    def.day;  //84, 25?
    NSLog(@"%f",def.day/365.0);
    
    
    //    CGAffineTransform t1 = CGAffineTransformMakeTranslation (0,0);
    
    
    //ビューの回転
    CGFloat angle = 2*M_PI *def.day /360;
    NSLog(@"Angle : %f", angle);
    //    CGAffineTransform t2 = CGAffineTransformRotate(t1, angle);
    CGAffineTransform t2 = CGAffineTransformMakeRotation(angle);
    
    
    
    
    
    [UIView animateWithDuration:0.8 animations:^{
        hari.transform = t2;
        
    }];
    
    nenn.text =     [NSString stringWithFormat:@"%d",gantanComponents.year];
    
    NSNumber *num = [NSNumber numberWithFloat:angle];
    
    [self performSelector:@selector(MyMethod:)
               withObject:num afterDelay:0.8];
    
    
    
    
                                
    
}


- (void)MyMethod:(NSNumber *)ang{
    
#if CGFLOAT_IS_DOUBLE
    CGFloat angle = [ang doubleValue];
#else 
    CGFloat angle = [ang floatValue];
#endif
    //button生成
    UIButton *button =
    [UIButton buttonWithType:UIButtonTypeRoundedRect];
    
    [button setTitle:@"●"
            forState:UIControlStateNormal];
    [button sizeToFit];
    //ボタンの座標
    button.center = CGPointMake(140+164*sin(angle),179-164*cos(angle));
    
    // ボタンが押されたときの処理
    [button addTarget:self action:@selector(onButtonTap) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:button];
}

- (void)onButtonTap
{
    DetailViewController *detailVC = [self.storyboard instantiateViewControllerWithIdentifier:@"DetailViewController"];
    [self presentViewController:detailVC animated:YES completion:nil];
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (id)initWithCoder:(NSCoder *)coder{
    self = [super initWithCoder:coder];
    if(self) {
        NSLog(@"(´・ω・｀)");
    }
    return self;
}

@end
