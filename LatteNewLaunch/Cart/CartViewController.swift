//
//  CartViewController.swift
//  LatteNewLaunch
//
//  Created by Радмир Тельман on 21.12.2023.
//

import UIKit
import SnapKit

class CartViewController: UIViewController {
    
    private lazy var deliverButton: UIButton = {
        let button = UIButton()
        button.setTitle("Deliver", for: .normal)
        button.setTitleColor(AppColor.white.uiColor, for: .normal)
        button.backgroundColor = AppColor.orange.uiColor
        button.layer.cornerRadius = 10
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: UIFont.systemFontSize)
        return button
    }()
    
    private lazy var deliveryLabel: UILabel = {
        let label = UILabel()
        label.text = "Delivery Address"
        label.font = UIFont.boldSystemFont(ofSize: 16)
        label.textAlignment = .left
        return label
    }()
    
    private lazy var addresLabel: UILabel = {
        let label = UILabel()
        label.text = "Jl. Kpg Sutoyo"
        label.font = UIFont.boldSystemFont(ofSize: 14)
        label.textAlignment = .left
        return label
    }()
    
    private lazy var secondAddresLabel: UILabel = {
        let label = UILabel()
        label.text = "Kpg. Sutoyo No. 620, Bilzen, Tanjungbalai."
        label.textColor = AppColor.lightGray.uiColor
        label.font = UIFont.systemFont(ofSize: 12)
        label.textAlignment = .left
        return label
    }()
    
    private lazy var littleLineView: UIView = {
        let view = UIView()
        view.backgroundColor = AppColor.line.uiColor
        view.layer.cornerRadius = 8
        return view
    }()
    
    private lazy var coffeeImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = AppImage.avatar.uiImage
        imageView.clipsToBounds = true
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    private lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.text = "Cappucino"
        label.font = UIFont.boldSystemFont(ofSize: 14)
        label.textAlignment = .left
        return label
    }()
    
    private lazy var bigLineView: UIView = {
        let view = UIView()
        view.backgroundColor = AppColor.line.uiColor
        view.layer.cornerRadius = 8
        return view
    }()
    
    private lazy var paymentLabel: UILabel = {
        let label = UILabel()
        label.text = "Payment Summary"
        label.font = UIFont.boldSystemFont(ofSize: 16)
        label.textAlignment = .left
        return label
    }()
    
    private lazy var totalLabel: UILabel = {
        let label = UILabel()
        label.text = "Total Payment"
        label.textColor = AppColor.black.uiColor
        label.font = UIFont.systemFont(ofSize: 14)
        label.textAlignment = .left
        return label
    }()
    
    private lazy var priceLabel: UILabel = {
        let label = UILabel()
        label.text = "1200 ₸"
        label.textColor = AppColor.black.uiColor
        label.font = UIFont.boldSystemFont(ofSize: 14)
        label.textAlignment = .right
        return label
    }()
    
    private lazy var orderButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Order", for: .normal)
        button.setTitleColor(AppColor.white.uiColor, for: .normal)
        button.backgroundColor = AppColor.orange.uiColor
        button.layer.cornerRadius = 14
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: UIFont.systemFontSize)
        button.addTarget(self, action: #selector(orderButtonTapped), for: .touchUpInside)
        return button
    }()
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = AppColor.white.uiColor
        
        setupNavigationBar()
        setupViews()
        setupConstraints()
    }
    
    // MARK: - Action
        
    @objc private func orderButtonTapped() {
        let controller = DeliveryViewController()
        self.navigationController?.pushViewController(controller, animated: true)
    }
    
    // MARK: - Setup Navigation Bar
    
    private func setupNavigationBar() {
        self.navigationItem.title = "Order"
        
        let backButtonImage = AppImage.back.uiImage?.withRenderingMode(.alwaysOriginal)
        let backButtonCustomView = UIButton(type: .custom)
        backButtonCustomView.setImage(backButtonImage, for: .normal)
        backButtonCustomView.addTarget(self, action: #selector(backButtonTapped), for: .touchUpInside)
        backButtonCustomView.contentEdgeInsets = UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 0)
        let backButton = UIBarButtonItem(customView: backButtonCustomView)
        self.navigationItem.leftBarButtonItem = backButton
    }
    
    @objc private func backButtonTapped() {
        self.navigationController?.popViewController(animated: true)
    }
    
    // MARK: - Setup Views
    
    private func setupViews() {
        [deliverButton,
         deliveryLabel,
         addresLabel,
         secondAddresLabel,
         littleLineView,
         coffeeImageView,
         nameLabel,
         bigLineView,
         paymentLabel,
         totalLabel,
         priceLabel,
         orderButton,
        ].forEach {
            view.addSubview($0)
        }
    }
    
    // MARK: - Setup Constraints
    
    private func setupConstraints() {
        deliverButton.snp.makeConstraints() { make in
            make.top.equalToSuperview().offset(120)
            make.leading.equalToSuperview().offset(34)
            make.trailing.equalToSuperview().offset(-34)
            make.height.equalTo(42)
        }
        deliveryLabel.snp.makeConstraints() { make in
            make.top.equalTo(deliverButton.snp.bottom).offset(28)
            make.leading.equalToSuperview().offset(30)
        }
        addresLabel.snp.makeConstraints() { make in
            make.top.equalTo(deliveryLabel.snp.bottom).offset(16)
            make.leading.equalToSuperview().offset(30)
        }
        secondAddresLabel.snp.makeConstraints() { make in
            make.top.equalTo(addresLabel.snp.bottom).offset(8)
            make.leading.equalToSuperview().offset(30)
        }
        littleLineView.snp.makeConstraints() { make in
            make.top.equalTo(secondAddresLabel.snp.bottom).offset(22)
            make.leading.equalToSuperview().offset(30)
            make.trailing.equalToSuperview().offset(-30)
            make.height.equalTo(1.5)
        }
        coffeeImageView.snp.makeConstraints() { make in
            make.top.equalTo(littleLineView.snp.bottom).offset(20)
            make.leading.equalToSuperview().offset(30)
        }
        nameLabel.snp.makeConstraints() { make in
            make.top.equalTo(littleLineView.snp.bottom).offset(37)
            make.leading.equalTo(coffeeImageView.snp.trailing).offset(12)
        }
        bigLineView.snp.makeConstraints() { make in
            make.top.equalTo(nameLabel.snp.bottom).offset(30)
            make.leading.equalToSuperview().offset(30)
            make.trailing.equalToSuperview().offset(-30)
            make.height.equalTo(2.5)
        }
        paymentLabel.snp.makeConstraints() { make in
            make.top.equalTo(bigLineView.snp.bottom).offset(30)
            make.leading.equalToSuperview().offset(30)
        }
        totalLabel.snp.makeConstraints() { make in
            make.top.equalTo(paymentLabel.snp.bottom).offset(20)
            make.leading.equalToSuperview().offset(30)
        }
        priceLabel.snp.makeConstraints() { make in
            make.top.equalTo(paymentLabel.snp.bottom).offset(20)
            make.trailing.equalToSuperview().offset(-30)
        }
        orderButton.snp.makeConstraints() { make in
            make.bottom.equalToSuperview().offset(-90)
            make.leading.equalToSuperview().offset(30)
            make.trailing.equalToSuperview().offset(-30)
            make.height.equalTo(52)
        }
    }
 }
