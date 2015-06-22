//
//  RDAppTheme.m
//  Radose
//
//  Created by Vadzim Truliayeu on 09/04/13.
//  Copyright (c) 2013 Vadzim Truliayeu. All rights reserved.
//

#import <CoreImage/CoreImage.h>
#import "VTAppTheme.h"
#import "UIImage+DIDImageEffects.h"

@implementation VTAppTheme

#pragma mark - some image tools

+ (UIImage *)imageByBlurringView:(UIView *)view
{
    BOOL isPortrait = (UIInterfaceOrientationIsPortrait([[UIApplication sharedApplication] statusBarOrientation]));
    
    CGRect frame;
    if(isPortrait) {
        frame = CGRectMake(view.frame.origin.x, 0, view.frame.size.width, view.frame.size.height);
    }
    else {
        frame = CGRectMake(view.frame.origin.x, view.frame.origin.y, view.frame.size.height, view.frame.size.width);
    }

    UIGraphicsBeginImageContextWithOptions(view.bounds.size, true, 1);
    
    [view drawViewHierarchyInRect:view.bounds afterScreenUpdates:NO];
    
    // Get the snapshot
    UIImage *snapshotImage = UIGraphicsGetImageFromCurrentImageContext();
    
    // Apply blur
    UIColor *tintColor = [UIColor colorWithWhite:0.8 alpha:0.3];
    UIImage *blurredSnapshotImage = [snapshotImage applyBlurWithRadius:12
                                                             tintColor:tintColor
                                                 saturationDeltaFactor:1.8
                                                             maskImage:nil];
    
    UIGraphicsEndImageContext();
    
    return blurredSnapshotImage;
}

@end
