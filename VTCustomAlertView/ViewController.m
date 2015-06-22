//
//  ViewController.m
//  VTCustomAlertView
//
//  Created by Vadim Trulyaev on 6/22/15.
//  Copyright (c) 2015 vt. All rights reserved.
//

#import "VTAlertViewController.h"
#import "ViewController.h"

@interface ViewController ()

- (IBAction)showYesNoAlert:(UIButton *)sender;
- (IBAction)showOkAlert:(UIButton *)sender;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)showYesNoAlert:(UIButton *)sender
{
    NSError *errorToShow = [NSError errorWithDomain:@"com.vt.VTCustomAlertView"
                                                   code:999
                                               userInfo:@{
                                                          @"Warning Yes/No":NSLocalizedDescriptionKey,
                                                          @"Warning description. It can be quite long description":NSLocalizedRecoverySuggestionErrorKey,
                                                          }];
    
    [VTAlertViewController showAllertViewForView:self
                                       withError:errorToShow
                                     resultBlock:^(NSInteger buttonIndex) {
                                         NSLog(@"Button with index %ld pressed", (long)buttonIndex);
                                         if (buttonIndex == 1) {
                                             NSLog(@"Button 'Yes' pressed");
                                         } else if (buttonIndex == 2) {
                                             NSLog(@"Button 'No' pressed");
                                         } else if (buttonIndex == 0) {
                                             NSLog(@"Button 'Cancel (Close)' pressed");
                                         }
                                     }];
}

- (IBAction)showOkAlert:(UIButton *)sender
{
    
}

@end
