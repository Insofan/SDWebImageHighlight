//
//  ViewController.m
//  SDWebImageHighlight
//
//  Created by Haixiao Xu on 2019/4/25.
//  Copyright © 2019 Haixiao Xu. All rights reserved.
//

#import "ViewController.h"
#import <SDWebImage/SDWebImage.h>
#import "FirViewController.h"


@interface ViewController ()

@end

@implementation ViewController




- (void)setCache {
    UIButton *btn = [UIButton new];
    [self.view addSubview:btn];
    [btn setTitle:@"Clear" forState:UIControlStateNormal];
    [btn setFrame:CGRectMake(100, 400, 100, 100)];
    [btn addTarget:self action:@selector(clear) forControlEvents:UIControlEventTouchUpInside];
}

- (void)clear {
    [SDWebImageManager.sharedManager.imageCache clearWithCacheType:SDImageCacheTypeAll completion:nil];
}

- (void)setPush {
    UIButton *btn = [UIButton new];
    [self.view addSubview:btn];
    [btn setTitle:@"push" forState:UIControlStateNormal];
    [btn setFrame:CGRectMake(100, 500, 100, 100)];
    [btn addTarget:self action:@selector(push) forControlEvents:UIControlEventTouchUpInside];
}

- (void)push {
    FirViewController *vc = [FirViewController new];
    [self.navigationController pushViewController:vc animated:false];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor redColor];
   
    [self setCache];
    [self setPush];

}


@end
