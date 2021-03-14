//
//  ProfileRetrieverDelegate.swift
//  Atrium
//
//  Protocol for the ProfileRetriever service.
//
//  Created by Chinthaka Perera on 2021-03-14.
//

import Foundation

protocol ProfileRetrieverDelegate: AnyObject {
    
    /**
     *  Fetching the user using the API call or from the cache.
     */
    func fetchProfile(userId: String!, callBack: @escaping (GetProfileDataQuery.Data.User?, Error?) -> Void)
}
