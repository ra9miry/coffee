//
//  Coffee.swift
//  LatteNewLaunch
//
//  Created by Радмир Тельман on 28.12.2023.
//

import Foundation

struct CoffeeViewModel {
    let imageName: String
    let name: String
    let price: String
    let rating: String
}

extension Coffee {
    func toViewModel() -> CoffeeViewModel {
        return CoffeeViewModel(
            imageName: self.imageName.rawValue,
            name: self.name,
            price: String(format: "%.2f", self.price),
            rating: String(self.rating)
        )
    }
}
