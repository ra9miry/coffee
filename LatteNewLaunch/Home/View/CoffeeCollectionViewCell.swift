//
//  CoffeeCollectionViewCell.swift
//  LatteNewLaunch
//
//  Created by Радмир Тельман on 23.12.2023.
//

import UIKit
import SnapKit

class CoffeeCollectionViewCell: UICollectionViewCell {
    static let identifier = "CoffeeCollectionViewCell"
    
    // MARK: - UI
    
    private lazy var coffeeView: UIView = {
        let view = UIView()
        view.backgroundColor = AppColor.view.uiColor
        view.layer.cornerRadius = 16
        return view
    }()
    
    private lazy var coffeeImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.clipsToBounds = true
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    var onImageViewTapped: (() -> Void)?
    
    private lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 16)
        label.textAlignment = .left
        return label
    }()
    
    private lazy var priceLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14)
        label.textAlignment = .left
        return label
    }()
    
    private lazy var ratingLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 12)
        label.textAlignment = .left
        return label
    }()
    
    private lazy var addButton: UIButton = {
        let button = UIButton()
        button.setImage(AppImage.plusicon.uiImage, for: .normal)
        return button
    }()
    
    private lazy var ratingImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = AppImage.staricon.uiImage
        return imageView
    }()
    
    // MARK: - Lifecycle
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
        setupConstraints()
        setupImageViewTap()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Setup Views
    
    private func setupViews() {
        addSubview(coffeeView)
        addSubview(coffeeImageView)
        addSubview(nameLabel)
        addSubview(priceLabel)
        addSubview(ratingLabel)
        addSubview(addButton)
        addSubview(ratingImageView)
    }
    
    // MARK: - Action
    
    private func setupImageViewTap() {
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(imageViewTapped))
        coffeeImageView.isUserInteractionEnabled = true 
        coffeeImageView.addGestureRecognizer(tapGesture)
    }
    
    @objc private func imageViewTapped() {
        onImageViewTapped?()
    }
    
    
    func configure(with coffee: Coffee) {
        coffeeImageView.image = coffee.imageName.uiImage
        nameLabel.text = coffee.name
        priceLabel.text = "\(coffee.price) ₸"   
        ratingLabel.text = "\(coffee.rating)"
    }
    
    // MARK: - Setup Constraints
    
    private func setupConstraints() {
        coffeeView.snp.makeConstraints() { make in
            make.top.equalToSuperview().offset(0)
            make.leading.trailing.equalToSuperview().offset(0)
            make.height.equalTo(220)
            make.width.equalTo(150)
        }
        
        coffeeImageView.snp.makeConstraints() { make in
            make.top.equalTo(coffeeView.snp.top).offset(8)
            make.leading.equalTo(coffeeView.snp.leading).offset(4)
            make.trailing.equalTo(coffeeView.snp.trailing).offset(-4)
            make.height.equalTo(132)
            make.width.equalTo(140)
        }
        
        nameLabel.snp.makeConstraints() { make in
            make.top.equalTo(coffeeImageView.snp.bottom).offset(12)
            make.leading.equalTo(coffeeView.snp.leading).offset(12)
        }
        
        priceLabel.snp.makeConstraints() { make in
            make.top.equalTo(nameLabel.snp.bottom).offset(4)
            make.leading.equalTo(coffeeView.snp.leading).offset(12)
        }
        
        ratingImageView.snp.makeConstraints() { make in
            make.top.equalTo(priceLabel.snp.bottom).offset(8)
            make.leading.equalTo(coffeeView.snp.leading).offset(12)
            make.size.equalTo(10)
        }
        
        ratingLabel.snp.makeConstraints() { make in
            make.top.equalTo(priceLabel.snp.bottom).offset(6)
            make.leading.equalTo(ratingImageView.snp.trailing).offset(4)
        }
        
        addButton.snp.makeConstraints() { make in
            make.top.equalTo(nameLabel.snp.bottom).offset(10)
            make.trailing.equalTo(coffeeView.snp.trailing).offset(-12)
        }
        
    }
}
