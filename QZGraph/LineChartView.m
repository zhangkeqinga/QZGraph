//
//  LineChartView.m
//  QZGraph
//
//  Created by Dong on 15-3-17.
//  Copyright (c) 2015年 jhonyzhang. All rights reserved.
//

#import "LineChartView.h"

@interface LineChartView()
{
    
    UIView  *popView;
    UILabel *disLabel;
    
    int x;
    int y;

}
@end

@implementation LineChartView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        self.backgroundColor = [UIColor clearColor];
        x = frame.size.width;
        y = frame.size.height;
        
    }
    return self;
}



- (void)drawRect:(CGRect)rect{
    
    [self setClearsContextBeforeDrawing: YES];  //删除之前的绘制
  
    CGContextRef context = UIGraphicsGetCurrentContext();
    //画背景线条------------------
    CGContextSetLineWidth(context, 0.5f);//主线宽度
    CGContextSetLineJoin(context, kCGLineJoinRound);
    CGContextSetLineCap(context, kCGLineCapRound );
    CGContextSetBlendMode(context, kCGBlendModeNormal);
    CGContextSetStrokeColorWithColor(context, [UIColor grayColor].CGColor);
    
    int tempY = y;
    
    //添加纵轴标签和线
    for (int i=0; i<_vDesc.count; i++) {
        
        CGPoint bPoint;                              //Y轴数字
        if (i==0)  bPoint = CGPointMake(25, tempY);  //Y轴数字
        else  bPoint = CGPointMake(30, tempY);       //Y轴数字
        CGPoint ePoint = CGPointMake(x, tempY);
        CGContextMoveToPoint(context, bPoint.x, bPoint.y-30);      //横线的绘制
        CGContextAddLineToPoint(context, ePoint.x, ePoint.y-30);

        bPoint = CGPointMake(25, tempY);  //Y轴数字
        EColumnChartLabel *label = [[EColumnChartLabel alloc]initWithFrame:CGRectMake(0, 0, 30, 30)];
        if (i==0)  bPoint = CGPointMake(25, tempY);  //Y轴数字
        [label setCenter:CGPointMake(bPoint.x-15, bPoint.y-30)];
        [label setTextAlignment:NSTextAlignmentCenter];
        [label setBackgroundColor:[UIColor clearColor]];
        [label setTextColor:[UIColor blackColor]];
        [label setText:[_vDesc objectAtIndex:i]];
        [self addSubview:label];
        
        tempY -= (y-40)* 0.1; //改变Y轴的高度
        
    }

    
    for (int i=0; i<_hDesc.count; i=5+i) {
        
        EColumnChartLabel *label = [[EColumnChartLabel alloc]init];
        [label setTextAlignment:NSTextAlignmentCenter];
        [label setBackgroundColor:[UIColor clearColor]];
        [label setTextColor:[UIColor redColor]];
        label.numberOfLines = 1;
        label.adjustsFontSizeToFitWidth = YES;
       
        if(i>0){
            [label setText:[_hDesc objectAtIndex:i-1]];
            label.frame=CGRectMake((i-1)*KlineYwidth+12, y - 30, 40, 30);
        }
        else{
            [label setText:[_hDesc objectAtIndex:0]];
            label.frame=CGRectMake(0*KlineYwidth+12, y - 30, 40, 30);
        }
        
        [self addSubview:label];
    }
    
    for (int i=0; i<_hDesc.count; i++) {
        
        if (i==0 ) {
            CGContextMoveToPoint(context, i*KlineYwidth+30, y-25);
            CGContextAddLineToPoint(context, i*KlineYwidth+30, 10);
        }
        
        else if ((i+1)%5==0) {
            CGContextMoveToPoint(context, i*KlineYwidth+30, y-30);
            CGContextAddLineToPoint(context, i*KlineYwidth+30, y-35);
        }
        
        else {
            CGContextMoveToPoint(context, i*KlineYwidth+30, y-30);    //竖线的绘制
            CGContextAddLineToPoint(context, i*KlineYwidth+30, y-32);
        }
        
        
    }
    
    
    CGContextStrokePath(context);
    


}


@end
