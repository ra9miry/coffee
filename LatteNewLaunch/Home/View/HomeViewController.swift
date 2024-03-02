//
//  HomeViewController.swift
//  LatteNewLaunch
//
//  Created by Радмир Тельман on 21.12.2023.
//

import UIKit
import SnapKit
import Combine

final class HomeViewController: UIViewController, UICollectionViewDelegate {
    
    // MARK: - UI
    
    private var filteredCoffees: [Coffee] = []
    private var coffees: [Coffee] = []
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
    
    private lazy var headerView: UIView = {
        let header = UIView()
        header.backgroundColor = AppColor.header.uiColor
        return header
    }()
    
    private lazy var locationLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.textColor = AppColor.lightGray.uiColor
        label.text = "Location"
        label.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        return label
    }()
    
    private lazy var yourLocationLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.textColor = AppColor.white.uiColor
        label.text = "Almaty,Kazakhstan"
        label.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        return label
    }()
    
    private lazy var YourImage: UIImageView = {
        let image =  UIImageView()
        image.image = AppImage.avatar.uiImage
        image.contentMode = .scaleAspectFit
        return image
    }()
    
    private var isSearching = false
    
    private lazy var searchTextField: UITextField = {
        let searchTextField = UITextField()
        searchTextField.backgroundColor = AppColor.txt.uiColor
        searchTextField.layer.cornerRadius = 15
        searchTextField.clipsToBounds = true
        searchTextField.attributedPlaceholder = NSAttributedString(
            string: "Search coffee...",
            attributes: [NSAttributedString.Key.foregroundColor: AppColor.txtlabel.uiColor]
        )
        searchTextField.addTarget(self, action: #selector(textFieldDidChange), for: .editingChanged)
        searchTextField.textColor = AppColor.txtlabel.uiColor
        searchTextField.font = UIFont.systemFont(ofSize: 14)
        let searchIconView = UIImageView(image: AppImage.search.uiImage)
        searchIconView.contentMode = .scaleAspectFit
        searchIconView.frame = CGRect(x: 15, y: 5, width: 20, height: 30)
        let leftView = UIView(frame: CGRect(x: 0, y: 0, width: 50, height: 40))
        leftView.addSubview(searchIconView)
        searchTextField.leftView = leftView
        searchTextField.leftViewMode = .always
        let button = UIButton(type: .custom)
        button.imageView?.contentMode = .scaleAspectFit
        button.setImage(AppImage.searchbtn.uiImage, for: .normal)
        button.frame = CGRect(x: 0, y: 0, width: 50, height: 40)
        button.addTarget(self, action: #selector(searchButtonTapped), for: .touchUpInside)
        let rightView = UIView(frame: CGRect(x: 0, y: 0, width: 60, height: 40))
        rightView.addSubview(button)
        searchTextField.rightView = rightView
        searchTextField.rightViewMode = .always
        return searchTextField
    }()
    
    private lazy var promoImage: UIImageView = {
        let image =  UIImageView()
        image.image = AppImage.promo.uiImage
        image.contentMode = .scaleAspectFit
        return image
    }()
    
    private lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.itemSize = CGSize(width: (view.frame.size.width/2) - 16, height: 300)
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.register(CoffeeCollectionViewCell.self, forCellWithReuseIdentifier: CoffeeCollectionViewCell.identifier)
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.backgroundColor = .clear
        return collectionView
    }()

    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = AppColor.white.uiColor
        collectionView.frame = view.bounds
        
        setupViews()
        setupConstraints()
        coffees = fetchData()
        collectionView.reloadData()
    }
    
    // MARK: - Action
    
    @objc private func searchButtonTapped() {
    }
    
    private func fetchData() -> [Coffee] {
        return [
            Coffee(name: "Espresso", price: 590, rating: 4.5, imageName: .espresso),
            Coffee(name: "Americano", price: 790, rating: 4.3, imageName: .americano),
            Coffee(name: "Cappuccino", price: 1090, rating: 4.8, imageName: .cappucino),
            Coffee(name: "Latte", price: 1190, rating: 4.7, imageName: .latte),
            Coffee(name: "Raf", price: 1350, rating: 4.6, imageName: .raf),
            Coffee(name: "Mocha", price: 1290, rating: 4.8, imageName: .mocha),
            Coffee(name: "Flat White", price: 1190, rating: 4.6, imageName: .flat),
            Coffee(name: "Macchiato", price: 1099, rating: 4.6, imageName: .macchiato),
            Coffee(name: "Irish Coffee", price: 1250, rating: 4.5, imageName: .irish),
            Coffee(name: "Viennese Coffee", price: 1150, rating: 4.5, imageName: .vienese),
            Coffee(name: "Iced Coffee", price: 990, rating: 4.7, imageName: .iced),
            Coffee(name: "Ristretto", price: 1090, rating: 4.4, imageName: .rist),
            Coffee(name: "Frappuccino", price: 1190, rating: 4.6, imageName: .frapp),
        ]
    }
    
    @objc func textFieldDidChange(_ textField: UITextField) {
        if let searchText = textField.text, !searchText.isEmpty {
            isSearching = true
            filteredCoffees = coffees.filter { $0.name.lowercased().contains(searchText.lowercased()) }
        } else {
            isSearching = false
            filteredCoffees = coffees
        }
        DispatchQueue.main.async {
            self.collectionView.reloadData()
        }
    }
    
    // MARK: - Setup Views
    
    private func setupViews() {
        [headerView,
         locationLabel,
         yourLocationLabel,
         YourImage,
         searchTextField,
         promoImage,
         collectionView,
        ].forEach {
            view.addSubview($0)
        }
    }
    
    // MARK: - Setup Constraints
    
    private func setupConstraints() {
        headerView.snp.makeConstraints() { make in
            make.top.equalToSuperview().offset(0)
            make.leading.trailing.equalToSuperview().offset(0)
            make.height.equalTo(280)
        }
        
        locationLabel.snp.makeConstraints() { make in
            make.top.equalTo(headerView.snp.top).offset(65)
            make.leading.equalTo(headerView.snp.leading).offset(30)
        }
        
        yourLocationLabel.snp.makeConstraints() { make in
            make.top.equalTo(locationLabel.snp.bottom).offset(5)
            make.leading.equalTo(headerView.snp.leading).offset(30)
        }
        
        YourImage.snp.makeConstraints() { make in
            make.top.equalTo(headerView.snp.top).offset(60)
            make.trailing.equalTo(headerView.snp.trailing).offset(-30)
        }
        
        searchTextField.snp.makeConstraints() { make in
            make.top.equalTo(yourLocationLabel.snp.bottom).offset(24)
            make.leading.equalTo(headerView.snp.leading).offset(30)
            make.trailing.equalTo(headerView.snp.trailing).offset(-30)
            make.height.equalTo(52)
        }
        
        promoImage.snp.makeConstraints() { make in
            make.top.equalTo(searchTextField.snp.bottom).offset(24)
            make.leading.equalToSuperview().offset(30)
            make.trailing.equalToSuperview().offset(-30)
        }
        
        collectionView.snp.makeConstraints() { make in
            make.top.equalTo(promoImage.snp.bottom).offset(24)
            make.leading.equalToSuperview().offset(30)
            make.trailing.equalToSuperview().offset(-30)
            make.bottom.equalToSuperview().offset(0) 
        }

    }
}

