//
//  FavouriteViewController.swift
//  LatteNewLaunch
//
//  Created by Радмир Тельман on 21.12.2023.
//

import UIKit
import SnapKit

class FavouriteViewController: UIViewController,UITableViewDataSource,UITableViewDelegate {

    // MARK: - UI
    
    private lazy var headerView: UIView = {
        let header = UIView()
        header.backgroundColor = AppColor.orange.uiColor
        header.layer.cornerRadius = 20
        header.layer.maskedCorners = [.layerMinXMaxYCorner, .layerMaxXMaxYCorner]
        return header
    }()
    
    private lazy var labelForInfoName: UILabel = {
        let label = UILabel()
        label.text = "Portfolio"
        label.textColor = .white
        label.font = UIFont.boldSystemFont(ofSize: 20)
        return label
    }()
    
    private lazy var favTableView: UITableView = {
        let tableView = UITableView()
        tableView.dataSource = self
        tableView.delegate = self
        tableView.rowHeight = 81
        tableView.register(FavTableViewCell.self, forCellReuseIdentifier: "FavCell")
        tableView.separatorStyle = .none
        tableView.backgroundColor = .clear
        return tableView
    }()
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = AppColor.white.uiColor

    }
    
    // MARK: - Action
    
    // MARK: - Setup Views
    
    // MARK: - Setup Constraints
    
    // MARK: - Table View
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // Вернуть количество строк
        return 10 // Примерное число строк
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "FavCell", for: indexPath) as! FavTableViewCell
        // Настройте ячейку здесь
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // Действия при выборе строки
    }
}
