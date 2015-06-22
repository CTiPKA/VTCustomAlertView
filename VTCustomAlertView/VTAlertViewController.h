//
//  RDHelpPopupViewController.h
//  radose
//
//  Created by Vadim Trulyaev on 2/15/15.
//  Copyright (c) 2015 ecitrus. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface VTAlertViewController : UIViewController

typedef void (^VTAlertViewCompletionBlock) (NSInteger buttonIndex);

+ (void) showAllertViewForView:(UIViewController *) parentViewController withError:(NSError*)errorToShow resultBlock:(VTAlertViewCompletionBlock)resultBlock;

@property (nonatomic,strong) NSError *errorToShow;

@end
