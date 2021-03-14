//
//  ProfilePresenter.swift
//  Atrium
//
//  Created by Chinthaka Perera on 2021-03-13.
//

class ProfilePresenter {
    
    private let profileRetriever: ProfileRetriever
    weak private var profileViewControllerDelegate: ProfileViewControllerDelegate?
    
    init(profileRetriever: ProfileRetriever) {
        self.profileRetriever = profileRetriever
    }
    
    func setProfileViewControllerDelegate(profileViewControllerDelegate: ProfileViewControllerDelegate) {
        self.profileViewControllerDelegate = profileViewControllerDelegate
    }
    
    func getProfile(userId: String) {
        profileRetriever.fetchProfile(userId: userId) { (user: GetProfileDataQuery.Data.User?, error: Error?) in
            if (user != nil) {
                self.profileViewControllerDelegate?.displayProfile(user: user!)
            } else {
                self.profileViewControllerDelegate?.displayProfile(user: nil)
            }
        }
    }
}
