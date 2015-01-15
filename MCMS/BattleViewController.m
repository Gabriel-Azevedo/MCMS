//
//  BattleViewController.m
//  MCMS
//
//  Created by Gabriel Borri de Azevedo on 1/14/15.
//  Copyright (c) 2015 Gabriel Enterprises. All rights reserved.
//

#import "BattleViewController.h"

@interface BattleViewController ()

@property NSArray *imagesArray;
@property (weak, nonatomic) IBOutlet UIImageView *imageView;

@end

@implementation BattleViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UIImage *imageCuca = [UIImage imageNamed:@"Cuca"];
    UIImage *imageCurupira = [UIImage imageNamed:@"Curupira"];
    UIImage *imageSaci = [UIImage imageNamed:@"Saci"];
    self.imagesArray = [[NSArray alloc] initWithObjects:imageCuca, imageCurupira, imageSaci, nil];
    int randomNumber = arc4random_uniform(3);
    if (randomNumber == 0)
    {
        [self.imageView setImage:imageCuca];
    }
    else if (randomNumber == 1)
    {
        [self.imageView setImage:imageCurupira];
    } else if (randomNumber == 2)
    {
        [self.imageView setImage:imageSaci];
    }
}

@end
