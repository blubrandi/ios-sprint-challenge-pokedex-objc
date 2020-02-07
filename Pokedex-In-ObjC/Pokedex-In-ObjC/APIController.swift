//
//  PokemonController.swift
//  Pokedex-In-ObjC
//
//  Created by Brandi Bailey on 1/31/20.
//  Copyright © 2020 Brandi Bailey. All rights reserved.
//

import UIKit

let baseURL = URL(string: "https://pokeapi.co/api/v2/pokemon/")!

class APIController: NSObject {
    
    @objc (sharedController) static let shared = APIController()

    @objc func fetchAllPokemon(completion: @escaping ([BNBPokemon]?, Error?) -> Void) {

        var requestURL = URLRequest(url: baseURL)
        requestURL.httpMethod = "GET"

        URLSession.shared.dataTask(with: requestURL) { (data, _, error) in

            if let error = error {
                print("There was an error fetching pokemon!: %@", error)
                completion(nil, error)
                return
            }

            guard let data = data else {
                completion(nil, error)
                return
            }
            
            do {
                if let apiController = try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any] {
                    if let pokeResults = apiController["results"] as? Array<[String: Any]> {
                        var pokemons = [BNBPokemon]()
                        for pokeDictionary in pokeResults {
                            let pokemon = BNBPokemon(dictionary: pokeDictionary)
                            pokemons.append(pokemon)
                        }
                        completion(pokemons, nil);
                    }
                }
            } catch {
                completion(nil, error)
            }

        }.resume()
    }

    @objc func fillInDetails(for pokemon: BNBPokemon) {

        var requestURL = URLRequest(url: pokemon.pokeURL)
        requestURL.httpMethod = "GET"

        URLSession.shared.dataTask(with: requestURL) { (data, _, error) in

            if let error = error {
                print("Error fetching data!: \(error)")
                return
            }

            guard let data = data else {
                print("There was an error getting your pokemon details")
                return
            }

            do {
                if let pokeDetails = try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any] {
                    pokemon.pokeInfo(with: pokeDetails)
                }
            } catch {
                print("There was an error")
            }

        }.resume()

    }
}
