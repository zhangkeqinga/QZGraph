//
//  LineChartViewOne.m
//  QZGraph
//
//  Created by Dong on 15-3-17.
//  Copyright (c) 2015年 jhonyzhang. All rights reserved.
//

#import "LineChartViewOne.h"


@interface LineChartViewOne()
{
    
    UIView  *popView;
    UILabel *disLabel;
    
    int x;
    int y;
    
}
@end

@implementation LineChartViewOne

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
    CGContextSetLineWidth(context, 0.5f);               //主线宽度
    CGContextSetLineJoin(context, kCGLineJoinRound);
    CGContextSetLineCap(context, kCGLineCapRound );
    CGContextSetBlendMode(context, kCGBlendModeNormal);
    CGContextSetStrokeColorWithColor(context, [UIColor grayColor].CGColor);
    
    int tempY = y;
    
    //添加纵轴标签和线
    for (int i=0; i<_vDesc.count; i++) {
        
        CGPoint bPoint;                              //Y轴数字
        if (i==0)  bPoint = CGPointMake(25, tempY);  //Y轴数字      //右下角第一个点
        else  bPoint = CGPointMake(30, tempY);       //Y轴数字      //左上角第一个点
        
        
        
        
        CGPoint ePoint = CGPointMake(x, tempY);
        CGContextMoveToPoint(context, bPoint.x, bPoint.y-30);      //横线的绘制
        CGContextAddLineToPoint(context, ePoint.x, ePoint.y-30);
        
        bPoint = CGPointMake(25, tempY);  //Y轴数字
        EColumnChartLabel *label = [[EColumnChartLabel alloc]initWithFrame:CGRectMake(0, 0, 30, 30)];
        if (i==0)  bPoint = CGPointMake(25, tempY);  //Y轴数字
        [label setCenter:CGPointMake(bPoint.x-10, bPoint.y-30)];
        [label setTextAlignment:NSTextAlignmentCenter];
        [label setBackgroundColor:[UIColor clearColor]];
        [label setTextColor:[UIColor blackColor]];
        [label setText:[NSString stringWithFormat:@"%@%%",[_vDesc objectAtIndex:i]]];
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
        
        [label setText:[_hDesc objectAtIndex:i]];
        label.frame=CGRectMake((i-1)*KlineYwidth+20, y - 30, 40, 30);
        
        [self addSubview:label];
    }
    
    for (int i=0; i<_hDesc.count; i++) {
        
        if (i==0 ) {
            CGContextMoveToPoint(context, i*KlineYwidth+30, y-25);
            CGContextAddLineToPoint(context, i*KlineYwidth+30, 10);
        }
        
        else if (i%5==0) {
            
            CGContextMoveToPoint(context, i*KlineYwidth+30, y-30);
            CGContextAddLineToPoint(context, i*KlineYwidth+30, y-35);
        }
        
        else {
            CGContextMoveToPoint(context, i*KlineYwidth+30, y-30);    //竖线的绘制
            CGContextAddLineToPoint(context, i*KlineYwidth+30, y-32);
        }
    }
    
    CGContextStrokePath(context);
    
    
    
    
    //画点线条------------------
    CGFloat pointLineWidth = 1.5f;
    CGContextSetLineWidth(context, pointLineWidth);//主线宽度
    CGContextSetLineJoin(context, kCGLineJoinRound);
    CGContextSetLineCap(context, kCGLineCapRound );
    CGContextSetBlendMode(context, kCGBlendModeNormal);
    UIColor* color1 = [UIColor brownColor];
    [color1 set];  //绘图
  
    CGPoint p1 = [[_array objectAtIndex:0] CGPointValue];   //起始点
    CGContextMoveToPoint(context, 30, (y-30)-(y-40)* 0.01*p1.y); //折线的第一个点
    
    for (int i =1; i<[_array count]; i++){
        p1 = [[_array objectAtIndex:i] CGPointValue];
        // (y-30)  0-100 的高度
//      CGPoint  goPoint = CGPointMake(30 + i*KlineYwidth , (y-30) - (y-40)* 0.01*100 );  //Y轴的折线变化 0-100
       CGPoint goPoint = CGPointMake(30 + i*KlineYwidth , (y-30) - (y-40)* 0.01*p1.y );   //Y轴的折线变化 0-100
        

        //添加触摸点
        CGContextAddLineToPoint(context, goPoint.x, goPoint.y);;
        UIButton *bt = [UIButton buttonWithType:UIButtonTypeCustom];
        [bt setBackgroundColor:[UIColor redColor]];
        [bt setFrame:CGRectMake(0, 0, 1, 1)];
        [bt setCenter:goPoint];
        [bt addTarget:self
               action:@selector(btAction:)
     forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:bt];
    }
    
    
    CGContextStrokePath(context);
    

    
    UIView *backView=[[UIView alloc]init];
    backView.frame=CGRectMake(25, 10, ScreenWidth-40-25 , (y-40)* 0.1*10 );
    backView.backgroundColor=[UIColor clearColor];
    [self addSubview:backView];


    
}

- (void)btAction:(id)sender{
    [disLabel setText:@"400"];
    
    UIButton *bt = (UIButton*)sender;
    popView.center = CGPointMake(bt.center.x, bt.center.y - popView.frame.size.height/2);
    [popView setAlpha:1.0f];
}

@end
