//
//  LineChartViewOne.h
//  QZGraph
//
//  Created by Dong on 15-3-17.
//  Copyright (c) 2015年 jhonyzhang. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "EColumnChartLabel.h"

#define KlineYwidth  (ScreenWidth-40)/34            //Y轴间隔

@interface LineChartViewOne : UIView

//横竖轴显示标签
@property (nonatomic, strong) NSArray *hDesc;  //y
@property (nonatomic, strong) NSArray *vDesc;  //x

//点信息
@property (nonatomic, strong) NSArray *array;   //
@property (nonatomic, strong) NSArray *array1;  //

@end