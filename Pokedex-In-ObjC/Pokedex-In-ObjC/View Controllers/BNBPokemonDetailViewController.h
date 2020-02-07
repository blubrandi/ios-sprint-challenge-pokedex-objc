//
//  BNBPokemonDetailViewController.h
//  Pokedex-In-ObjC
//
//  Created by Brandi Bailey on 2/6/20.
//  Copyright © 2020 Brandi Bailey. All rights reserved.
//

#import <UIKit/UIKit.h>

@class BNBPokemonController, BNBPokemon;

@interface BNBPokemonDetailViewController : UIViewController

@property (nonatomic) BNBPokemonController *pokemonController;
@property (nonatomic) BNBPokemon *pokemon;

@end


