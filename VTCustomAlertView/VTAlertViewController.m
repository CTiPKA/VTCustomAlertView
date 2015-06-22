//
//  RDHelpPopupViewController.m
//  radose
//
//  Created by Vadim Trulyaev on 2/15/15.
//  Copyright (c) 2015 ecitrus. All rights reserved.
//

#import "VTAppTheme.h"
#import "VTAlertViewController.h"

@interface VTAlertViewController ()

@property (nonatomic,strong) NSError *error;

@property (weak, nonatomic) IBOutlet UIButton *yesBtn;
@property (weak, nonatomic) IBOutlet UIButton *noBtn;

- (IBAction)yesPressed:(UIButton *)sender;
- (IBAction)noPressed:(UIButton *)sender;
- (IBAction)closePopup:(UIButton *)sender;

@property (weak, nonatomic) IBOutlet UIImageView *backgroundBlurView;

@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *descriptionLabel;

@property (nonatomic,strong) UIViewController *parentVC;
@property (copy, nonatomic) VTAlertViewCompletionBlock completionBlock;

@end

@implementation VTAlertViewController

- (void)setErrorToShow:(NSError *)errorToShow
{
    [self.titleLabel setText:self.errorToShow.localizedDescription];
    [self.descriptionLabel setText:self.errorToShow.localizedRecoverySuggestion];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self drawBackgroundBlurView];
}

- (void)drawBackgroundBlurView
{
    self.backgroundBlurView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    [self.backgroundBlurView setImage:[VTAppTheme imageByBlurringView:self.parentVC.view]];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - user actions

- (IBAction)yesPressed:(UIButton *)sender
{
    if (self.completionBlock) {
        self.completionBlock(1);
    }
    
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)noPressed:(UIButton *)sender
{
    if (self.completionBlock) {
        self.completionBlock(2);
    }
    
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)closePopup:(UIButton *)sender
{
    if (self.completionBlock) {
        self.completionBlock(0);
    }
    
    [self dismissViewControllerAnimated:YES completion:nil];
}

#pragma mark - public

+ (void) showAllertViewForView:(UIViewController *) parentViewController withError:(NSError*)errorToShow resultBlock:(VTAlertViewCompletionBlock)resultBlock
{
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    VTAlertViewController * alertView = (VTAlertViewController *)[storyboard instantiateViewControllerWithIdentifier:@"Custom Alert View"];
    
    alertView.error = errorToShow;
    
    [alertView showAlertView:alertView forView:(UIViewController *) parentViewController resultBlock:resultBlock];
}


- (void) showAlertView:(VTAlertViewController*)alertView forView:(UIViewController *)parentVC resultBlock:(VTAlertViewCompletionBlock)resultBlock
{
    // present
    [parentVC presentViewController:self animated:YES completion:nil];
    
    self.parentVC = parentVC;
    self.completionBlock = resultBlock;
}

@end
