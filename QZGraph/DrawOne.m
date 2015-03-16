//
//  DrawOne.m
//  QZGraph
//
//  Created by Dong on 15-3-16.
//  Copyright (c) 2015年 jhonyzhang. All rights reserved.
//  http://justsee.iteye.com/blog/1972853



#import "DrawOne.h"

@implementation DrawOne

/*/   //贝塞尔五角星
- ( void )drawRect:(CGRect)rect
{
    UIColor *color = [UIColor redColor];
    [color set];  //设置线条颜色
    
    UIBezierPath* aPath = [UIBezierPath bezierPath];
    aPath.lineWidth = 5.0;
    
    aPath.lineCapStyle = kCGLineCapRound;  //线条拐角
    aPath.lineJoinStyle = kCGLineCapRound;  //终点处理
    
    // Set the starting point of the shape.
    [aPath moveToPoint:CGPointMake(100.0, 0.0)];
    
    // Draw the lines
    [aPath addLineToPoint:CGPointMake(200.0, 40.0)];
    [aPath addLineToPoint:CGPointMake(160, 140)];
    [aPath addLineToPoint:CGPointMake(40.0, 140)];
    [aPath addLineToPoint:CGPointMake(0.0, 40.0)];
    [aPath closePath]; //第五条线通过调用closePath方法得到的
    
    [aPath stroke]; //Draws line 根据坐标点连线
}
//*/


/*   //贝塞尔圆形图

#define pi 3.14159265359
#define   DEGREES_TO_RADIANS(degrees)  ((pi * degrees)/ 180)
- (void)drawRect:(CGRect)rect
{
    UIColor *color = [UIColor redColor];
    [color set]; //设置线条颜色
    
    UIBezierPath* aPath = [UIBezierPath bezierPathWithArcCenter:CGPointMake(150, 150)
                                                         radius:75
                                                     startAngle:DEGREES_TO_RADIANS(-90)
                                                       endAngle:DEGREES_TO_RADIANS(90)
                                                      clockwise:YES]; // 顺时针
    
    aPath.lineWidth = 20.0;
    aPath.lineCapStyle = kCGLineCapRound; //线条拐角
    aPath.lineJoinStyle = kCGLineCapRound; //终点处理
    
    [aPath stroke];
}

/*/




/*    //绘制二次贝塞尔曲线
 
 - (void)drawRect:(CGRect)rect
 {
 UIColor *color = [UIColor redColor];
 [color set]; //设置线条颜色
 
 UIBezierPath* aPath = [UIBezierPath bezierPath];
 
 aPath.lineWidth = 5.0;
 aPath.lineCapStyle = kCGLineCapRound; //线条拐角
 aPath.lineJoinStyle = kCGLineCapRound; //终点处理
 
 [aPath moveToPoint:CGPointMake(20, 100)];
 
 [aPath addQuadCurveToPoint:CGPointMake(120, 100) controlPoint:CGPointMake(70, 0)];
 
 [aPath stroke];
 }
//*/


 /*    //绘制三次贝塞尔曲线
- (void)drawRect:(CGRect)rect
{
    UIColor *color = [UIColor redColor];
    [color set]; //设置线条颜色
    
    UIBezierPath* aPath = [UIBezierPath bezierPath];
    aPath.lineWidth = 5.0;
    aPath.lineCapStyle = kCGLineCapRound; //线条拐角
    aPath.lineJoinStyle = kCGLineCapRound; //终点处理
    [aPath moveToPoint:CGPointMake(20, 50)];
    [aPath addCurveToPoint:CGPointMake(200, 30) controlPoint1:CGPointMake(110, 5) controlPoint2:CGPointMake(110, 50)];
    [aPath stroke];
}

//*/



// CoreGraph  绘制图形的方法

//http://www.cocoachina.com/industry/20140115/7703.html

//<><><><><> 第一种绘制圆形
/*
- (void) drawRect: (CGRect) rect {
    
    UIBezierPath* p = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(0,0,100,100)];
    
    [[UIColor blueColor] setFill];
    
    [p fill];
    
}
//*/

//<><><><><> 第二种绘制圆形
//*
- (void) drawRect: (CGRect) rect {
    
    CGContextRef con = UIGraphicsGetCurrentContext();
    
    CGContextAddEllipseInRect(con, CGRectMake(0,0,100,100));
    
    CGContextSetFillColorWithColor(con, [UIColor blueColor].CGColor);
    
    CGContextFillPath(con);
    
}
//*/



//*

//*/

@end
