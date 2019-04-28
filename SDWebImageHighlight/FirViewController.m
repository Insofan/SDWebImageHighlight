//
//  FirViewController.m
//  SDWebImageHighlight
//
//  Created by Insomnia on 2019/4/28.
//  Copyright © 2019 Haixiao Xu. All rights reserved.
//

#import "FirViewController.h"
#import <SDWebImage/SDWebImage.h>
#import <UIButton+WebCache.h>
static NSString *str = @"https://nr-platform.s3.amazonaws.com/uploads/platform/published_extension/branding_icon/275/AmazonS3.png";
@interface FirViewController ()
@property (nonatomic, strong) UIButton *button;
@end

@implementation FirViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor blueColor];
//    [self setHightLight];
    
//    [self setAni];
    [self setButton];
}

- (void)setButton {
    self.button = [UIButton new];
    [self.view addSubview:self.button];
    [self.button addObserver:self forKeyPath:@"fractionCompleted" options:NSKeyValueObservingOptionNew context:nil];
    [self.button sd_setImageWithURL:[NSURL URLWithString:str] forState:UIControlStateNormal];
    [self.button setFrame:CGRectMake(100, 200, 200, 200)];
}

- (void)setHightLight {
    UIImageView *image = [UIImageView new];
    image.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:image];
    [image setHighlighted: true];
   
    [image sd_setHighlightedImageWithURL:[NSURL URLWithString:str]];
    [image setFrame:CGRectMake(100, 100, 100, 100)];
}

- (void)setAni {
    SDAnimatedImageView *image = [SDAnimatedImageView new];
    image.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:image];
    
    [image setHighlighted: true];
    
    [image sd_setHighlightedImageWithURL:[NSURL URLWithString:str]];
    [image setFrame:CGRectMake(100, 300, 100, 100)];
    image.sd_imageTransition = SDWebImageTransition.flipFromTopTransition;
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context
{
    if (object == self.button && [keyPath isEqualToString:@"fractionCompleted"]) {
         NSNumber *completedValue = change[NSKeyValueChangeNewKey];
        NSLog(@"fractionCompleted --- %@, localizedDescription --- %@, localizedAdditionalDescription --- %@", completedValue, self.button.sd_imageProgress.localizedDescription, self.button.sd_imageProgress.localizedAdditionalDescription);

    } else {
        [super observeValueForKeyPath:keyPath ofObject:object change:change context:context];
    }
}
@end
