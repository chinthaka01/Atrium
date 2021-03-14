//
//  UserDefaultsExtension.swift
//  Atrium
//
//  Created by Chinthaka Perera on 2021-03-14.
//

import Foundation

extension UserDefaults{
    
    var lastUpdateTimestamp: Date? {
        get {
            guard let lastUpdateTimestamp = object(forKey: AppConstants.lastUpdatedTimestampKey) else {
                return nil
            }

            return (lastUpdateTimestamp as! Date)
        }

        set(timestamp) {
            setValue(timestamp, forKey: AppConstants.lastUpdatedTimestampKey)
            synchronize()
        }
    }
    
//    func setLastUpdatedTimestamp(timestamp: Date) {
//        setValue(timestamp, forKey: AppConstants.lastUpdatedTimestampKey)
//        synchronize()
//    }
//
//    func getLastUpdatedTimestamp() -> Date? {
//
//        guard let lastUpdateTimestamp = object(forKey: AppConstants.lastUpdatedTimestampKey) else {
//            return nil
//        }
//
//        return (lastUpdateTimestamp as! Date)
//    }
}
