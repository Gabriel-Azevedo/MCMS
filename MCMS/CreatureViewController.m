//
//  CreatureViewController.m
//  MCMS
//
//  Created by Gabriel Borri de Azevedo on 1/13/15.
//  Copyright (c) 2015 Gabriel Enterprises. All rights reserved.
//

#import "CreatureViewController.h"
#import "MagicalCreature.h"

@interface CreatureViewController ()

@property (weak, nonatomic) IBOutlet UILabel *titleLabel;

@property (weak, nonatomic) IBOutlet UILabel *detailLabel;
@property (weak, nonatomic) IBOutlet UITextField *textFieldTitle;
@property (weak, nonatomic) IBOutlet UITextField *textFieldDetail;

@end

@implementation CreatureViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    NSLog(@"%@",self.creature.name);
    self.textFieldDetail.hidden = TRUE;
    self.textFieldTitle.hidden = TRUE;
    self.titleLabel.text = self.creature.name;
    self.detailLabel.text = self.creature.detail;
    
}

- (IBAction)onEditButtonTapped:(UIBarButtonItem *)sender
{
    if (self.editing)
    {
        self.editing = false;
        sender.style = UIBarButtonItemStylePlain;
        sender.title = @"Edit";
        self.textFieldDetail.hidden = TRUE;
        self.textFieldTitle.hidden = TRUE;
        if (![self.textFieldTitle.text isEqualToString:self.creature.name])
        {
            self.creature.name = self.textFieldTitle.text;
            NSLog(@"%@",self.creature.name);
        }
        if (![self.textFieldDetail.text isEqualToString:self.creature.detail])
        {
            self.creature.detail = self.textFieldDetail.text;
            NSLog(@"%@",self.creature.name);
        }
        self.titleLabel.text = self.creature.name;
        self.detailLabel.text = self.creature.detail;

        self.titleLabel.hidden = FALSE;
        self.detailLabel.hidden = FALSE;
    }
    else
    {
        self.editing = true;
        sender.style = UIBarButtonItemStyleDone;
        sender.title = @"Done";
        self.textFieldDetail.hidden = FALSE;
        self.textFieldTitle.hidden = FALSE;
        self.titleLabel.hidden = TRUE;
        self.detailLabel.hidden = TRUE;
        self.textFieldTitle.text = self.creature.name;
        self.textFieldDetail.text = self.creature.detail;
        NSLog(@"Editting");
    }
}
@end
