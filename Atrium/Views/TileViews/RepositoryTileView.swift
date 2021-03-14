//
//  RepositoryTileView.swift
//  Atrium
//
//  Created by Chinthaka Perera on 2021-03-11.
//

import UIKit

class RepositoryTileView: UIView {
    
    var topComponentView: RepositoryTileViewTopComponent!
    var bottomComponentView: RepositoryTileViewBottomComponent!

    override func draw(_ rect: CGRect) {
        addTopComponentView()
        addBottomComponentView()
    }
    
    func addTopComponentView() {
        topComponentView = RepositoryTileViewTopComponent()
        
        topComponentView.translatesAutoresizingMaskIntoConstraints = false
        
        addSubview(topComponentView)
        
        NSLayoutConstraint.activate([
            topComponentView.widthAnchor.constraint(equalTo: layoutMarginsGuide.widthAnchor),
            topComponentView.heightAnchor.constraint(equalTo: layoutMarginsGuide.heightAnchor, multiplier: 0.66),
            topComponentView.topAnchor.constraint(equalTo: layoutMarginsGuide.topAnchor),
            topComponentView.centerXAnchor.constraint(equalTo: layoutMarginsGuide.centerXAnchor)
        ])
        
        topComponentView.layoutIfNeeded()
    }
    
    func addBottomComponentView() {
        bottomComponentView = RepositoryTileViewBottomComponent()
        
        bottomComponentView.translatesAutoresizingMaskIntoConstraints = false
        
        addSubview(bottomComponentView)
        
        NSLayoutConstraint.activate([
            bottomComponentView.widthAnchor.constraint(equalTo: layoutMarginsGuide.widthAnchor),
            bottomComponentView.heightAnchor.constraint(equalTo: layoutMarginsGuide.heightAnchor, multiplier: 0.33),
            bottomComponentView.topAnchor.constraint(equalTo: topComponentView.layoutMarginsGuide.bottomAnchor),
            bottomComponentView.centerXAnchor.constraint(equalTo: layoutMarginsGuide.centerXAnchor)
        ])
        
        bottomComponentView.layoutIfNeeded()
    }
}
