//
//  RepositoryTileViewBottomComponent.swift
//  Atrium
//
//  Created by Chinthaka Perera on 2021-03-12.
//

import UIKit

class RepositoryTileViewBottomComponent: UIView {

    var countImageView: UIImageView!
    var countLabel: UILabel!
    var languageImageView: UIImageView!
    var languageLabel: UILabel!

    override func draw(_ rect: CGRect) {
        addCountImageView()
        addCountLabel()
        addLanguageImageView()
        addLanguageLabel()
    }
    
    func addCountImageView() {
        countImageView = UIImageView()
        
        countImageView.translatesAutoresizingMaskIntoConstraints = false
        
        addSubview(countImageView)
        
        NSLayoutConstraint.activate([
            countImageView.widthAnchor.constraint(equalTo: layoutMarginsGuide.heightAnchor, multiplier: 0.33),
            countImageView.heightAnchor.constraint(equalTo: layoutMarginsGuide.heightAnchor, multiplier: 0.33),
            countImageView.leadingAnchor.constraint(equalTo: layoutMarginsGuide.leadingAnchor),
            countImageView.centerYAnchor.constraint(equalTo: layoutMarginsGuide.centerYAnchor)
        ])
        
        countImageView.layoutIfNeeded()
    }
    
    func addCountLabel() {
        countLabel = UILabel()
        
        countLabel.translatesAutoresizingMaskIntoConstraints = false
        
        addSubview(countLabel)
        
        NSLayoutConstraint.activate([
            countLabel.widthAnchor.constraint(equalToConstant: 30),
            countLabel.heightAnchor.constraint(equalTo: layoutMarginsGuide.heightAnchor, multiplier: 0.33),
            countLabel.leadingAnchor.constraint(equalTo: countImageView.leadingAnchor, constant: 5),
            countLabel.centerYAnchor.constraint(equalTo: layoutMarginsGuide.centerYAnchor)
        ])
        
        countLabel.layoutIfNeeded()
    }

    func addLanguageImageView() {
        languageImageView = UIImageView()
        
        languageImageView.translatesAutoresizingMaskIntoConstraints = false
        
        addSubview(languageImageView)
        
        NSLayoutConstraint.activate([
            languageImageView.widthAnchor.constraint(equalTo: layoutMarginsGuide.heightAnchor, multiplier: 0.33),
            languageImageView.heightAnchor.constraint(equalTo: layoutMarginsGuide.heightAnchor, multiplier: 0.33),
            languageImageView.leadingAnchor.constraint(equalTo: countLabel.layoutMarginsGuide.leadingAnchor, constant: 20),
            languageImageView.centerYAnchor.constraint(equalTo: layoutMarginsGuide.centerYAnchor)
        ])
        
        languageImageView.layoutIfNeeded()
    }
    
    func addLanguageLabel() {
        languageLabel = UILabel()
        
        languageLabel.translatesAutoresizingMaskIntoConstraints = false
        
        addSubview(languageLabel)
        
        NSLayoutConstraint.activate([
            languageLabel.heightAnchor.constraint(equalTo: layoutMarginsGuide.heightAnchor, multiplier: 0.33),
            languageLabel.leadingAnchor.constraint(equalTo: countImageView.leadingAnchor, constant: 5),
            languageLabel.trailingAnchor.constraint(equalTo: layoutMarginsGuide.trailingAnchor),
            languageLabel.centerYAnchor.constraint(equalTo: layoutMarginsGuide.centerYAnchor)
        ])
        
        languageLabel.layoutIfNeeded()
    }

}
