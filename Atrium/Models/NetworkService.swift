//
//  Network.swift
//  Atrium
//
//  Created by Chinthaka Perera on 2021-03-12.
//

import Foundation
import Apollo
import ApolloSQLite

class NetworkService {
    static let shared = NetworkService()
    
    static let sqlitDbName = "atrium_db.sqlite"
    static let authorizationToken = "946aa446f96cd8940b08721e1274168a76bc15eb"
    static let endpoint = "https://api.github.com/graphql"
    
    private(set) lazy var apollo: ApolloClient = {

        let documentsPath = NSSearchPathForDirectoriesInDomains(
            .documentDirectory,
            .userDomainMask,
            true).first!
        let documentsURL = URL(fileURLWithPath: documentsPath)
        let sqliteFileURL = documentsURL.appendingPathComponent(NetworkService.sqlitDbName)

        var sqliteCache: SQLiteNormalizedCache? = nil

        do {
            try sqliteCache = SQLiteNormalizedCache(fileURL: sqliteFileURL)
        } catch {
            print("Error occured when creating the sqlite DB for caching.")
        }
        let store = ApolloStore(cache: sqliteCache!)

        let authPayloads = ["Authorization": "Bearer \(NetworkService.authorizationToken)"]
        let configuration = URLSessionConfiguration.default
        
        configuration.httpAdditionalHeaders = authPayloads
        
        let client = URLSessionClient(sessionConfiguration: configuration)
        
        let provider = LegacyInterceptorProvider(client: client, shouldInvalidateClientOnDeinit: true, store: store)
        let url = URL(string: NetworkService.endpoint)!

        let requestChainTransport = RequestChainNetworkTransport(interceptorProvider: provider,
                                                                 endpointURL: url)

        return ApolloClient(networkTransport: requestChainTransport,
                            store: store)
    }()
}
