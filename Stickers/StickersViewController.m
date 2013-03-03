//
//  StickersViewController.m
//  Stickers
//
//  Created by Lisa Jenkins on 3/2/13.
//  Copyright (c) 2013 nyu. All rights reserved.
//

#import "StickersViewController.h"
#import "Util.h"

@interface StickersViewController ()

@end

@implementation StickersViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    drawImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, self.view.bounds.size.height)];
    drawImageView.backgroundColor = [UIColor cyanColor];
    self.view.backgroundColor = [UIColor cyanColor];
   // self.view = drawImageView;
    
    CGRect scrollViewFrame = CGRectMake(0, [UIScreen mainScreen].applicationFrame.size.height*3/4, 775, 200);
    UIScrollView *scrollView = [[UIScrollView alloc] initWithFrame:scrollViewFrame];
    scrollView.backgroundColor = [UIColor grayColor];
    scrollView.indicatorStyle = UIScrollViewIndicatorStyleWhite;
    scrollView.pagingEnabled = YES;
    
    stickerArray = [[NSMutableArray alloc] init];
    for (int i=1; i<10; i++) {
        NSString *name = [NSString stringWithFormat:@"smile%i.png",i];
        UIButton *newButton = [Util makeButton:[UIImage imageNamed:name] AndCenter: CGPointMake(drawImageView.frame.size.width/4 * (i-1), 10)];
        [stickerArray addObject:newButton];
    }
    
    for (int j=0; j<stickerArray.count; j++) {
        UIButton *temp = [stickerArray objectAtIndex:j];
        [temp addTarget:self action:@selector(addSticker:) forControlEvents:UIControlEventTouchUpInside];
        [scrollView addSubview:temp];
    }
    scrollView.contentSize = CGSizeMake(1170, 200);
    
    [self.view addSubview:scrollView];
    
    trash = [[UIImageView alloc] initWithFrame:CGRectMake(self.view.frame.size.width - 175, 50, 150, 150)];
    trash.image = [UIImage imageNamed:@"trash.png"];
    [self.view addSubview:trash];
    
    stickersPlaced = [[NSMutableArray alloc] init];
}

-(void) addSticker: (id) sender {
    for (int i=0; i<stickerArray.count; i++) {
        if (sender == [stickerArray objectAtIndex:i]) {
            int index = i+1;
            currentSticker = [UIImage imageNamed:[NSString stringWithFormat:@"smile%i.png",index]];
        }
    }
}

-(void) touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    UITouch *touch = [touches anyObject];
    CGPoint pt = [touch locationInView:self.view];
    CGRect touchRect = CGRectMake(pt.x, pt.y, 0.5, 0.5);
    
    for (int i=0; i<stickersPlaced.count; i++) {
        UIImageView *sticker = [stickersPlaced objectAtIndex:i];
        if (CGRectIntersectsRect(touchRect, sticker.frame)) {
            stickerToMove = sticker;
        } else {
            stickerToMove = nil;
        }
    }
    
    if (stickersPlaced.count == 0){
        UIImageView *newSticker = [Util makeImageView:currentSticker AndCenter:pt];
        [stickersPlaced addObject:newSticker];
        [self.view addSubview:newSticker];
    }
}

-(void) touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event {
    UITouch *touch = [touches anyObject];
    CGPoint pt = [touch locationInView:self.view];
    stickerToMove.center = CGPointMake(pt.x, pt.y);
}

-(void) touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event {
    UITouch *touch = [touches anyObject];
    CGPoint pt = [touch locationInView:self.view];
    
    if (CGRectIntersectsRect(stickerToMove.frame, trash.frame)) {
        [stickerToMove removeFromSuperview];
        [stickersPlaced removeObject:stickerToMove];
    } else {
        UIImageView *newSticker = [Util makeImageView:currentSticker AndCenter:pt];
        [stickersPlaced addObject:newSticker];
        [self.view addSubview:newSticker];
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
