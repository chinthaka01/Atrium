//
//  RepositoryTileViewTopComponent.swift
//  Atrium
//
//  Created by Chinthaka Perera on 2021-03-12.
//

import UIKit

class RepositoryTileViewTopComponent: UIView {

    var thumbnailImageView: UIImageView!
    var userIdLabel: UILabel!
    var repositoryNameLabel: UILabel!
    var descriptionLabel: UILabel!

    override func draw(_ rect: CGRect) {
        addThumbnailImageView()
        addUserIdLabel()
        addRepositoryNameLabel()
        addDescriptionLabel()
    }
    
    func addThumbnailImageView() {
        thumbnailImageView = UIImageView()
        
        thumbnailImageView.translatesAutoresizingMaskIntoConstraints = false
        
        addSubview(thumbnailImageView)
        
        NSLayoutConstraint.activate([
            thumbnailImageView.widthAnchor.constraint(equalTo: layoutMarginsGuide.heightAnchor, multiplier: 0.5),
            thumbnailImageView.heightAnchor.constraint(equalTo: layoutMarginsGuide.heightAnchor, multiplier: 0.5),
            thumbnailImageView.topAnchor.constraint(equalTo: layoutMarginsGuide.topAnchor),
            thumbnailImageView.leadingAnchor.constraint(equalTo: layoutMarginsGuide.leadingAnchor)
        ])
        
        thumbnailImageView.layoutIfNeeded()
    }
    
    func addUserIdLabel() {
        userIdLabel = UILabel()
        
        userIdLabel.translatesAutoresizingMaskIntoConstraints = false
        
        addSubview(userIdLabel)
        
        NSLayoutConstraint.activate([
            userIdLabel.heightAnchor.constraint(equalTo: thumbnailImageView.layoutMarginsGuide.heightAnchor, multiplier: 0.5),
            userIdLabel.leadingAnchor.constraint(equalTo: thumbnailImageView.layoutMarginsGuide.trailingAnchor),
            userIdLabel.trailingAnchor.constraint(equalTo: layoutMarginsGuide.trailingAnchor),
            userIdLabel.centerYAnchor.constraint(equalTo: thumbnailImageView.layoutMarginsGuide.centerYAnchor)
        ])
        
        userIdLabel.layoutIfNeeded()
    }
    
    func addRepositoryNameLabel() {
        repositoryNameLabel = UILabel()
        
        repositoryNameLabel.translatesAutoresizingMaskIntoConstraints = false
        
        addSubview(repositoryNameLabel)
        
        NSLayoutConstraint.activate([
            repositoryNameLabel.topAnchor.constraint(equalTo: thumbnailImageView.layoutMarginsGuide.bottomAnchor),
            repositoryNameLabel.heightAnchor.constraint(equalTo: layoutMarginsGuide.heightAnchor, multiplier: 0.25),
            repositoryNameLabel.widthAnchor.constraint(equalTo: layoutMarginsGuide.widthAnchor),
            repositoryNameLabel.centerXAnchor.constraint(equalTo: layoutMarginsGuide.centerXAnchor)
        ])
        
        repositoryNameLabel.layoutIfNeeded()
    }
    
    func addDescriptionLabel() {
        descriptionLabel = UILabel()
        
        descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        
        addSubview(descriptionLabel)
        
        NSLayoutConstraint.activate([
            descriptionLabel.topAnchor.constraint(equalTo: repositoryNameLabel.layoutMarginsGuide.bottomAnchor),
            descriptionLabel.heightAnchor.constraint(equalTo: layoutMarginsGuide.heightAnchor, multiplier: 0.25),
            descriptionLabel.widthAnchor.constraint(equalTo: layoutMarginsGuide.widthAnchor),
            descriptionLabel.centerXAnchor.constraint(equalTo: layoutMarginsGuide.centerXAnchor)
        ])
        
        descriptionLabel.layoutIfNeeded()
    }

}
