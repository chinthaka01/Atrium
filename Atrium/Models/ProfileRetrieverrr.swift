//
//  ProfileRetriever.swift
//  Atrium
//
//  Created by Chinthaka Perera on 2021-03-13.
//

import Foundation

class ProfileRetriever {
    
    func fetchProfile(userId: String!, callBack: @escaping (GetProfileDataQuery.Data.User) -> Void) {
        NetworkService.shared.apollo.fetch(query: GetProfileDataQuery(login: userId)) { result in
          switch result {
          case .success(let graphQLResult):
            print("Success! Result: \(graphQLResult)")
            callBack((graphQLResult.data?.user)!)
          case .failure(let error):
            print("Failure! Error: \(error)")
          }
        }
    }
    
//    func clearCache() {
//
//    }
}
