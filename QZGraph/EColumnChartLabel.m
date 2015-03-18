//
//  EColumnChartLabel.m
//  QZGraph
//
//  Created by Dong on 15-3-17.
//  Copyright (c) 2015年 jhonyzhang. All rights reserved.
//

#import "EColumnChartLabel.h"

@implementation EColumnChartLabel


- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setLineBreakMode:NSLineBreakByClipping];
       
        self.adjustsFontSizeToFitWidth = YES;
        [self setMinimumScaleFactor:5.0f/13.0f];
        [self setNumberOfLines:1];
        [self setFont:[UIFont boldSystemFontOfSize:10.0f]];
        [self setTextColor: [UIColor grayColor]];
        self.backgroundColor = [UIColor clearColor];
        [self setTextAlignment:NSTextAlignmentLeft];
        self.userInteractionEnabled = YES;
        [self setBaselineAdjustment:UIBaselineAdjustmentAlignCenters];
    }
    return self;
    
    
} @end
