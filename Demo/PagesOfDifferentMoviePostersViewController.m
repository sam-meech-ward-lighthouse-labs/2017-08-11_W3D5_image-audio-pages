//
//  PagesOfDifferentMoviePostersViewController.m
//  Demo
//
//  Created by Sam Meech-Ward on 2017-08-11.
//  Copyright © 2017 Sam Meech-Ward. All rights reserved.
//

#import "PagesOfDifferentMoviePostersViewController.h"

@interface PagesOfDifferentMoviePostersViewController ()
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (weak, nonatomic) IBOutlet UILabel *pageNumberLabel;

@end

@implementation PagesOfDifferentMoviePostersViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self.pageNumberLabel setText:[NSString stringWithFormat:@"Page Number: %i", self.pageNumber]];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)setPageNumber:(int)pageNumber {
    _pageNumber = pageNumber;
    
    [self.pageNumberLabel setText:[NSString stringWithFormat:@"Page Number: %i", pageNumber]];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
