//
//  HomeViewController.swift
//  Xplor-App
//
//  Created by Ozgun Dogus on 22.08.2023.
//

import UIKit
import SDWebImage

class HomeViewController: UIViewController {

    lazy var placeImageView : UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.contentMode = .scaleAspectFill
        image.clipsToBounds = true
        image.layer.cornerRadius = 10
        image.image = UIImage(named: "photo4")
        image.backgroundColor = .systemGray6
        let gesture = UITapGestureRecognizer(target: self, action: #selector(didtapImage))
        image.isUserInteractionEnabled = true
        image.addGestureRecognizer(gesture)
        return image
    }()
    
    let placeNameLabel : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Xplor"
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 28, weight: .bold)
        
        return label
        
    }()
    
    //'self' refers to the method 'HomeViewController.self', which may be unexpected bu öneriden dolayı
     // buttondaki let yerine lazy var  kullanılmalı.
    
    
    lazy var shuffleButton : UIButton = {
        
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = .systemBlue
        button.setTitle("Xplor", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.addTarget(self, action: #selector(didTapShuffle), for: .touchUpInside)
        button.layer.cornerRadius = 10
        
        return button
    }()
    
    lazy var distanceFromPlaceLabel : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Distance"
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 16, weight: .regular)
        let gesture = UITapGestureRecognizer(target: self, action: #selector(didtapDistanceLabel))
        label.isUserInteractionEnabled = true
        label.addGestureRecognizer(gesture)
        return label
        
    }()
    
    
    let categoryView = CategoryView()
    var places = [PlaceModel]()
    var currentPlaces : PlaceModel?
    
    let databaseService : DatabaseServiceProtocol?
    
    init(databaseService: DatabaseServiceProtocol?) {
        self.databaseService = databaseService
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemBackground
        
        configureUI()
        fetchPlaces()
        
    }
    
    private func configureUI (){
        view.addSubview(placeImageView)
        view.addSubview(placeNameLabel)
        view.addSubview(categoryView)
        view.addSubview(shuffleButton)
        view.addSubview(distanceFromPlaceLabel)
        
        
        NSLayoutConstraint.activate([
            placeImageView.topAnchor.constraint(equalTo: view.topAnchor , constant: 100),
            placeImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 32),
            placeImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -32),
            placeImageView.heightAnchor.constraint(equalToConstant: 350),
            
            placeNameLabel.topAnchor.constraint(equalTo: placeImageView.bottomAnchor , constant: 24),
            placeNameLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            placeNameLabel.widthAnchor.constraint(equalToConstant: 200),
            placeNameLabel.heightAnchor.constraint(equalToConstant: 48),
            
            
            categoryView.topAnchor.constraint(equalTo: placeNameLabel.bottomAnchor , constant: 24),
            categoryView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            categoryView.widthAnchor.constraint(equalToConstant: 200),
            categoryView.heightAnchor.constraint(equalToConstant: 48),
            
            distanceFromPlaceLabel.topAnchor.constraint(equalTo: categoryView.bottomAnchor , constant: 24),
            distanceFromPlaceLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            distanceFromPlaceLabel.widthAnchor.constraint(equalToConstant: 200),
            distanceFromPlaceLabel.heightAnchor.constraint(equalToConstant: 24),
            
            
            shuffleButton.topAnchor.constraint(equalTo: distanceFromPlaceLabel.bottomAnchor , constant: 24),
            shuffleButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            shuffleButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 32),
            shuffleButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -32),
            shuffleButton.heightAnchor.constraint(equalToConstant: 48),
          
            
        ])
        
        
    }
    
    @objc func didTapShuffle () {
        if !places.isEmpty {
            self.currentPlaces = places.randomElement()
            guard let currentPlaces = currentPlaces else { return }
            updateCurrentPlaceFor(currentPlaces: currentPlaces)
        }
    }


 @objc func didtapImage () {
        print("image image")
    }

 @objc func didtapDistanceLabel () {
        print("distance distance")
    }

    private func fetchPlaces () {
        
     
        databaseService?.fetchPlaces { [weak self] result in
            guard let strongSelf = self else { return }
            switch result {
            case .success(let success):
                strongSelf.places = success
            case .failure(let failure):
                print("error")
                print(failure.localizedDescription)
            }
        }
    }
    
    private func updateCurrentPlaceFor (currentPlaces: PlaceModel) {
        placeNameLabel.text = currentPlaces.name
        
        // Image
        let urlString = currentPlaces.imageURL
        let url = URL(string: urlString)
        placeImageView.sd_setImage(with: url)
        
        // Category
        categoryView.setCategory(category: currentPlaces.category)
        // Distance
    }
}

