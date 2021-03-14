//
//  ProfileViewControllerDelegate.swift
//  Atrium
//
//  Created by Chinthaka Perera on 2021-03-13.
//

import Foundation

protocol ProfileViewControllerDelegate: AnyObject {
    func displayProfile(user: GetProfileDataQuery.Data.User?)
}
