//
//  ViewController.m
//  ButtonFun
//
//  Created by ayatollah7 on 7/22/15.
//  Copyright (c) 2015 Julien Missial. All rights reserved.
//

#import "ViewController.h"

// Use this quite often as an easier alternative to colorWithRed:
#define UIColorFromRGB(rgbValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]
#define RANDOM_HEX arc4random() % 0x1000000


@interface ViewController (){
    NSMutableArray * buttonGrid;
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Do any additional setup after loading the view, typically from a nib.
    buttonGrid = [[NSMutableArray alloc]init];
    
    [self performSelectorInBackground:@selector(createButtonGrid) withObject:nil];
    
}

#pragma mark - Creating the Grid
-(void)createButtonGrid{
    
    for (int i = 0; i < [UIScreen mainScreen].applicationFrame.size.height/40; i++){
        for (int j = 0; j < [UIScreen mainScreen].applicationFrame.size.height/40; j++) {
            UIButton * b = [UIButton buttonWithType:UIButtonTypeSystem];
            b.frame = CGRectMake(40 * i, 40 * j, 40, 40);
            b.backgroundColor = UIColorFromRGB(RANDOM_HEX);
            
            [b addTarget:self action:@selector(changeButtonColor:) forControlEvents:UIControlEventTouchUpInside];
            
            [buttonGrid addObject:b];
            NSLog(@"added Button to buttonGrid\n");
        }
    }
    
    for(UIButton *button in buttonGrid) [self.view addSubview:button];
    
    
}

#pragma mark - Change the button color
-(void)changeButtonColor:(id)sender{
    UIButton * button = (UIButton * )sender;
    button.backgroundColor = UIColorFromRGB(RANDOM_HEX);
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
#pragma mark - hiding status bar 
- (BOOL)prefersStatusBarHidden {
    return YES;
}

@end
