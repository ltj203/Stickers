//
//  StickersViewController.h
//  Stickers
//
//  Created by Lisa Jenkins on 3/2/13.
//  Copyright (c) 2013 nyu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface StickersViewController : UIViewController {
    UIImageView *drawImageView;
    NSMutableArray *stickerArray;
    UIImage *currentSticker;
    UIImageView *stickerToMove;
    NSMutableArray *stickersPlaced;
    UIImageView *trash;
}

@end
