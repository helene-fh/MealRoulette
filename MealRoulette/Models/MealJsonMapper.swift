//
//  MealJsonMapper.swift
//  MealRoulette
//
//  Created by Helené Fogde Hejda on 2023-05-01.
//

import Foundation

struct MealResponse: Codable, Hashable {
    
    var meals : [MealModel]
    
    enum CodingKeys: String, CodingKey {
        case meals = "meal_roulette_app_meals"
    }
}

struct MealModel: Codable, Hashable, Identifiable {
    var id : Int
    var title : String
    var picture : String
}


struct MealDetailResponse: Codable {
    var mealDetails : MealDetailsModel
    
    enum CodingKeys: String, CodingKey {
        case mealDetails = "meal_roulette_app_meals_by_pk"
    }
}

struct MealDetailsModel : Codable, Hashable, Identifiable {
    var id : Int
    var title : String
    var picture : String
    var description : String
    var ingredients : String
}

struct MealLimitResponse: Codable {
    var mealLimit : Nodes
    
    enum CodingKeys: String, CodingKey {
        case mealLimit = "meal_roulette_app_meals_aggregate"
    }
}

struct Nodes: Codable, Hashable {
    var nodes : [MealModel]
}


