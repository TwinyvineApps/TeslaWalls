//
//  SecondViewController.h
//  TeslaWalls
//
//  Created by Jill Pestka on 8/7/13.
//  Copyright (c) 2013 Jill Pestka. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface SecondViewController : UIViewController
{
    IBOutlet UIImageView *teslaWall;
    
    UIImage *display;
    
    int rand, counttime;
    
    NSArray *teslaArray;
    
    IBOutlet UIActivityIndicatorView *loadIndicator;
    
    NSTimer *connectionTimer;

    IBOutlet UIButton *exploreBtn, *saveBtn;
}

-(IBAction)explore:(id)sender;

-(IBAction)savetoPhotos:(id)sender;


@end
