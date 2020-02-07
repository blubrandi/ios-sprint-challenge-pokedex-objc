//
//  BNBPokemon.h
//  Pokedex-In-ObjC
//
//  Created by Brandi Bailey on 1/31/20.
//  Copyright © 2020 Brandi Bailey. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "UIKit/UIKit.h"

@interface BNBPokemon : NSObject

@property (nonatomic, copy, nonnull) NSString *name;
@property (nonatomic, copy, nonnull) NSURL *pokeURL;
@property (nonatomic) int identifier;
@property (nonatomic, nonnull) UIImage *sprite;
@property (nonatomic, nonnull) NSMutableArray *abilities;

-(instancetype _Nonnull)initWithDictionary:(nonnull NSDictionary *)dictionary;
-(void)pokeInfoWithDictionary:(nonnull NSDictionary *)dictionary;

@end

