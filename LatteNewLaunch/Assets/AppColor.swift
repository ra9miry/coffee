//
//  AppColor.swift
//  LatteNewLaunch
//
//  Created by Радмир Тельман on 21.12.2023.
//

import UIKit

protocol AppColorProtocol {
    var rawValue: String { get }
}

extension AppColorProtocol {

    var uiColor: UIColor {
        guard let color = UIColor.init(named: rawValue) else {
            fatalError("Could not find color with name \(rawValue)")
        }
        return color
    }

    var cgColor: CGColor {
        return uiColor.cgColor
    }
}

enum AppColor: String, AppColorProtocol {
    case black
    case white
    case lightGray
    case orange
    case tabbar
    case header
    case txt
    case txtlabel
    case view
    case line
    case border
    case orangeback
    
}
