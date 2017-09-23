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
@property (nonatomic) NSUInteger currentPage;

@end

@implementation HandlePageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.currentPage = 0;
    self.dataSource= self;
    self.delegate = self;
    
    //set the storypartview controller storyboard id as story part.
    StoryPartViewController *view1 = [self.storyboard instantiateViewControllerWithIdentifier:@"StoryPart"];
    
    StoryPartViewController *view2 = [self.storyboard instantiateViewControllerWithIdentifier:@"StoryPart"];
   
    StoryPartViewController *view3 = [self.storyboard instantiateViewControllerWithIdentifier:@"StoryPart"];
    
    StoryPartViewController *view4 = [self.storyboard instantiateViewControllerWithIdentifier:@"StoryPart"];
    
    StoryPartViewController *view5 = [self.storyboard instantiateViewControllerWithIdentifier:@"StoryPart"];
    
    self.pageHolderArray = @[view1, view2, view3, view4, view5];
    
    
    self.navigationItem.title = [NSString stringWithFormat:@"Page #1"];
    
    [self setViewControllers:@[view1] direction:UIPageViewControllerNavigationDirectionForward animated:NO completion:nil];
    
}


//scroll backwards

- (nullable UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerBeforeViewController:(UIViewController *)viewController{

    NSInteger currentIndex = [self.pageHolderArray indexOfObject:viewController];
    NSInteger prevIndex = (currentIndex - 1) % self.pageHolderArray.count;
    
    self.navigationItem.title = [NSString stringWithFormat:@"Page #%lu", prevIndex + 1];
    self.currentPage = prevIndex;
    return self.pageHolderArray[prevIndex];
    
}


//scroll forward
- (nullable UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerAfterViewController:(UIViewController *)viewController{
    
    NSInteger currentIndex = [self.pageHolderArray indexOfObject:viewController];
    NSInteger nextIndex = currentIndex + 1;
    NSInteger count = self.pageHolderArray.count - 1;
    
    //prevent scroll from going out of bounds
    if (nextIndex > count){
    self.currentPage = 0;
    self.navigationItem.title = [NSString stringWithFormat:@"Page #1"];
    return self.pageHolderArray[self.currentPage];
    }
    
    self.navigationItem.title = [NSString stringWithFormat:@"Page #%lu", nextIndex + 1];
    self.currentPage = nextIndex;
    return self.pageHolderArray[nextIndex];
    
}



@end
