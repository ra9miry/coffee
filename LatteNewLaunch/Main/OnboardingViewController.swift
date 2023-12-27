//
//  OnboardingViewController.swift
//  LatteNewLaunch
//
//  Created by Радмир Тельман on 21.12.2023.
//

import UIKit
import SnapKit

final class OnboardingViewController: UIViewController {
    
    // MARK: - UI
    
    private lazy var mainImage: UIImageView = {
        let imageView = UIImageView()
        imageView.image = AppImage.maincoffee.uiImage
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    private lazy var mainLabel: UILabel = {
        let label = UILabel()
        label.text = "Coffee so good,\n your taste buds \n will love it."
        label.numberOfLines = 0
        label.textAlignment = .center
        label.textColor = AppColor.white.uiColor
        label.font = UIFont.systemFont(ofSize: 34, weight: .bold)
        return label
    }()
    
    private lazy var secondLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.textAlignment = .center
        label.textColor = AppColor.lightGray.uiColor
        label.text = "The best grain, the finest roast, the \n powerful flavor."
        label.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        return label
    }()
    
    private lazy var startButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Get Started", for: .normal)
        button.setTitleColor(AppColor.white.uiColor, for: .normal)
        button.backgroundColor = AppColor.orange.uiColor
        button.layer.cornerRadius = 16
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: UIFont.systemFontSize)
        button.addTarget(self, action: #selector(startbuttonTapped), for: .touchUpInside)
        return button
    }()

    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = AppColor.black.uiColor
        
        setupViews()
        setupConstraints()
    }
    
    // MARK: - Action
    
    @objc private func startbuttonTapped() {
        let controller = TabBarViewController()
        navigationController?.pushViewController(controller , animated: true)
    }
    
    // MARK: - Setup Views
    
    private func setupViews() {
        [mainImage,
         mainLabel,
         secondLabel,
         startButton
        ].forEach() {
            view.addSubview($0)
        }
    }
    
    // MARK: - Setup Constraints
    
    private func setupConstraints() {
        mainImage.snp.makeConstraints() { make in
            make.top.equalToSuperview().offset(0)
            make.centerX.equalToSuperview()
        }
        
        mainLabel.snp.makeConstraints() { make in
            make.bottom.equalTo(secondLabel.snp.top).offset(-52)
            make.centerX.equalToSuperview()
        }
        
        secondLabel.snp.makeConstraints() { make in
            make.bottom.equalTo(startButton.snp.top).offset(-40)
            make.centerX.equalToSuperview()
        }
        
        startButton.snp.makeConstraints() { make in
            make.leading.equalToSuperview().offset(16)
            make.trailing.equalToSuperview().offset(-16)
            make.bottom.equalToSuperview().offset(-80)
            make.height.equalTo(52)
        }
    }
}
