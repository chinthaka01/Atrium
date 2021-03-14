//
//  ProfileSectionHeaderView.swift
//  Atrium
//
//  Created by Chinthaka Perera on 2021-03-12.
//

import UIKit

class ProfileSectionHeaderView: UIView {
    
    var titleLabel: UILabel!
    var viewAllButton: UIButton!
    
    var title: String!
    
    init(title: String) {
        super.init(frame: .zero)
        
        self.title = title
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func draw(_ rect: CGRect) {
        addTitleLabel()
        addViewAllButton()
    }
    
    func addTitleLabel() {
        titleLabel = UILabel()
        
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.text = title
        
        addSubview(titleLabel)
        
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: layoutMarginsGuide.topAnchor),
            titleLabel.leadingAnchor.constraint(equalTo: layoutMarginsGuide.leadingAnchor),
            titleLabel.heightAnchor.constraint(equalTo: heightAnchor),
            titleLabel.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.5)
        ])
        
        titleLabel.layoutIfNeeded()
    }
    
    func addViewAllButton() {
        viewAllButton = UIButton()
        
        viewAllButton.translatesAutoresizingMaskIntoConstraints = false
        viewAllButton.setTitle("View All", for: .normal)
        
        addSubview(viewAllButton)
        
        NSLayoutConstraint.activate([
            viewAllButton.topAnchor.constraint(equalTo: layoutMarginsGuide.topAnchor),
            viewAllButton.trailingAnchor.constraint(equalTo: layoutMarginsGuide.trailingAnchor),
            viewAllButton.heightAnchor.constraint(equalTo: heightAnchor),
            viewAllButton.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.25)
        ])
        
        titleLabel.layoutIfNeeded()
    }

}
