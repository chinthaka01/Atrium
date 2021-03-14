//
//  TopRepositoriesSectionView.swift
//  Atrium
//
//  Created by Chinthaka Perera on 2021-03-11.
//

import UIKit

class TopRepositoriesSectionView: UIView, SectionViewDelegate {

    var headerView: ProfileSectionHeaderView!

    override func draw(_ rect: CGRect) {
        addHeaderView()
    }
    
    func addHeaderView() {
        headerView = ProfileSectionHeaderView(title: "Top repositories")
        
        headerView.translatesAutoresizingMaskIntoConstraints = false
        
        addSubview(headerView)
        
        NSLayoutConstraint.activate([
            headerView.topAnchor.constraint(equalTo: layoutMarginsGuide.topAnchor),
            headerView.widthAnchor.constraint(equalTo: widthAnchor),
            headerView.centerXAnchor.constraint(equalTo: layoutMarginsGuide.centerXAnchor),
            headerView.heightAnchor.constraint(equalToConstant: 30)
        ])
        
        headerView.layoutIfNeeded()
    }
    
    /**
     *  SectionViewDelegate implementations
     */
    func feedUIComponents(user: GetProfileDataQuery.Data.User, userId: String?) {
        
    }

}
