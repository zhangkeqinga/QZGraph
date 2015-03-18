//
//  ViewController.m
//  QZGraph
//
//  Created by Dong on 15-3-16.
//  Copyright (c) 2015年 jhonyzhang. All rights reserved.
//

#import "ViewController.h"


#define CC_DEGREES_TO_RADIANS(__ANGLE__) ((__ANGLE__) * 0.01745329252f)
//#define KlineHeight 2
#define KlineWidth  50


@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
//    DrawOne *one=[[DrawOne alloc]init];
//    one.frame=CGRectMake(0, 20, 300,400);
//    one.backgroundColor=[UIColor colorWithRed:240/255 green:240/255 blue:240/255 alpha:0.5];
//    one.backgroundColor=[UIColor whiteColor];
//
//    [self.view addSubview:one];
//    
//    for (int i=0; i<500;  i=i+20) {
//
//            UIView *views=[[UIView alloc]init];
//            views.frame=CGRectMake(i, 0, 1, 800);
//            if(i==20 || i==100 )
//                views.backgroundColor=[UIColor redColor];
//            else
//                views.backgroundColor=[UIColor grayColor];
//
//            [self.view addSubview:views];
//            
//    }
//    
//    for (int j=0; j<800; j=j+20) {
//        
//        UIView *views=[[UIView alloc]init];
//        views.frame=CGRectMake(0, j, 500, 1);
//        if( j==20 || j==120)
//            views.backgroundColor=[UIColor redColor];
//        else
//            views.backgroundColor=[UIColor grayColor];
//        
//        [self.view addSubview:views];
//        
//    }
    
    
    
//    LineChartViewDemo* line = [[LineChartViewDemo alloc] initWithFrame:CGRectMake(0, 0, 320, 300)];
//    NSMutableArray *pointArr = [[NSMutableArray alloc]init];
//    
//    //生成随机点   1
//    //[pointArr addObject:[NSValue valueWithCGPoint:CGPointMake(KlineWidth*0, 0)]];
//    for (int i = 0; i < 12; i++) {
//        [pointArr addObject:[NSValue valueWithCGPoint:CGPointMake(KlineWidth* (i+1), 55 * i)]];
//    }
//    NSMutableArray* pointArr2 = [NSMutableArray array];
//    //生成随机点   2
//    
//    for (int i = 0; i < 12; i++) {
//        [pointArr2 addObject:[NSValue valueWithCGPoint:CGPointMake(KlineWidth* (i + 1), 110 * i)]];
//    }
//    
//    //竖轴
//    NSMutableArray *vArr = [[NSMutableArray alloc]initWithCapacity:pointArr.count-1];
//    for (int i=0; i<10; i++) {
//        [vArr addObject:[NSString stringWithFormat:@"%d",i*10]];
//    }
//    //横轴
//    NSMutableArray *hArr = [[NSMutableArray alloc]initWithCapacity:pointArr.count-1];
//    
//    for (int i = 1; i <= 12; i++) {
//        [hArr addObject:[NSString stringWithFormat:@"%d",i]];
//    }
//    
//    
//    [line setHDesc:hArr];
//    [line setVDesc:vArr];
//    [line setArray:pointArr];
//    [line setArray1:pointArr2];
//    
//    [self.view addSubview:line];
    
    
    [self initLineChart];
    
}

- (void)initLineChart{
    
    LineChartViewOne* line = [[LineChartViewOne alloc] initWithFrame:CGRectMake(20, 60, ScreenWidth-40, 200)];
    line.backgroundColor= RGB(240, 240, 240);
    
    
    //生成随机点   1
    NSMutableArray *pointArr = [[NSMutableArray alloc]init];
    for (int i = 0; i < 31; i++) {
        [pointArr addObject:[NSValue valueWithCGPoint:CGPointMake(0, rand()%50)]];
    }
    
    //生成随机点   2
    NSMutableArray* pointArr2 = [NSMutableArray array];
    for (int i = 0; i < 12; i++) {
        [pointArr2 addObject:[NSValue valueWithCGPoint:CGPointMake(KlineWidth* (i + 1), 110 * i)]];
    }
    
    
    
    //竖轴  // Y轴刻度
    NSMutableArray *vArr = [[NSMutableArray alloc]initWithCapacity:pointArr.count-1];
    for (int i=0; i<11; i++) {
        [vArr addObject:[NSString stringWithFormat:@"%d",i*10]];
    }
    
    //横轴
    NSMutableArray *hArr = [[NSMutableArray alloc]initWithCapacity:pointArr.count-1];
    for (int i = 1; i <= 31; i++) {
        [hArr addObject:[NSString stringWithFormat:@"%d",i]];
    }
    
    [line setHDesc:hArr];
    [line setVDesc:vArr];
    [line setArray:pointArr];
    [line setArray1:pointArr2];
    
    
    [self.view addSubview:line];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
    [self.view setNeedsDisplay];
}


@end
