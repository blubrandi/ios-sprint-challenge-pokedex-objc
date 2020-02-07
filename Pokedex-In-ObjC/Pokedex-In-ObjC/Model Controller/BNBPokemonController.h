//
//  BNBPokemonController.h
//  Pokedex-In-ObjC
//
//  Created by Brandi Bailey on 2/6/20.
//  Copyright © 2020 Brandi Bailey. All rights reserved.
//

#import <Foundation/Foundation.h>


@class BNBPokemon;

@interface BNBPokemonController : NSObject

- (void)fetchPokemonWithAPIController:(void (^)(NSError *error))completion;
- (void)fetchDetailsWithAPIControllerForPokemon:(BNBPokemon *)pokemon;
- (NSArray <BNBPokemon *> *)getPokemons;

@end

