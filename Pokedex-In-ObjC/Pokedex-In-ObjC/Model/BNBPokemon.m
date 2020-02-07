//
//  BNBPokemon.m
//  Pokedex-In-ObjC
//
//  Created by Brandi Bailey on 1/31/20.
//  Copyright © 2020 Brandi Bailey. All rights reserved.
//

#import "BNBPokemon.h"

@interface BNBPokemon ()
@end

@implementation BNBPokemon

- (instancetype _Nonnull)initWithDictionary:(nonnull NSDictionary *)dictionary {
    self = [super init];
    if (self) {
        _name = dictionary[@"name"];
        _pokeURL = [NSURL URLWithString:dictionary[@"url"]];
        _abilities = [[NSMutableArray alloc] init];
    }
    return self;
}

- (void)pokeInfoWithDictionary:(NSDictionary *)dictionary {
    NSArray *abilityDictionaries = dictionary[@"abilities"];
    
    for (NSDictionary *abilityDictionary in abilityDictionaries) {
        NSDictionary *ability = abilityDictionary[@"ability"];
        NSString *abilityName = ability[@"name"];
        [self.abilities addObject:abilityName];
    }
    
    self.identifier = [dictionary[@"id"] intValue];
    NSDictionary *spriteDictionary = dictionary[@"sprites"];
    NSURL *spriteURL = [NSURL URLWithString:spriteDictionary[@"front_shiny"]];
    NSData *imageData = [NSData dataWithContentsOfURL:spriteURL];
    self.sprite = [UIImage imageWithData:imageData];
}

@end
