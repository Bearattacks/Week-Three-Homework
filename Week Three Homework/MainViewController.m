//
//  MainViewController.m
//  Week Three Homework
//
//  Created by Tim Collins on 6/29/14.
//  Copyright (c) 2014 Tim Collins. All rights reserved.
//

#import "MainViewController.h"

@interface MainViewController ()


@property (weak, nonatomic) IBOutlet UIView *containerView;
@property (weak, nonatomic) IBOutlet UIImageView *headlineImage;
@property (weak, nonatomic) IBOutlet UIImageView *storyStrip;
@property (weak, nonatomic) IBOutlet UIScrollView *storyStripScrollView;

- (void)onCustomPan:(UIPanGestureRecognizer *)panGestureRecognizer;
- (void)animateDown;
- (void)animateUp;

@end

@implementation MainViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];

    UIPanGestureRecognizer *panGestureRecognizer = [[UIPanGestureRecognizer alloc]initWithTarget:self action:@selector(onCustomPan:)];
  
    self.storyStripScrollView.contentSize = CGSizeMake(1700, 300);
                                                       
    self.storyStripScrollView.scrollEnabled = YES;
    
    [self.view addGestureRecognizer:panGestureRecognizer];
    
    [[UIApplication sharedApplication] setStatusBarHidden:YES
                                            withAnimation:UIStatusBarAnimationFade];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)onCustomPan:(UIPanGestureRecognizer *)panGestureRecognizer {
    CGPoint point = [panGestureRecognizer locationInView:self.containerView];
    CGPoint velocity = [panGestureRecognizer velocityInView:self.containerView];
    CGPoint translation = [panGestureRecognizer translationInView:panGestureRecognizer.view];
    
    self.containerView.center = CGPointMake(self.containerView.center.x ,
                                         self.containerView.center.y + translation.y);
    [panGestureRecognizer setTranslation:CGPointMake(0, 0) inView:self.view];
    
    
    if(velocity.y > 0 && panGestureRecognizer.state == UIGestureRecognizerStateEnded)
    {
        [self animateViewDown];
    }

    if(velocity.y < 0 && panGestureRecognizer.state == UIGestureRecognizerStateEnded)
    {
        [self animateViewUp];
    }
    
    if(self.containerView.center.y < 280 && panGestureRecognizer.state == UIGestureRecognizerStateChanged){
     NSLog(@"increase friction");
//        self.containerView.center = CGPointMake(self.containerView.center.x, self.containerView.center.y + self.containerView.center.y/.25);
        
        self.containerView.center = CGPointMake(self.containerView.center.x ,
                                                self.containerView.center.y + translation.y/5);
        [panGestureRecognizer setTranslation:CGPointMake(0, 0) inView:self.view];
    
    }

    if (panGestureRecognizer.state == UIGestureRecognizerStateBegan) {


        
    } else if (panGestureRecognizer.state == UIGestureRecognizerStateChanged) {
        

        
    } else if (panGestureRecognizer.state == UIGestureRecognizerStateEnded) {


        
    }
    
}
- (BOOL)prefersStatusBarHidden {
    return YES;
}

-(void)animateViewDown
{
    [UIView animateWithDuration:.65 delay:0 usingSpringWithDamping:.8 initialSpringVelocity:12 options:0 animations:^{
        self.containerView.center = CGPointMake(self.containerView.center.x, 760);
    } completion:nil];
}

-(void)animateViewUp
{
    [UIView animateWithDuration:.65 delay:0 usingSpringWithDamping:.8 initialSpringVelocity:12 options:0 animations:^{
        self.containerView.center = CGPointMake(self.containerView.center.x, 280);
    } completion:nil];
}

@end
