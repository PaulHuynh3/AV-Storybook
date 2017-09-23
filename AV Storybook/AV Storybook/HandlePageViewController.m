//
//  HandlePageViewController.m
//  AV Storybook
//
//  Created by Paul on 2017-09-23.
//  Copyright © 2017 Paul. All rights reserved.
//

#import "HandlePageViewController.h"
#import "StoryPartViewController.h"
@interface HandlePageViewController ()<UIPageViewControllerDelegate, UIPageViewControllerDataSource>
@property (nonatomic) NSArray* pageHolderArray;
@end

@implementation HandlePageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    self.dataSource= self;
    self.delegate = self;
    
    //set the storypartview controller storyboard id as story part.
    StoryPartViewController *view1 = [self.storyboard instantiateViewControllerWithIdentifier:@"StoryPart"];
    
    StoryPartViewController *view2 = [self.storyboard instantiateViewControllerWithIdentifier:@"StoryPart"];
   
    StoryPartViewController *view3 = [self.storyboard instantiateViewControllerWithIdentifier:@"StoryPart"];
    
    StoryPartViewController *view4 = [self.storyboard instantiateViewControllerWithIdentifier:@"StoryPart"];
    
    StoryPartViewController *view5 = [self.storyboard instantiateViewControllerWithIdentifier:@"StoryPart"];
    
    self.pageHolderArray = @[view1, view2, view3, view4, view5];
    
}


- (nullable UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerBeforeViewController:(UIViewController *)viewController{

    return nil;
    
}


- (nullable UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerAfterViewController:(UIViewController *)viewController{
    return nil;

}



@end
