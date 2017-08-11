//
//  MyPageViewController.m
//  Demo
//
//  Created by Sam Meech-Ward on 2017-08-11.
//  Copyright © 2017 Sam Meech-Ward. All rights reserved.
//

#import "MyPageViewController.h"
#import "PagesOfDifferentMoviePostersViewController.h"

@interface MyPageViewController () <UIPageViewControllerDataSource>

@end

@implementation MyPageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.dataSource = self;
    
    PagesOfDifferentMoviePostersViewController *vc = [self.storyboard instantiateViewControllerWithIdentifier:@"page-view-controller"];
    vc.pageNumber = 1;
    
    [self setViewControllers:@[vc] direction:(UIPageViewControllerNavigationDirectionForward) animated:NO completion:nil];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerAfterViewController:(UIViewController *)viewController {
    
    int currentPageNumber = ((PagesOfDifferentMoviePostersViewController *)viewController).pageNumber;
    
    PagesOfDifferentMoviePostersViewController *vc = [self.storyboard instantiateViewControllerWithIdentifier:@"page-view-controller"];
    
    vc.pageNumber = currentPageNumber + 1;

    return vc;
}

- (UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerBeforeViewController:(UIViewController *)viewController {
    
    int currentPageNumber = ((PagesOfDifferentMoviePostersViewController *)viewController).pageNumber;
    
    if (currentPageNumber == 1) {
        return nil;
    }
    
    PagesOfDifferentMoviePostersViewController *vc = [self.storyboard instantiateViewControllerWithIdentifier:@"page-view-controller"];
    
    vc.pageNumber = currentPageNumber - 1;
    
    return vc;
}

@end
