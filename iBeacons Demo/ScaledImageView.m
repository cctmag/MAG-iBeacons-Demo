//
//  ScaledImageView.m
//  iBeacons Demo
//
//  Created by Danny Holmes on 3/24/14.
//  Copyright (c) 2014 Mobient. All rights reserved.
//

#import "ScaledImageView.h"

@implementation ScaledImageView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.contentMode = UIViewContentModeScaleAspectFit;
        self.backgroundColor = [UIColor colorWithWhite:1 alpha:0];
    }
    return self;
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
