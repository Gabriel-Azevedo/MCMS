//
//  ViewController.m
//  MCMS
//
//  Created by Gabriel Borri de Azevedo on 1/13/15.
//  Copyright (c) 2015 Gabriel Enterprises. All rights reserved.
//

#import "RootViewController.h"
#import "MagicalCreature.h"
#import "CreatureViewController.h"
#import "BattleViewController.h"

@interface RootViewController () <UITableViewDataSource, UITableViewDelegate>

@property (weak, nonatomic) IBOutlet UITextField *textField1;
@property (weak, nonatomic) IBOutlet UITextField *textField2;
@property (weak, nonatomic) IBOutlet UITableView *tableView;


@end

@implementation RootViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    MagicalCreature *creature1 = [[MagicalCreature alloc] initWithName:@"Cuca" :@"Crocodile Woman"];
    MagicalCreature *creature2 = [[MagicalCreature alloc] initWithName:@"Curupira" :@"Protector of the Woods"];
    MagicalCreature *creature3 = [[MagicalCreature alloc] initWithName:@"Saci Perere" :@"Prankster One-Legged Kid"];

    self.creatures = [[NSMutableArray alloc] initWithObjects:creature1, creature2, creature3, nil];
}

-(void)viewWillAppear:(BOOL)animated
{
    [self.tableView reloadData];
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.creatures.count;

}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell"];
    MagicalCreature *creature = [self.creatures objectAtIndex:indexPath.row];
    cell.textLabel.text = creature.name;
    cell.detailTextLabel.text = creature.detail;
    NSLog(@"%@",creature.creatureAccessories);
    return cell;
}

- (IBAction)onAddButtonTapped:(UIButton *)sender
{
    MagicalCreature *aCreature = [[MagicalCreature alloc] initWithName:self.textField1.text :self.textField2.text];
    [self.creatures addObject:aCreature];
    [self.tableView reloadData];
    self.textField1.text = nil;
    self.textField2.text = nil;
    [self.textField1 resignFirstResponder];
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"ShowCreatureSegue"])
    {
    NSIndexPath *path = [self.tableView indexPathForSelectedRow];
    CreatureViewController *creatureVC = segue.destinationViewController;
    creatureVC.creature = [self.creatures objectAtIndex:path.row];
    }
}



@end
