//
//  Util.m
//  Stickers
//
//  Created by Lisa Jenkins on 3/2/13.
//  Copyright (c) 2013 nyu. All rights reserved.
//

#import "Util.h"

@implementation Util

+(UIButton *) makeButton: (UIImage *) btn AndCenter: (CGPoint) center{
    UIButton *genericButton = [UIButton buttonWithType:UIButtonTypeCustom];
    CGRect frame = CGRectMake(center.x, center.y, 75, 75);
    [genericButton setFrame:frame];
    [genericButton setBackgroundImage:btn forState:UIControlStateNormal];
    return genericButton;
}

+(UIImageView *) makeImageView: (UIImage *) img AndCenter: (CGPoint) center{
    UIImageView *temp = [[UIImageView alloc] initWithFrame:CGRectMake(center.x-50, center.y-50, 100, 100)];
    temp.image = img;
    return  temp;
}

@end
