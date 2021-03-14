//
//  ProfileRetriever.swift
//  Atrium
//
//  Service to invoke the netwok call to retrieve the user.
//
//  Created by Chinthaka Perera on 2021-03-13.
//

import Foundation
import Apollo

class ProfileRetriever: ProfileRetrieverDelegate {

    func fetchProfile(userId: String!, callBack: @escaping (GetProfileDataQuery.Data.User?, Error?) -> Void) {
        clearCache {
            NetworkService.shared.apollo.fetch(query: GetProfileDataQuery(login: userId)) { result in
              switch result {
              case .success(let graphQLResult):
                print("Success! Result: \(graphQLResult)")
                
                if graphQLResult.data != nil {
                    self.setLastUpdatedTimestamp()
                    callBack((graphQLResult.data?.user)!, nil)
                } else {
                    callBack(nil, nil)
                }
              case .failure(let error):
                print("Failure! Error: \(error)")
                callBack(nil, error)
              }
            }
        }
    }
    
    /**
     *  Delete the cached user data.
     */
    func clearCache(callBack: @escaping () -> Void) {
        let lastUpdateTimestamp = UserDefaults.init().lastUpdateTimestamp
        
        let secsForMinute = 60
        let minsForHour = 60
        let hoursForDay = 24
        
        let timeInterval: TimeInterval = TimeInterval(secsForMinute*minsForHour*hoursForDay)
        
        if lastUpdateTimestamp != nil {
            if (lastUpdateTimestamp?.addingTimeInterval(timeInterval))! > Date() {
                ApolloStore.init().clearCache(callbackQueue: .main) { reult in
                    UserDefaults.init().lastUpdateTimestamp = nil
                    callBack()
                }
            }
        } else {
            callBack()
        }
    }
    
    /**
     *  Set the timestamp of API data fetch.
     */
    func setLastUpdatedTimestamp() {
        let userDefaults = UserDefaults.init()
        if userDefaults.lastUpdateTimestamp == nil {
            userDefaults.lastUpdateTimestamp = Date()
        }
    }
}
