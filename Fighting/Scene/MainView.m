//
//  MainView.m
//  Fighting
//
//  Created by kangqijun on 14-10-16.
//  Copyright (c) 2014年 kangqijun. All rights reserved.
//

#import "MainView.h"

@implementation MainView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        
        self.backgroundColor = [UIColor grayColor];
        
        //左上操作按钮
        UIButton *leftUpBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [leftUpBtn setFrame:CGRectMake(50,50, 50, 100)];
        leftUpBtn.backgroundColor = [UIColor blueColor];
        [leftUpBtn addTarget:self action:@selector(controlEvent:) forControlEvents:UIControlEventTouchUpInside];
        leftUpBtn.tag = Direction_LeftUp;
        [self addSubview:leftUpBtn];
        
        //左下操作按钮
        UIButton *leftDownBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [leftDownBtn setFrame:CGRectMake(50,50, 50, 100)];
        leftDownBtn.backgroundColor = [UIColor blueColor];
        [leftDownBtn addTarget:self action:@selector(controlEvent:) forControlEvents:UIControlEventTouchUpInside];
        leftUpBtn.tag = Direction_LeftDown;
        [self addSubview:leftDownBtn];
        
        //右上操作按钮
        UIButton *rightUpBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [rightUpBtn setFrame:CGRectMake(50,50, 50, 100)];
        rightUpBtn.backgroundColor = [UIColor blueColor];
        [rightUpBtn addTarget:self action:@selector(controlEvent:) forControlEvents:UIControlEventTouchUpInside];
        leftUpBtn.tag = Direction_RightUp;
        [self addSubview:rightUpBtn];
        
        //又下操作按钮
        UIButton *rightDownBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [rightDownBtn setFrame:CGRectMake(50,50, 50, 100)];
        rightDownBtn.backgroundColor = [UIColor blueColor];
        [rightDownBtn addTarget:self action:@selector(controlEvent:) forControlEvents:UIControlEventTouchUpInside];
        leftUpBtn.tag = Direction_RightUp;
        [self addSubview:rightDownBtn];
        
    }
    return self;
}

- (void)controlEvent:(UIButton *)btn
{
    switch (btn.tag)
    {
        case Direction_LeftUp:
        {
            break;
        }
        case Direction_LeftDown:
        {
            break;
        }
        case Direction_RightUp:
        {
            break;
        }
        case Direction_RightDown:
        {
            break;
        }
            
        default:
            break;
    }
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
