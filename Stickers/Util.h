//
//  Util.h
//  Stickers
//
//  Created by Lisa Jenkins on 3/2/13.
//  Copyright (c) 2013 nyu. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Util : NSObject

+(UIButton *) makeButton: (UIImage *) btn AndCenter: (CGPoint) center;
+(UIImageView *) makeImageView: (UIImage *) img AndCenter: (CGPoint) center;

@end
