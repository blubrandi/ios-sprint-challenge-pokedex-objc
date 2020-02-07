//
//  BNBPokemonDetailViewController.m
//  Pokedex-In-ObjC
//
//  Created by Brandi Bailey on 2/6/20.
//  Copyright © 2020 Brandi Bailey. All rights reserved.
//

#import "BNBPokemonDetailViewController.h"
#import "BNBPokemon.h"
#import "BNBPokemonController.h"

void *KVOContext = &KVOContext;

@interface BNBPokemonDetailViewController ()

@property (weak, nonatomic) IBOutlet UILabel *pokeNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *pokeAbilitiesLabel;
@property (weak, nonatomic) IBOutlet UIImageView *spriteImage;
@property (weak, nonatomic) IBOutlet UILabel *pokeIDLabel;

@end

@implementation BNBPokemonDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.pokemonController fetchDetailsWithAPIControllerForPokemon:self.pokemon];
    
    [_pokemon addObserver:self forKeyPath:@"abilities" options:NSKeyValueObservingOptionNew context:KVOContext];
    [_pokemon addObserver:self forKeyPath:@"identifier" options:NSKeyValueObservingOptionNew context:KVOContext];
    [_pokemon addObserver:self forKeyPath:@"sprite" options:NSKeyValueObservingOptionNew context:KVOContext];
}

- (void)updateViews {
    if(self.pokemon) {
        dispatch_async(dispatch_get_main_queue(), ^{
            self.pokeNameLabel.text = [NSString stringWithFormat:@"Name: %@",self.pokemon.name];
            self.pokeIDLabel.text = [NSString stringWithFormat:@"ID: %d", self.pokemon.identifier];
            self.spriteImage.image = self.pokemon.sprite;
            NSString *abilityString = [[self.pokemon.abilities valueForKey:@"description"] componentsJoinedByString:@", "];
            self.pokeAbilitiesLabel.text = [NSString stringWithFormat:@"Abilities: %@", abilityString];
        });
    }
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context {
    if (context == KVOContext) {
        if([keyPath isEqualToString:@"abilities"]) {
            [self updateViews];
        } else if([keyPath isEqualToString:@"identifier"]) {
            [self updateViews];
        } else if([keyPath isEqualToString:@"sprite"]) {
            [self updateViews];
        }
    } else {
        [super observeValueForKeyPath:keyPath ofObject:object change:change context:context];
    }
}

- (void)dealloc {
    _pokemon = nil;
}

@end
