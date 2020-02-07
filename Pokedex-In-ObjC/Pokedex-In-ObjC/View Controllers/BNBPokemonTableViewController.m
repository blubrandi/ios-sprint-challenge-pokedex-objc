//
//  BNBPokemonTableViewController.m
//  Pokedex-In-ObjC
//
//  Created by Brandi Bailey on 1/31/20.
//  Copyright © 2020 Brandi Bailey. All rights reserved.
//

#import "BNBPokemonTableViewController.h"
#import "BNBPokemon.h"
#import "BNBPokemonController.h"
#import "BNBPokemonDetailViewController.h"

@interface BNBPokemonTableViewController ()
@property (nonatomic) BNBPokemonController *pokemonController;

@end

@implementation BNBPokemonTableViewController

- (instancetype)initWithCoder:(NSCoder *)coder {
    self = [super initWithCoder:coder];
    if (self) {
        _pokemonController = [[BNBPokemonController alloc] init];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.pokemonController fetchPokemonWithAPIController:^(NSError *error) {
        if (error) {
            NSLog(@"Error: %@", error);
        } else {
            dispatch_async(dispatch_get_main_queue(), ^{
                [self.tableView reloadData];
            });
        }
    }];
}

#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.pokemonController getPokemons].count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"PokeCell" forIndexPath:indexPath];
    cell.textLabel.text = [self.pokemonController getPokemons][indexPath.row].name;
    
    return cell;
}

#pragma mark - Navigation

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    BNBPokemonDetailViewController *detailVC = [segue destinationViewController];
    if ([segue.identifier isEqualToString:@"ToPokeDetailSegue"]) {
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
        detailVC.pokemonController = self.pokemonController;
        detailVC.pokemon = [self.pokemonController getPokemons][indexPath.row];
    }
}

@end
