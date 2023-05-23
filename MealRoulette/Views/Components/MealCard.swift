//
//  MealPiece.swift
//  MealRoulette
//
//  Created by Helené Fogde Hejda on 2023-05-01.
//

import SwiftUI

struct MealCard: View {
    @Environment(\.colorScheme) var colorScheme
    let meal: MealModel
    
    var body: some View {
            NavigationLink(destination: Details(meal: meal), label: {
                VStack(alignment: .center) {
                    UrlImage(url: meal.picture, size: 180)
                        Text(meal.title)
                            .frame(maxHeight: 80, alignment: .top)
                            .multilineTextAlignment(.leading)
                            .foregroundColor(colorScheme == .dark ? Color.white : Color.black)
                            .font(.title3)
                    }
            })
    }
}

struct MealCard_Previews: PreviewProvider {
    static var previews: some View {
        MealCard(meal: MealModel(id: 1, title: "Pizza", picture: "https://i.postimg.cc/nVYKG8qj/no-car.png"))
    }
}
