//
//  AppImage.swift
//  LatteNewLaunch
//
//  Created by Радмир Тельман on 21.12.2023.
//

import UIKit

protocol AppImageProtocol {
    var rawValue: String { get }
}

extension AppImageProtocol {

    var uiImage: UIImage? {
        guard let image = UIImage(named: rawValue) else {
            fatalError("Could not find image with name \(rawValue)")
        }
        return image
    }
    
    var systemImage: UIImage? {
        guard let image = UIImage(systemName: rawValue) else {
            fatalError("Could not find image with name \(rawValue)")
        }
        return image
    }
    
}

enum AppImage: String, AppImageProtocol {
    
    case maincoffee
    case home
    case heart
    case bag
    case notf
    case avatar
    case search
    case searchbtn
    case promo
    case plusicon
    case staricon
    case fav
    case back
    case rating
    
    // coffee
    
    case espresso
    case americano
    case cappucino
    case latte
    case raf
    case mocha
    case flat
    case macchiato
    case irish
    case vienese
    case iced
    case rist
    case frapp
    
    // big coffee
    
    case bgespresso
    case bgamericano
    case bgcapp
    case bglatte
    case bgraf
    case bgmocha
    case bgflat
    case bgmach
    case bgirish
    case bgvien
    case bgice
    case bgrist
    case bgfrapp
}
