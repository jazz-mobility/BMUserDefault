//
//  ViewController.m
//  BMUserDefault
//
//  Created by bomo on 2017/3/13.
//  Copyright © 2017年 bomo. All rights reserved.
//

#import "ViewController.h"
#import "BMUserDefault.h"

@interface ViewController ()

@property (nonatomic, strong) BMUserDefault *userDefault;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (IBAction)click:(id)sender {
    NSString *path = [NSTemporaryDirectory() stringByAppendingPathComponent:@"test.plist"];
    BMUserDefault *userDefault = [BMUserDefault userDefaultWithPath:path];
    
    [userDefault setInteger:arc4random() % 100 forKey:@"bb"];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
