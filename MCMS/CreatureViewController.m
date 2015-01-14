//
//  CreatureViewController.m
//  MCMS
//
//  Created by Gabriel Borri de Azevedo on 1/13/15.
//  Copyright (c) 2015 Gabriel Enterprises. All rights reserved.
//

#import "CreatureViewController.h"
#import "MagicalCreature.h"

@interface CreatureViewController () <UITableViewDataSource, UITableViewDelegate>

@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *detailLabel;
@property (weak, nonatomic) IBOutlet UITextField *textFieldTitle;
@property (weak, nonatomic) IBOutlet UITextField *textFieldDetail;
@property (weak, nonatomic) IBOutlet UIImageView *imageView;

@property NSArray *accessories;
@property (weak, nonatomic) IBOutlet UITableView *tableView;

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
    if ([self.creature.name isEqualToString:@"Cuca"])
    {
        UIImage *image = [UIImage imageNamed:@"Cuca"];
        [self.imageView setImage:image];
    }
    else if ([self.creature.name isEqualToString:@"Curupira"])
    {
        UIImage *image = [UIImage imageNamed:@"Curupira"];
        [self.imageView setImage:image];
    }
    else if ([self.creature.name isEqualToString:@"Saci Perere"])
    {
        UIImage *image = [UIImage imageNamed:@"Saci"];
        [self.imageView setImage:image];
    }
    self.accessories = [[NSArray alloc] initWithObjects:@"Sword", @"Knife", @"Gun", @"Bow", nil];

    self.creature.creatureAccessories = [NSMutableArray new];
}

/*- (void)viewWillAppear:(BOOL)animated
{
    NSLog(@"running viewWIllAppear for TripsTable");

    //Getting indexpath for highlighened cell, to rehighlight
    NSIndexPath *selectedIndex = [self.tableView indexPathForSelectedRow];

    //Refreshing Table - Implement an if statement on the condition that the data has     changed
    [self viewDidLoad];
    [self.tableView reloadData];

    //Re select cell
    for (NSString *string in self.creature.creatureAccessories)
    {
        UITableViewCell *cell = [self.tableView cellForRowAtIndexPath:selectedIndex];
        if ([string isEqualToString:cell.detailTextLabel.text])
        {
            [self.tableView selectRowAtIndexPath:selectedIndex animated:NO scrollPosition:UITableViewScrollPositionNone];
        }
    }
    [super viewWillAppear:animated];
}*/

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"AcCell"];
    cell.textLabel.text = [self.accessories objectAtIndex:indexPath.row];
    if (cell.accessoryType == UITableViewCellAccessoryCheckmark)
    {
        cell.accessoryType = UITableViewCellAccessoryNone;
    }
    else
    {
        cell.accessoryType = UITableViewCellAccessoryCheckmark;
    }
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    if (cell.accessoryType == UITableViewCellAccessoryCheckmark)
    {
        [self.creature.creatureAccessories removeObject:[self.accessories objectAtIndex:indexPath.row]];
        cell.accessoryType = UITableViewCellAccessoryNone;
    }
    else
    {
        [self.creature.creatureAccessories addObject:[self.accessories objectAtIndex:indexPath.row]];
        cell.accessoryType = UITableViewCellAccessoryCheckmark;
    }
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 4;
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
