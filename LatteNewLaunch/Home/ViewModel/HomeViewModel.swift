//
//  HomeViewModel.swift
//  LatteNewLaunch
//
//  Created by Радмир Тельман on 29.02.2024.
//

import Foundation
import Combine

class HomeViewModel {

    @Published var filteredCoffees: [CoffeeData] = []
    @Published var searchText = ""

    private var coffeeDataArray: [CoffeeData] = [
        CoffeeData(name: "Espresso", rating: 4.8, priceS: 490, priceM: 590, priceL: 690, imageName: .bgespresso, description: "Espresso – это концентрированный кофе, приготовленный пропусканием горячей воды под давлением через тонко помолотый кофе. Он обладает насыщенным вкусом и кремовой пенкой на поверхности, называемой кремой."),
        CoffeeData(name: "Americano", rating: 4.3,priceS: 690, priceM: 790, priceL: 890, imageName: .bgamericano, description: "Americano – это легкий кофе, который делается путем добавления горячей воды к эспрессо. Это придает напитку более легкий вкус и консистенцию, делая его идеальным для тех, кто предпочитает менее крепкий кофе."),
        CoffeeData(name: "Cappuccino", rating: 4.8, priceS: 990, priceM: 1090, priceL: 1190, imageName: .bgcapp, description: "Cappuccino – классический итальянский кофе, который состоит из равных частей эспрессо, горячего молока и молочной пены. Этот богатый и кремовый напиток часто подается с щепоткой какао или корицы сверху."),
        CoffeeData(name: "Latte", rating: 4.7, priceS: 1050, priceM: 1190, priceL: 1290, imageName: .bglatte, description: "Latte – это мягкий кофе, состоящий из эспрессо и большого количества горячего молока. Этот напиток имеет мягкий вкус и часто украшается рисунком на поверхности молочной пены."),
        CoffeeData(name: "Raf", rating: 4.6, priceS: 1250, priceM: 1350, priceL: 1400, imageName: .bgraf, description: "Raf – это сладкий и насыщенный кофе, сделанный из эспрессо, взбитых сливок и ванильного сахара. Этот напиток отличается гладкой текстурой и ванильным вкусом"),
        CoffeeData(name: "Mocha", rating: 4.8, priceS: 1150, priceM: 1290, priceL: 1390, imageName: .bgmocha, description: "Mocha – это сочетание эспрессо, горячего шоколада и молока. Этот кофе сладкий, с богатым шоколадным вкусом, часто подается с взбитыми сливками на вершине."),
        CoffeeData(name: "Flat White", rating: 4.6, priceS: 1050, priceM: 1190, priceL: 1290, imageName: .bgflat, description: "Flat White – это кофе, состоящий из эспрессо и горячего молока. Этот напиток подается с тонким слоем молочной пены, что делает его более крепким, чем латте, но более мягким, чем эспрессо."),
        CoffeeData(name: "Macchiato", rating: 4.6, priceS: 990, priceM: 1099, priceL: 1190, imageName: .bgmach, description: "Macchiato – это крепкий кофе, который состоит из эспрессо, чуть украшенного небольшим количеством вспененного молока. Этот напиток имеет ярко выраженный кофейный вкус с легкой молочной ноткой."),
        CoffeeData(name: "Irish Coffee", rating: 4.5, priceS: 1150, priceM: 1250, priceL: 1390, imageName: .bgirish, description: "Irish Coffee – это уникальное сочетание кофе, ирландского виски, сахара и взбитых сливок. Этот напиток славится своим богатым вкусом и теплым алкогольным послевкусием"),
        CoffeeData(name: "Viennese Coffee", rating: 4.5, priceS: 1050, priceM: 1150, priceL: 1290, imageName: .bgvien, description: "Viennese Coffee – это эспрессо с добавлением взбитых сливок. Иногда его подают с шоколадной стружкой или корицей сверху, что придает напитку особую изысканность."),
        CoffeeData(name: "Iced Coffee", rating: 4.7, priceS: 790, priceM: 990, priceL: 1099, imageName: .bgice, description: "Iced Coffee – это охлажденный кофейный напиток, приготовленный с эспрессо или молотым кофе. Часто подается со льдом и сахаром или сиропом по вкусу."),
        CoffeeData(name: "Ristretto", rating: 4.4, priceS: 890, priceM: 1090, priceL: 1190, imageName: .bgrist, description: "IRistretto – это очень крепкий и ароматный кофе, приготовленный пропусканием меньшего количества воды через кофе, чем при эспрессо. Этот напиток отличается концентрированным вкусом и ароматом."),
        CoffeeData(name: "Frappuccino", rating: 4.6,priceS: 1050, priceM: 1190, priceL: 1290, imageName: .bgfrapp, description: "Frappuccino – это холодный кофейный напиток, смешанный со льдом, сиропом и иногда сливками. Этот напиток славится своей прохладой и разнообразием вкусов.."),
    ]
    
    private var cancellables: Set<AnyCancellable> = []

    init() {
        setupSearchSubscriber()
    }

    private func setupSearchSubscriber() {
        $searchText
            .receive(on: RunLoop.main)
            .map { searchString in
                if searchString.isEmpty {
                    return self.coffeeDataArray
                } else {
                    return self.coffeeDataArray.filter { $0.name.lowercased().contains(searchString.lowercased()) }
                }
            }
            .assign(to: \.filteredCoffees, on: self)
            .store(in: &cancellables)
    }
    
}
