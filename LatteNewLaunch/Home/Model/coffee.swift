//
//  coffee.swift
//  LatteNewLaunch
//
//  Created by Радмир Тельман on 23.12.2023.
//

import Foundation

struct Coffee {
    let name: String
    let price: Double
    let rating: Double
    let imageName: AppImage
}

struct CoffeeData {
    var name: String
    var rating: Double
    var priceS: Int
    var priceM: Int
    var priceL: Int
    var imageName: AppImage
    var description: String
}
