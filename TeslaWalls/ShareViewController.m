//
//  ShareViewController.m
//  TeslaWalls
//
//  Created by Jill Pestka on 8/8/13.
//  Copyright (c) 2013 Jill Pestka. All rights reserved.
//

#import "ShareViewController.h"

@interface ShareViewController ()

@end

@implementation ShareViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	
}

-(IBAction)postToTwitter:(id)sender{
    
    if ([SLComposeViewController isAvailableForServiceType:SLServiceTypeTwitter])
    {
        SLComposeViewController *tweety = [SLComposeViewController
                                               composeViewControllerForServiceType:SLServiceTypeTwitter];
        [tweety setInitialText:@"I love the Tesla Model S!!"];
        
        [self presentViewController:tweety animated:YES completion:nil];
    }
    else {
        UIAlertView *alertView = [[UIAlertView alloc]
                                  initWithTitle:@"Sorry"
                                  message:@"You can't post to Twitter now, make sure your device has an internet connection and you have your Twitter account set up in your device settings"
                                  delegate:self
                                  cancelButtonTitle:@"OK"
                                  otherButtonTitles:nil];
        [alertView show];
    }
    
}



-(IBAction)postToFacebook:(id)sender{
    
    if([SLComposeViewController isAvailableForServiceType:SLServiceTypeFacebook]) {
        SLComposeViewController *fbcontroller = [SLComposeViewController composeViewControllerForServiceType:SLServiceTypeFacebook];
        
        [fbcontroller setInitialText:@"I love the Tesla Model S!!!"];
        
        [fbcontroller addURL:[NSURL URLWithString:@"http://www.teslamotors.com"]];
        [fbcontroller addImage:[UIImage imageNamed:@"tesla_flag.png"]];
        [self presentViewController:fbcontroller animated:YES completion:Nil];
    }
    else {
        UIAlertView *alertView = [[UIAlertView alloc]
                                  initWithTitle:@"Sorry"
                                  message:@"You can't post to facebook now, make sure your device has an internet connection and you have your facebook account set up in your device settings"
                                  delegate:self
                                  cancelButtonTitle:@"OK"
                                  otherButtonTitles:nil];
        [alertView show];
    }
    
   
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
