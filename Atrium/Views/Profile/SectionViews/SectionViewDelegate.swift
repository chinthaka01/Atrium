//
//  SectionViewDelegate.swift
//  Atrium
//
//  Created by Chinthaka Perera on 2021-03-13.
//

import Foundation

protocol SectionViewDelegate: AnyObject {
    func feedUIComponents(user: GetProfileDataQuery.Data.User, userId: String?)
}
