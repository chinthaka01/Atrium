//
//  ProfileHeaderView.swift
//  Atrium
//
//  Created by Chinthaka Perera on 2021-03-11.
//

import UIKit

class ProfileHeaderView: UIView, SectionViewDelegate {
    
    var titleLabel: UILabel!
    var thumbnailImageView: UIImageView!
    var nameLabel: UILabel!
    var userIdLabel: UILabel!
    var emailLabel: UILabel!
    var followersCountLabel: UILabel!
    var followingsCountLabel: UILabel!
    
    let uiComponentSpace: CGFloat = 10

    override func draw(_ rect: CGRect) {
        addTitleLabel()
        addThumbnailImageView()
        addNameLabel()
        addUserIdLabel()
        addEmailLabel()
        addFollowersLabel()
        addFollowingsLabel()
    }
    
    func addTitleLabel() {
        titleLabel = UILabel()
        
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.textAlignment = .center
        titleLabel.font = UIFont(name:AppConstants.boldFont, size: 14.0)
        titleLabel.text = "Profile"
        
        addSubview(titleLabel)
        
        NSLayoutConstraint.activate([
            titleLabel.widthAnchor.constraint(equalTo: layoutMarginsGuide.widthAnchor),
            titleLabel.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.16),
            titleLabel.topAnchor.constraint(equalTo: layoutMarginsGuide.topAnchor),
            titleLabel.centerXAnchor.constraint(equalTo: centerXAnchor)
        ])
        
        titleLabel.layoutIfNeeded()
    }
    
    func addThumbnailImageView() {
        thumbnailImageView = UIImageView()
        
        thumbnailImageView.translatesAutoresizingMaskIntoConstraints = false
        thumbnailImageView.contentMode = .scaleAspectFit
        
        addSubview(thumbnailImageView)
        
        NSLayoutConstraint.activate([
            thumbnailImageView.widthAnchor.constraint(equalTo: layoutMarginsGuide.heightAnchor, multiplier: 0.5),
            thumbnailImageView.heightAnchor.constraint(equalTo: layoutMarginsGuide.heightAnchor, multiplier: 0.5),
            thumbnailImageView.topAnchor.constraint(equalTo: titleLabel.layoutMarginsGuide.bottomAnchor, constant: uiComponentSpace),
            thumbnailImageView.leadingAnchor.constraint(equalTo: leadingAnchor)
        ])
        
        thumbnailImageView.layoutIfNeeded()
    }
    
    func addNameLabel() {
        nameLabel = UILabel()
        
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        nameLabel.font = UIFont(name:AppConstants.boldFont, size: 16.0)
        
        addSubview(nameLabel)
        
        NSLayoutConstraint.activate([
            nameLabel.topAnchor.constraint(equalTo: titleLabel.layoutMarginsGuide.bottomAnchor, constant: uiComponentSpace),
            nameLabel.leadingAnchor.constraint(equalTo: thumbnailImageView.layoutMarginsGuide.trailingAnchor),
            nameLabel.trailingAnchor.constraint(equalTo: layoutMarginsGuide.trailingAnchor),
            nameLabel.heightAnchor.constraint(equalTo: thumbnailImageView.heightAnchor, multiplier: 0.66)
        ])
        
        nameLabel.layoutIfNeeded()
    }
    
    func addUserIdLabel() {
        userIdLabel = UILabel()
        
        userIdLabel.translatesAutoresizingMaskIntoConstraints = false
        userIdLabel.font = UIFont(name:AppConstants.regularFont, size: 12.0)
        
        addSubview(userIdLabel)
        
        NSLayoutConstraint.activate([
            userIdLabel.topAnchor.constraint(equalTo: nameLabel.layoutMarginsGuide.bottomAnchor, constant: uiComponentSpace),
            userIdLabel.leadingAnchor.constraint(equalTo: thumbnailImageView.layoutMarginsGuide.trailingAnchor),
            userIdLabel.trailingAnchor.constraint(equalTo: layoutMarginsGuide.trailingAnchor),
            userIdLabel.heightAnchor.constraint(equalTo: thumbnailImageView.heightAnchor, multiplier: 0.33)
        ])
        
        userIdLabel.layoutIfNeeded()
    }
    
    func addEmailLabel() {
        emailLabel = UILabel()
        
        emailLabel.translatesAutoresizingMaskIntoConstraints = false
        emailLabel.font = UIFont(name:AppConstants.regularFont, size: 12.0)
        addSubview(emailLabel)
        
        NSLayoutConstraint.activate([
            emailLabel.topAnchor.constraint(equalTo: thumbnailImageView.layoutMarginsGuide.bottomAnchor, constant: uiComponentSpace),
            emailLabel.widthAnchor.constraint(equalTo: layoutMarginsGuide.widthAnchor),
            emailLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            emailLabel.heightAnchor.constraint(equalTo: thumbnailImageView.heightAnchor, multiplier: 0.33)
        ])
        
        emailLabel.layoutIfNeeded()
    }
    
    func addFollowersLabel() {
        followersCountLabel = UILabel()
        
        followersCountLabel.translatesAutoresizingMaskIntoConstraints = false
        followersCountLabel.font = UIFont(name:AppConstants.regularFont, size: 12.0)
        
        addSubview(followersCountLabel)
        
        NSLayoutConstraint.activate([
            followersCountLabel.topAnchor.constraint(equalTo: emailLabel.layoutMarginsGuide.bottomAnchor, constant: uiComponentSpace),
            followersCountLabel.leadingAnchor.constraint(equalTo: layoutMarginsGuide.leadingAnchor),
            followersCountLabel.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.25),
            followersCountLabel.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.33)
        ])
        
        followersCountLabel.layoutIfNeeded()
    }
    
    func addFollowingsLabel() {
        followingsCountLabel = UILabel()
        
        followingsCountLabel.translatesAutoresizingMaskIntoConstraints = false
        followingsCountLabel.font = UIFont(name:AppConstants.regularFont, size: 12.0)
        
        addSubview(followingsCountLabel)
        
        NSLayoutConstraint.activate([
            followingsCountLabel.topAnchor.constraint(equalTo: emailLabel.layoutMarginsGuide.bottomAnchor, constant: uiComponentSpace),
            followingsCountLabel.leadingAnchor.constraint(equalTo: followersCountLabel.layoutMarginsGuide.trailingAnchor, constant: uiComponentSpace),
            followingsCountLabel.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.25),
            followingsCountLabel.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.33)
        ])
        
        followingsCountLabel.layoutIfNeeded()
    }
    
    /**
     *  SectionViewDelegate implementations
     */
    func feedUIComponents(user: GetProfileDataQuery.Data.User, userId: String?) {
        nameLabel.text = user.fragments.profileDetails.name
        userIdLabel.text = userId
        emailLabel.text = user.fragments.profileDetails.email
        thumbnailImageView.load(url: URL(string: user.fragments.profileDetails.avatarUrl)!)
        followersCountLabel.text = "\(user.fragments.profileDetails.followers.totalCount) \("followers")"
        followingsCountLabel.text = "\(user.fragments.profileDetails.following.totalCount) \("followings")"
    }

}
