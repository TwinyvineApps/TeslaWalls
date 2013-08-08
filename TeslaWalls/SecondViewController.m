//
//  SecondViewController.m
//  TeslaWalls
//
//  Created by Jill Pestka on 8/7/13.
//  Copyright (c) 2013 Jill Pestka. All rights reserved.
//

#import "SecondViewController.h"

@interface SecondViewController ()

@end

@implementation SecondViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    
    //Load indicator to the user know the photos are loading, otherwise the app would look broken or empty
    [loadIndicator startAnimating];
    loadIndicator.hidesWhenStopped = YES;
    
    
    
    // Hide buttons the user can't save a non-existent image, and also makes the view snappy when they pop in at the same time as the photos
    saveBtn.hidden = YES;
    exploreBtn.hidden = YES;
    
    //I don't want to keep re-loading the images so I only need to set up the method here in the viewDidLoad
    [self performSelector:@selector(loadImages) withObject:self afterDelay:0.5];
    
    connectionTimer = [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector (checkStatus) userInfo:nil repeats:YES];
}

-(void)loadImages {
    
    NSURL *url1 = [NSURL URLWithString:@"http://www.teslamotors.com/sites/default/files/model-s-sigred-front3qtr_640x960.jpg"];
    
    NSURL *url2 = [NSURL URLWithString:@"http://www.teslamotors.com/sites/default/files/dsc_4916_640x960.jpg"];
    
    NSURL *url3 = [NSURL URLWithString:@"http://www.teslamotors.com/sites/default/files/model-s_640x960_f.jpg"];
    
    NSURL *url4 =[NSURL URLWithString:@"http://www.teslamotors.com/sites/default/files/dsc_5609_640x960.jpg"];
    
    NSURL *url5 =[NSURL URLWithString:@"http://www.teslamotors.com/sites/default/files/model-s-red-palosverde_640x960.jpg"];
    
    NSData *imageData1 = [NSData dataWithContentsOfURL:url1];
    NSData *imageData2 = [NSData dataWithContentsOfURL:url2];
    NSData *imageData3 = [NSData dataWithContentsOfURL:url3];
    NSData *imageData4 = [NSData dataWithContentsOfURL:url4];
    NSData *imageData5 = [NSData dataWithContentsOfURL:url5];
    
    teslaArray = [NSArray arrayWithObjects:[UIImage imageWithData:imageData1], [UIImage imageWithData:imageData2], [UIImage imageWithData:imageData3], [UIImage imageWithData:imageData4], [UIImage imageWithData:imageData5], nil];
    
    rand = arc4random_uniform(4);
    
}

-(void)checkStatus {
    
    
    counttime++;
    
    if ([teslaArray count] == 0) {
        
        NSLog(@"array is still loading");
    }
    
    if ([teslaArray count] == 5) {
        
        display = [teslaArray objectAtIndex:rand];
        teslaWall.image = display;
        
        [loadIndicator stopAnimating];
        [connectionTimer invalidate];
        
        
        saveBtn.hidden = NO;
        exploreBtn.hidden = NO;
        // NSLog to check in console if the timer is properly invalidated
        //NSLog(@"timer was invalidated");
    }
    
    if (counttime > 13) {
        
        //There is another way to check if the user is not connected with "Reachability" but this is an easy way to let the user know something might be wrong if it is taking a long time for the images to load.
        
        if ([teslaArray count] == 0) {
            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Check Connection" message:@"This is taking awhile, please check your connection" delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:nil];
            
            [alert show];
            
        //The user may know they are on a slow connection and can keep trying to load if they like, however the warning will show again so I set the countime to 0
            counttime = 0;
            
        }
    }
    
}


-(IBAction)explore:(id)sender{
    
    rand++;
    if (rand == 5 ) { rand = 0;}
    
    display = [teslaArray objectAtIndex:rand];
    teslaWall.image = display;
    
}

-(IBAction)savetoPhotos:(id)sender{
    
     UIImageWriteToSavedPhotosAlbum(display, self, @selector(imageSavedToPhotosAlbum: didFinishSavingWithError: contextInfo:), nil);
    
    //disable the button incase the user accidentally taps more than once, which might lead to unpleasant functionality or many saved versions of the same photo
    saveBtn.enabled = NO;
}

- (void)imageSavedToPhotosAlbum:(UIImage *)image didFinishSavingWithError:(NSError *)error contextInfo:(void *)contextInfo {
    NSString *message;
    NSString *title;
    if (!error) {
        title = NSLocalizedString(@"Image Saved", @"");
        message = NSLocalizedString(@"You can now view the image in your photo album", @"");
        saveBtn.enabled = YES;
    } else {
        title = NSLocalizedString(@"Save Failed", @"");
        message = NSLocalizedString(@"Please enable this app to save photos under Settings>Privacy>Photos", @"");
        saveBtn.enabled = YES;
    }
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:title
                                                    message:message
                                                   delegate:nil
                                          cancelButtonTitle:NSLocalizedString(@"OK", @"")
                                          otherButtonTitles:nil];
    [alert show];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
