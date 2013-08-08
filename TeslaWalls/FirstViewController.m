//
//  FirstViewController.m
//  TeslaWalls
//
//  Created by Jill Pestka on 8/7/13.
//  Copyright (c) 2013 Jill Pestka. All rights reserved.
//

#import "FirstViewController.h"

@interface FirstViewController ()

@end

@implementation FirstViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	
}

-(void)viewDidAppear:(BOOL)animated {
    
    //Simple effect with a custom particle UIView class to add some drama to the scene
    partView = [[ParticleView alloc] initWithFrame:CGRectMake(-50, 300, 40, 18)];
    [self.view addSubview:partView];
    
    
    //adding a slight delay here to improve the effects visibility on launch
    [self performSelector:@selector(animateBeam) withObject:self afterDelay:0.25];
}
-(void)animateBeam {
    
    [UIView animateWithDuration:1.5 
                     animations:^{
                         partView.transform = CGAffineTransformMakeTranslation(400, 0);
                     } completion:^(BOOL finished) {
                         
                         [partView removeFromSuperview];
                     }];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
