//
//  DetailViewController.m
//  tokeikarennda
//
//  Created by はしら on 2014/03/28.
//  Copyright (c) 2014年 com.litech. All rights reserved.
//

#import "DetailViewController.h"

@interface DetailViewController ()

@end

@implementation DetailViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
         //Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
     //Do any additional setup after loading the view.
    
    [self setUp];
}

- (void)setUp
{
    //日時取得
    today = [NSDate date];
    NSDateFormatter*outputFormatter = [[NSDateFormatter alloc]init];
    [outputFormatter setDateFormat:@"yyyy-MM-dd"];
    NSString *newDateString = [outputFormatter stringFromDate:today];
    NSArray *seya = [newDateString componentsSeparatedByString:@"-"];
    
    // update Outlets
    NSLog(@"%@年%@月%@日", seya[0], seya[1], seya[2]);
    
    int month = [seya[1] integerValue];
    
    if(1 <= month && month < 4){
        clockImageView.image = [UIImage imageNamed:@"tokeikarennda-kai3.png"];
    } else if ( 4 <= month && month < 7) {
        clockImageView.image = [UIImage imageNamed:@"tokeikarennda-kai4.png"];
    }else if ( 7 <= month && month <10){
        clockImageView.image = [UIImage imageNamed:@"tokeikarennda-kai.png"];
    }else if (10 <= month && month <1){
        clockImageView.image = [UIImage imageNamed:@"tokeikarennda-kai2.png"];
    }
}




- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}


@end
