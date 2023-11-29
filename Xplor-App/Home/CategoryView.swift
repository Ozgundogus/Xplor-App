//
//  CategoryView.swift
//  Xplor-App
//
//  Created by Ozgun Dogus on 2.09.2023.
//

import UIKit

class CategoryView: UIView {
    
   
    let categoryLabel :UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Category"
        label.font = .systemFont(ofSize: 20, weight: .regular)
        label.textAlignment = .center
        return label
    }()
    
    let circleImageView : UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(systemName: "circle.fill")
        
        return imageView
     
    }()
    

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        
        configureUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configureUI (){
        translatesAutoresizingMaskIntoConstraints = false
        addSubview(categoryLabel)
        addSubview(circleImageView)
        
        NSLayoutConstraint.activate([
         
            categoryLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            categoryLabel.centerYAnchor.constraint(equalTo: centerYAnchor),
            categoryLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -8),
            categoryLabel.heightAnchor.constraint(equalToConstant: 24),
            
            
            circleImageView.trailingAnchor.constraint(equalTo: categoryLabel.leadingAnchor, constant: 8),
            circleImageView.centerYAnchor.constraint(equalTo: centerYAnchor),
            circleImageView.heightAnchor.constraint(equalToConstant: 20),
            circleImageView.widthAnchor.constraint(equalToConstant: 20),
            
        ])
    }
    
    func setCategory (category:String){
        categoryLabel.text = category
        if category == "Nature" {
            categoryLabel.textColor = .systemGreen
            circleImageView.tintColor = .systemGreen
        } else if category == "Food" {
            categoryLabel.textColor = .systemOrange
            circleImageView.tintColor = .systemOrange
        } else if category == "Venue" {
            categoryLabel.textColor = .systemBlue
            circleImageView.tintColor = .systemBlue
        } else if category == "Attraction" {
            categoryLabel.textColor = .systemRed
            circleImageView.tintColor = .systemRed
        }
    }
}
