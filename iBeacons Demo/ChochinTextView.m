//
//  ChochinTextView.m
//  iBeacons Demo
//
//  Created by Danny Holmes on 3/24/14.
//  Copyright (c) 2014 LSU MAG. All rights reserved.
//

#import "ChochinTextView.h"

@implementation ChochinTextView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.textAlignment = NSTextAlignmentCenter;
        self.fontSize = 24.0;
        self.font = [UIFont fontWithName:@"Cochin" size:self.fontSize];
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
