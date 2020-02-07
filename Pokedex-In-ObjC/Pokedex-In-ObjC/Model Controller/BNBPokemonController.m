//
//  BNBPokemonController.m
//  Pokedex-In-ObjC
//
//  Created by Brandi Bailey on 2/6/20.
//  Copyright © 2020 Brandi Bailey. All rights reserved.
//

#import "Pokedex_In_ObjC-Swift.h"
#import "BNBPokemonController.h"

@interface BNBPokemonController()

@property (nonatomic) NSArray<BNBPokemon *> *pokemons;

@end

@implementation BNBPokemonController


- (void)fetchPokemonWithAPIController:(void (^)(NSError *error))completion {
    [APIController.sharedController fetchAllPokemonWithCompletion:^(NSArray<BNBPokemon *> *pokemons, NSError *error) {
        if (error) {
            completion(error);
            return;
        } else {
            self.pokemons =  [[NSArray alloc] initWithArray:pokemons];
            completion(nil);
        }
    }];
}

- (void)fetchDetailsWithAPIControllerForPokemon:(BNBPokemon *)pokemon {
    [APIController.sharedController fillInDetailsFor:pokemon];
}

- (NSArray <BNBPokemon *> *)getPokemons {
    return self.pokemons;
}

@end
