    //
    //  DetailCoffeeView.swift
    //  LatteNewLaunch
    //
    //  Created by Радмир Тельман on 24.12.2023.
    //

    import UIKit
    import SnapKit

    class DetailCoffeeView: UIViewController {
        
        // MARK: - UI
        
        var selectedCoffee: CoffeeData? {
            didSet {
                populateData()
            }
        }
        
        private lazy var coffeeImageView: UIImageView = {
            let imageView = UIImageView()
            imageView.image = AppImage.cappucino.uiImage
            imageView.clipsToBounds = true
            imageView.contentMode = .scaleAspectFit
            return imageView
        }()
        
        private lazy var nameLabel: UILabel = {
            let label = UILabel()
            label.text = "Capuccino"
            label.font = UIFont.boldSystemFont(ofSize: 20)
            label.textAlignment = .left
            return label
        }()
        
        private lazy var ratingLabel: UILabel = {
            let label = UILabel()
            label.text = "4.8"
            label.font = UIFont.systemFont(ofSize: 16)
            label.textAlignment = .left
            return label
        }()
        
        private lazy var ratingImageView: UIImageView = {
            let imageView = UIImageView()
            imageView.image = AppImage.rating.uiImage
            return imageView
        }()
        
        private lazy var lineView: UIView = {
            let view = UIView()
            view.backgroundColor = AppColor.line.uiColor
            return view
        }()
        
        private lazy var desLabel: UILabel = {
            let label = UILabel()
            label.text = "Description"
            label.font = UIFont.boldSystemFont(ofSize: 16)
            label.textAlignment = .left
            return label
        }()
        
        private lazy var descriptionLabel: UILabel = {
            let label = UILabel()
            label.font = UIFont.systemFont(ofSize: 14)
            label.textAlignment = .left
            label.text = "A cappuccino is an approximately 150 ml (5 oz) beverage, with 25 ml of espresso coffee and 85ml of fresh milk."
            label.numberOfLines = 0
            label.textColor = AppColor.black.uiColor
            return label
        }()
        
        private lazy var sizeLabel: UILabel = {
            let label = UILabel()
            label.text = "Size"
            label.font = UIFont.boldSystemFont(ofSize: 16)
            label.textAlignment = .left
            return label
        }()
        
        private lazy var sButton: UIButton = {
            let button = UIButton()
            return button
        }()
        
        private lazy var mButton: UIButton = {
            let button = UIButton()
            return button
        }()
        
        private lazy var lButton: UIButton = {
            let button = UIButton()
            return button
        }()
        
        private lazy var priceLabel: UILabel = {
            let label = UILabel()
            label.text = "Price"
            label.textColor = AppColor.txtlabel.uiColor
            label.font = UIFont.systemFont(ofSize: 14)
            label.textAlignment = .left
            return label
        }()
        
        private lazy var countLabel: UILabel = {
            let label = UILabel()
            label.text = "1200 ₸"
            label.textColor = AppColor.orange.uiColor
            label.font = UIFont.boldSystemFont(ofSize: 18)
            label.textAlignment = .left
            return label
        }()
        
        private lazy var buyButton: UIButton = {
            let button = UIButton(type: .system)
            button.setTitle("Buy now", for: .normal)
            button.setTitleColor(AppColor.white.uiColor, for: .normal)
            button.backgroundColor = AppColor.orange.uiColor
            button.layer.cornerRadius = 16
            button.titleLabel?.font = UIFont.boldSystemFont(ofSize: UIFont.systemFontSize)
            button.addTarget(self, action: #selector(buyButtonTapped), for: .touchUpInside)
            return button
        }()
        
        // MARK: - Lifecycle
        
        override func viewDidLoad() {
            super.viewDidLoad()
            view.backgroundColor = AppColor.white.uiColor
            
            setupNavigationBar()
            setupViews()
            setupConstraints()
            populateData()
        }
        
        // MARK: - Action
        
        private func setupSizeButton(_ button: UIButton, title: String) {
            button.setTitle(title, for: .normal)
            button.setTitleColor(AppColor.black.uiColor, for: .normal)
            button.setTitleColor(AppColor.orange.uiColor, for: .selected)
            button.backgroundColor = .clear
            button.layer.cornerRadius = 12
            button.layer.borderWidth = 1
            button.layer.borderColor = AppColor.border.uiColor.cgColor
            button.addTarget(self, action: #selector(sizeButtonTapped(_:)), for: .touchUpInside)
        }

        private func selectSizeButton(_ button: UIButton) {
            button.isSelected = true
            button.backgroundColor = AppColor.orangeback.uiColor
        }

        private func deselectSizeButtons(_ buttons: [UIButton]) {
            buttons.forEach { button in
                button.isSelected = false
                button.backgroundColor = AppColor.white.uiColor
            }
        }

        @objc private func sizeButtonTapped(_ sender: UIButton) {
            deselectSizeButtons([sButton, mButton, lButton])
            selectSizeButton(sender)
            
            if sender == sButton {
                updatePrice(for: "S")
            } else if sender == mButton {
                updatePrice(for: "M")
            } else if sender == lButton {
                updatePrice(for: "L")
            }
        }
        
        @objc private func buyButtonTapped() {
            let controller = CartViewController()
            self.navigationController?.pushViewController(controller, animated: true)
        }

        private func populateData() {
            guard let coffeeData = selectedCoffee else { return }
            nameLabel.text = coffeeData.name
            ratingLabel.text = String(format: "%.1f", coffeeData.rating)
            descriptionLabel.text = coffeeData.description
            updatePrice(for: "M") // Установите цену по умолчанию для размера M
            coffeeImageView.image = UIImage(named: coffeeData.imageName.rawValue)
        }

        private func updatePrice(for size: String) {
            switch size {
            case "S":
                countLabel.text = "\(selectedCoffee?.priceS ?? 0) ₸"
            case "M":
                countLabel.text = "\(selectedCoffee?.priceM ?? 0) ₸"
            case "L":
                countLabel.text = "\(selectedCoffee?.priceL ?? 0) ₸"
            default:
                break
            }
        }
        // MARK: - Setup Navigation Bar
        
        private func setupNavigationBar() {
            self.title = "Detail"
            
            let backButtonImage = AppImage.back.uiImage?.withRenderingMode(.alwaysOriginal)
            let backButtonCustomView = UIButton(type: .custom)
            backButtonCustomView.setImage(backButtonImage, for: .normal)
            backButtonCustomView.addTarget(self, action: #selector(backButtonTapped), for: .touchUpInside)
            backButtonCustomView.contentEdgeInsets = UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 0)
            let backButton = UIBarButtonItem(customView: backButtonCustomView)
            self.navigationItem.leftBarButtonItem = backButton
            let heartButtonImage = AppImage.fav.uiImage?.withRenderingMode(.alwaysOriginal)
            let heartButtonCustomView = UIButton(type: .custom)
            heartButtonCustomView.setImage(heartButtonImage, for: .normal)
            heartButtonCustomView.addTarget(self, action: #selector(favouriteButtonTapped), for: .touchUpInside)
            heartButtonCustomView.contentEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 20)
            let heartButton = UIBarButtonItem(customView: heartButtonCustomView)
            self.navigationItem.rightBarButtonItem = heartButton
        }
        
        @objc private func backButtonTapped() {
            let controller = TabBarViewController()
            self.navigationController?.pushViewController(controller, animated: true)
        }
        
        @objc private func favouriteButtonTapped() {
            if let tabBarVC = self.view.window?.rootViewController as? TabBarViewController {
                tabBarVC.selectedIndex = 1 
                self.navigationController?.popToRootViewController(animated: true)
            }
        }
        
        // MARK: - Setup Views
        
        private func setupViews() {
            [coffeeImageView,
             nameLabel,
             ratingImageView,
             ratingLabel,
             lineView,
             desLabel,
             descriptionLabel,
             sizeLabel,
             sButton,
             mButton,
             lButton,
             priceLabel,
             countLabel,
             buyButton,
            ].forEach {
                view.addSubview($0)
            }
            setupSizeButton(sButton, title: "S")
            setupSizeButton(mButton, title: "M")
            setupSizeButton(lButton, title: "L")
            
        }
        // MARK: - Setup Constraints
        
        private func setupConstraints() {
            let buttonSpacing = 14
            let buttonWidth = 96
            coffeeImageView.snp.makeConstraints() { make in
                make.top.equalToSuperview().offset(120)
                make.leading.equalToSuperview().offset(30)
                make.trailing.equalToSuperview().offset(-30)
                make.width.equalTo(315)
                make.height.equalTo(226)
            }
            nameLabel.snp.makeConstraints() { make in
                make.top.equalTo(coffeeImageView.snp.bottom).offset(20)
                make.leading.equalToSuperview().offset(30)
            }
            ratingImageView.snp.makeConstraints() { make in
                make.top.equalTo(nameLabel.snp.bottom).offset(10)
                make.leading.equalToSuperview().offset(30)
            }
            ratingLabel.snp.makeConstraints() { make in
                make.top.equalTo(nameLabel.snp.bottom).offset(10)
                make.leading.equalTo(ratingImageView.snp.trailing).offset(4)
            }
            lineView.snp.makeConstraints() { make in
                make.top.equalTo(ratingLabel.snp.bottom).offset(30)
                make.leading.equalToSuperview().offset(30)
                make.trailing.equalToSuperview().offset(-30)
                make.height.equalTo(2)
            }
            desLabel.snp.makeConstraints() { make in
                make.top.equalTo(lineView.snp.bottom).offset(20)
                make.leading.equalToSuperview().offset(30)
            }
            descriptionLabel.snp.makeConstraints() { make in
                make.top.equalTo(desLabel.snp.bottom).offset(10)
                make.leading.equalToSuperview().offset(30)
                make.trailing.equalToSuperview().offset(-30)
            }
            sizeLabel.snp.makeConstraints() { make in
                make.top.equalTo(descriptionLabel.snp.bottom).offset(20)
                make.leading.equalToSuperview().offset(30)
            }
            sButton.snp.makeConstraints { make in
                make.top.equalTo(sizeLabel.snp.bottom).offset(20)
                make.leading.equalToSuperview().offset(36)
                make.width.equalTo(buttonWidth)
                make.height.equalTo(43)
            }
            mButton.snp.makeConstraints { make in
                make.top.equalTo(sButton.snp.top)
                make.leading.equalTo(sButton.snp.trailing).offset(buttonSpacing)
                make.width.equalTo(buttonWidth)
                make.height.equalTo(43)
            }
            lButton.snp.makeConstraints { make in
                make.top.equalTo(mButton.snp.top)
                make.leading.equalTo(mButton.snp.trailing).offset(buttonSpacing)
                make.trailing.equalToSuperview().offset(-36)
                make.width.equalTo(buttonWidth)
                make.height.equalTo(43)
            }
            priceLabel.snp.makeConstraints { make in
                make.bottom.equalTo(countLabel.snp.top).offset(-8)
                make.leading.equalToSuperview().offset(30)
            }
            countLabel.snp.makeConstraints() { make in
                make.bottom.equalToSuperview().offset(-50)
                make.leading.equalToSuperview().offset(30)
            }
            buyButton.snp.makeConstraints { make in
                make.bottom.equalToSuperview().offset(-50)
                make.trailing.equalToSuperview().offset(-30)
                make.width.equalTo(217)
                make.height.equalTo(62)
            }
        }
    }
