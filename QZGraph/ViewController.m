//
//  ViewController.m
//  QZGraph
//
//  Created by Dong on 15-3-16.
//  Copyright (c) 2015年 jhonyzhang. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    DrawOne *one=[[DrawOne alloc]init];
    one.frame=CGRectMake(0, 20, 300,400);
    one.backgroundColor=[UIColor colorWithRed:240/255 green:240/255 blue:240/255 alpha:0.5];
    one.backgroundColor=[UIColor whiteColor];

    [self.view addSubview:one];
    
    for (int i=0; i<500;  i=i+20) {

            UIView *views=[[UIView alloc]init];
            views.frame=CGRectMake(i, 0, 1, 800);
            if(i==20 || i==100 )
                views.backgroundColor=[UIColor redColor];
            else
                views.backgroundColor=[UIColor grayColor];

            [self.view addSubview:views];
            
    }
    
    for (int j=0; j<800; j=j+20) {
        
        UIView *views=[[UIView alloc]init];
        views.frame=CGRectMake(0, j, 500, 1);
        if( j==20 || j==120)
            views.backgroundColor=[UIColor redColor];
        else
            views.backgroundColor=[UIColor grayColor];
        
        [self.view addSubview:views];
        
    }

    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
    [self.view setNeedsDisplay];
}


@end
