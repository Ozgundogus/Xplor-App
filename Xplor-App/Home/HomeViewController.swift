//
//  HomeViewController.swift
//  Xplor-App
//
//  Created by Ozgun Dogus on 22.08.2023.
//

import UIKit

class HomeViewController: UIViewController {

    let placeImageView : UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.contentMode = .scaleAspectFill
        image.clipsToBounds = true
        image.layer.cornerRadius = 10
        image.image = UIImage(named: "photo4")
        image.backgroundColor = .systemGray6
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
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .systemBackground
        
        configureUI()
        
    }
    
    private func configureUI (){
        view.addSubview(placeImageView)
        view.addSubview(placeNameLabel)
        view.addSubview(shuffleButton)
        
        NSLayoutConstraint.activate([
            placeImageView.topAnchor.constraint(equalTo: view.topAnchor , constant: 100),
            placeImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 32),
            placeImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -32),
            placeImageView.heightAnchor.constraint(equalToConstant: 350),
            
            placeNameLabel.topAnchor.constraint(equalTo: placeImageView.bottomAnchor , constant: 24),
            placeNameLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            placeNameLabel.widthAnchor.constraint(equalToConstant: 200),
            placeNameLabel.heightAnchor.constraint(equalToConstant: 48),
            
            shuffleButton.topAnchor.constraint(equalTo: placeNameLabel.bottomAnchor , constant: 24),
            shuffleButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            shuffleButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 32),
            shuffleButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -32),
            shuffleButton.heightAnchor.constraint(equalToConstant: 48),
        ])
        
        
    }
    
    @objc func didTapShuffle () {
        print("shuffle shuffle")
    }

  
}