// MARK: - UICollectionViewDataSource

extension HomeViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return isSearching ? filteredCoffees.count : coffees.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CoffeeCollectionViewCell.identifier, for: indexPath) as? CoffeeCollectionViewCell else {
            fatalError("Could not dequeue CoffeeCollectionViewCell")
        }
        let coffee = isSearching ? filteredCoffees[indexPath.row] : coffees[indexPath.row]
        let detailViewController = DetailCoffeeView()
        let viewModel = CoffeeViewModel(imageName: coffee.imageName.rawValue, name: coffee.name, price: String(format: "%.2f", coffee.price), rating: String(coffee.rating))
        cell.configure(with: coffee)
        cell.onImageViewTapped = { [weak self] in
            guard let strongSelf = self else { return }
            let detailVC = DetailCoffeeView()
            detailVC.selectedCoffee = strongSelf.coffeeDataArray[indexPath.row]
            strongSelf.navigationController?.pushViewController(detailVC, animated: true)
        }

        return cell
    }
}

// MARK: - UICollectionViewDelegateFlowLayout
extension HomeViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let padding: CGFloat = 16
        let collectionViewSize = collectionView.frame.size.width - padding

        return CGSize(width: collectionViewSize/2, height: 220)
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }
}

extension HomeViewController {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let coffeeData = coffeeDataArray[indexPath.row]
        let detailVC = DetailCoffeeView()
        detailVC.selectedCoffee = coffeeData 
        navigationController?.pushViewController(detailVC, animated: true)
    }
}
