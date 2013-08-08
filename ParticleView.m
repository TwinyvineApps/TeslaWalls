//
//  ParticleView.m
//  TeslaWalls
//
//  Created by Jill Pestka on 8/8/13.
//  Copyright (c) 2013 Jill Pestka. All rights reserved.
//

#import "ParticleView.h"

@implementation ParticleView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        UIImage *partImage = [UIImage imageNamed:@"redbeam.png"];
        beam = [[UIImageView alloc] initWithImage:partImage];
        beam.frame = CGRectMake(0, 0, 40, 18);
        [self addSubview:beam];
        
        [self animateBeam];
    }
    return self;
}

-(void)animateBeam {
    
    [beam setAlpha:0.2];
    [UIView animateWithDuration:1.0
                     animations:^{
                         [beam setAlpha:1];
                     } completion:^(BOOL finished) {
                         [UIView animateWithDuration:0.5
                                          animations:^{
                                              [beam setAlpha:0.5];
                                          }];
                     }];
}


@end
