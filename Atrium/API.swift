// @generated
//  This file was automatically generated and should not be edited.

import Apollo
import Foundation

public final class GetProfileDataQuery: GraphQLQuery {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    query GetProfileData($login: String!) {
      user(login: $login) {
        __typename
        ...ProfileDetails
      }
    }
    """

  public let operationName: String = "GetProfileData"

  public var queryDocument: String { return operationDefinition.appending("\n" + ProfileDetails.fragmentDefinition) }

  public var login: String

  public init(login: String) {
    self.login = login
  }

  public var variables: GraphQLMap? {
    return ["login": login]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["Query"]

    public static var selections: [GraphQLSelection] {
      return [
        GraphQLField("user", arguments: ["login": GraphQLVariable("login")], type: .object(User.selections)),
      ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(user: User? = nil) {
      self.init(unsafeResultMap: ["__typename": "Query", "user": user.flatMap { (value: User) -> ResultMap in value.resultMap }])
    }

    /// Lookup a user by login.
    public var user: User? {
      get {
        return (resultMap["user"] as? ResultMap).flatMap { User(unsafeResultMap: $0) }
      }
      set {
        resultMap.updateValue(newValue?.resultMap, forKey: "user")
      }
    }

    public struct User: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["User"]

      public static var selections: [GraphQLSelection] {
        return [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLFragmentSpread(ProfileDetails.self),
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      public var fragments: Fragments {
        get {
          return Fragments(unsafeResultMap: resultMap)
        }
        set {
          resultMap += newValue.resultMap
        }
      }

      public struct Fragments {
        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public var profileDetails: ProfileDetails {
          get {
            return ProfileDetails(unsafeResultMap: resultMap)
          }
          set {
            resultMap += newValue.resultMap
          }
        }
      }
    }
  }
}

public struct ProfileDetails: GraphQLFragment {
  /// The raw GraphQL definition of this fragment.
  public static let fragmentDefinition: String =
    """
    fragment ProfileDetails on User {
      __typename
      email
      id
      following {
        __typename
        totalCount
      }
      followers {
        __typename
        totalCount
      }
      avatarUrl
      name
      topRepositories(orderBy: {field: CREATED_AT, direction: ASC}, first: 10) {
        __typename
        edges {
          __typename
          node {
            __typename
            description
            languages(orderBy: {field: SIZE, direction: ASC}, first: 1) {
              __typename
              edges {
                __typename
                node {
                  __typename
                  name
                }
              }
            }
            name
            owner {
              __typename
              avatarUrl
              id
            }
            stargazerCount
          }
        }
      }
      starredRepositories(first: 10, orderBy: {field: STARRED_AT, direction: ASC}) {
        __typename
        edges {
          __typename
          node {
            __typename
            description
            languages(first: 1) {
              __typename
              edges {
                __typename
                node {
                  __typename
                  name
                }
              }
            }
            name
            owner {
              __typename
              avatarUrl
              id
            }
            stargazerCount
          }
        }
      }
      pinnedItems(first: 3) {
        __typename
        nodes {
          __typename
          ... on Repository {
            name
            description
            languages(first: 1, orderBy: {field: SIZE, direction: ASC}) {
              __typename
              edges {
                __typename
                node {
                  __typename
                  name
                }
              }
            }
            owner {
              __typename
              avatarUrl
              id
            }
            stargazerCount
          }
        }
      }
    }
    """

  public static let possibleTypes: [String] = ["User"]

  public static var selections: [GraphQLSelection] {
    return [
      GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
      GraphQLField("email", type: .nonNull(.scalar(String.self))),
      GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
      GraphQLField("following", type: .nonNull(.object(Following.selections))),
      GraphQLField("followers", type: .nonNull(.object(Follower.selections))),
      GraphQLField("avatarUrl", type: .nonNull(.scalar(String.self))),
      GraphQLField("name", type: .scalar(String.self)),
      GraphQLField("topRepositories", arguments: ["orderBy": ["field": "CREATED_AT", "direction": "ASC"], "first": 10], type: .nonNull(.object(TopRepository.selections))),
      GraphQLField("starredRepositories", arguments: ["first": 10, "orderBy": ["field": "STARRED_AT", "direction": "ASC"]], type: .nonNull(.object(StarredRepository.selections))),
      GraphQLField("pinnedItems", arguments: ["first": 3], type: .nonNull(.object(PinnedItem.selections))),
    ]
  }

  public private(set) var resultMap: ResultMap

  public init(unsafeResultMap: ResultMap) {
    self.resultMap = unsafeResultMap
  }

  public init(email: String, id: GraphQLID, following: Following, followers: Follower, avatarUrl: String, name: String? = nil, topRepositories: TopRepository, starredRepositories: StarredRepository, pinnedItems: PinnedItem) {
    self.init(unsafeResultMap: ["__typename": "User", "email": email, "id": id, "following": following.resultMap, "followers": followers.resultMap, "avatarUrl": avatarUrl, "name": name, "topRepositories": topRepositories.resultMap, "starredRepositories": starredRepositories.resultMap, "pinnedItems": pinnedItems.resultMap])
  }

  public var __typename: String {
    get {
      return resultMap["__typename"]! as! String
    }
    set {
      resultMap.updateValue(newValue, forKey: "__typename")
    }
  }

  /// The user's publicly visible profile email.
  public var email: String {
    get {
      return resultMap["email"]! as! String
    }
    set {
      resultMap.updateValue(newValue, forKey: "email")
    }
  }

  public var id: GraphQLID {
    get {
      return resultMap["id"]! as! GraphQLID
    }
    set {
      resultMap.updateValue(newValue, forKey: "id")
    }
  }

  /// A list of users the given user is following.
  public var following: Following {
    get {
      return Following(unsafeResultMap: resultMap["following"]! as! ResultMap)
    }
    set {
      resultMap.updateValue(newValue.resultMap, forKey: "following")
    }
  }

  /// A list of users the given user is followed by.
  public var followers: Follower {
    get {
      return Follower(unsafeResultMap: resultMap["followers"]! as! ResultMap)
    }
    set {
      resultMap.updateValue(newValue.resultMap, forKey: "followers")
    }
  }

  /// A URL pointing to the user's public avatar.
  public var avatarUrl: String {
    get {
      return resultMap["avatarUrl"]! as! String
    }
    set {
      resultMap.updateValue(newValue, forKey: "avatarUrl")
    }
  }

  /// The user's public profile name.
  public var name: String? {
    get {
      return resultMap["name"] as? String
    }
    set {
      resultMap.updateValue(newValue, forKey: "name")
    }
  }

  /// Repositories the user has contributed to, ordered by contribution rank, plus repositories the user has created
  public var topRepositories: TopRepository {
    get {
      return TopRepository(unsafeResultMap: resultMap["topRepositories"]! as! ResultMap)
    }
    set {
      resultMap.updateValue(newValue.resultMap, forKey: "topRepositories")
    }
  }

  /// Repositories the user has starred.
  public var starredRepositories: StarredRepository {
    get {
      return StarredRepository(unsafeResultMap: resultMap["starredRepositories"]! as! ResultMap)
    }
    set {
      resultMap.updateValue(newValue.resultMap, forKey: "starredRepositories")
    }
  }

  /// A list of repositories and gists this profile owner has pinned to their profile
  public var pinnedItems: PinnedItem {
    get {
      return PinnedItem(unsafeResultMap: resultMap["pinnedItems"]! as! ResultMap)
    }
    set {
      resultMap.updateValue(newValue.resultMap, forKey: "pinnedItems")
    }
  }

  public struct Following: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["FollowingConnection"]

    public static var selections: [GraphQLSelection] {
      return [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("totalCount", type: .nonNull(.scalar(Int.self))),
      ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(totalCount: Int) {
      self.init(unsafeResultMap: ["__typename": "FollowingConnection", "totalCount": totalCount])
    }

    public var __typename: String {
      get {
        return resultMap["__typename"]! as! String
      }
      set {
        resultMap.updateValue(newValue, forKey: "__typename")
      }
    }

    /// Identifies the total count of items in the connection.
    public var totalCount: Int {
      get {
        return resultMap["totalCount"]! as! Int
      }
      set {
        resultMap.updateValue(newValue, forKey: "totalCount")
      }
    }
  }

  public struct Follower: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["FollowerConnection"]

    public static var selections: [GraphQLSelection] {
      return [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("totalCount", type: .nonNull(.scalar(Int.self))),
      ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(totalCount: Int) {
      self.init(unsafeResultMap: ["__typename": "FollowerConnection", "totalCount": totalCount])
    }

    public var __typename: String {
      get {
        return resultMap["__typename"]! as! String
      }
      set {
        resultMap.updateValue(newValue, forKey: "__typename")
      }
    }

    /// Identifies the total count of items in the connection.
    public var totalCount: Int {
      get {
        return resultMap["totalCount"]! as! Int
      }
      set {
        resultMap.updateValue(newValue, forKey: "totalCount")
      }
    }
  }

  public struct TopRepository: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["RepositoryConnection"]

    public static var selections: [GraphQLSelection] {
      return [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("edges", type: .list(.object(Edge.selections))),
      ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(edges: [Edge?]? = nil) {
      self.init(unsafeResultMap: ["__typename": "RepositoryConnection", "edges": edges.flatMap { (value: [Edge?]) -> [ResultMap?] in value.map { (value: Edge?) -> ResultMap? in value.flatMap { (value: Edge) -> ResultMap in value.resultMap } } }])
    }

    public var __typename: String {
      get {
        return resultMap["__typename"]! as! String
      }
      set {
        resultMap.updateValue(newValue, forKey: "__typename")
      }
    }

    /// A list of edges.
    public var edges: [Edge?]? {
      get {
        return (resultMap["edges"] as? [ResultMap?]).flatMap { (value: [ResultMap?]) -> [Edge?] in value.map { (value: ResultMap?) -> Edge? in value.flatMap { (value: ResultMap) -> Edge in Edge(unsafeResultMap: value) } } }
      }
      set {
        resultMap.updateValue(newValue.flatMap { (value: [Edge?]) -> [ResultMap?] in value.map { (value: Edge?) -> ResultMap? in value.flatMap { (value: Edge) -> ResultMap in value.resultMap } } }, forKey: "edges")
      }
    }

    public struct Edge: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["RepositoryEdge"]

      public static var selections: [GraphQLSelection] {
        return [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("node", type: .object(Node.selections)),
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(node: Node? = nil) {
        self.init(unsafeResultMap: ["__typename": "RepositoryEdge", "node": node.flatMap { (value: Node) -> ResultMap in value.resultMap }])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      /// The item at the end of the edge.
      public var node: Node? {
        get {
          return (resultMap["node"] as? ResultMap).flatMap { Node(unsafeResultMap: $0) }
        }
        set {
          resultMap.updateValue(newValue?.resultMap, forKey: "node")
        }
      }

      public struct Node: GraphQLSelectionSet {
        public static let possibleTypes: [String] = ["Repository"]

        public static var selections: [GraphQLSelection] {
          return [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("description", type: .scalar(String.self)),
            GraphQLField("languages", arguments: ["orderBy": ["field": "SIZE", "direction": "ASC"], "first": 1], type: .object(Language.selections)),
            GraphQLField("name", type: .nonNull(.scalar(String.self))),
            GraphQLField("owner", type: .nonNull(.object(Owner.selections))),
            GraphQLField("stargazerCount", type: .nonNull(.scalar(Int.self))),
          ]
        }

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(description: String? = nil, languages: Language? = nil, name: String, owner: Owner, stargazerCount: Int) {
          self.init(unsafeResultMap: ["__typename": "Repository", "description": description, "languages": languages.flatMap { (value: Language) -> ResultMap in value.resultMap }, "name": name, "owner": owner.resultMap, "stargazerCount": stargazerCount])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        /// The description of the repository.
        public var description: String? {
          get {
            return resultMap["description"] as? String
          }
          set {
            resultMap.updateValue(newValue, forKey: "description")
          }
        }

        /// A list containing a breakdown of the language composition of the repository.
        public var languages: Language? {
          get {
            return (resultMap["languages"] as? ResultMap).flatMap { Language(unsafeResultMap: $0) }
          }
          set {
            resultMap.updateValue(newValue?.resultMap, forKey: "languages")
          }
        }

        /// The name of the repository.
        public var name: String {
          get {
            return resultMap["name"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "name")
          }
        }

        /// The User owner of the repository.
        public var owner: Owner {
          get {
            return Owner(unsafeResultMap: resultMap["owner"]! as! ResultMap)
          }
          set {
            resultMap.updateValue(newValue.resultMap, forKey: "owner")
          }
        }

        /// Returns a count of how many stargazers there are on this object
        public var stargazerCount: Int {
          get {
            return resultMap["stargazerCount"]! as! Int
          }
          set {
            resultMap.updateValue(newValue, forKey: "stargazerCount")
          }
        }

        public struct Language: GraphQLSelectionSet {
          public static let possibleTypes: [String] = ["LanguageConnection"]

          public static var selections: [GraphQLSelection] {
            return [
              GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
              GraphQLField("edges", type: .list(.object(Edge.selections))),
            ]
          }

          public private(set) var resultMap: ResultMap

          public init(unsafeResultMap: ResultMap) {
            self.resultMap = unsafeResultMap
          }

          public init(edges: [Edge?]? = nil) {
            self.init(unsafeResultMap: ["__typename": "LanguageConnection", "edges": edges.flatMap { (value: [Edge?]) -> [ResultMap?] in value.map { (value: Edge?) -> ResultMap? in value.flatMap { (value: Edge) -> ResultMap in value.resultMap } } }])
          }

          public var __typename: String {
            get {
              return resultMap["__typename"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "__typename")
            }
          }

          /// A list of edges.
          public var edges: [Edge?]? {
            get {
              return (resultMap["edges"] as? [ResultMap?]).flatMap { (value: [ResultMap?]) -> [Edge?] in value.map { (value: ResultMap?) -> Edge? in value.flatMap { (value: ResultMap) -> Edge in Edge(unsafeResultMap: value) } } }
            }
            set {
              resultMap.updateValue(newValue.flatMap { (value: [Edge?]) -> [ResultMap?] in value.map { (value: Edge?) -> ResultMap? in value.flatMap { (value: Edge) -> ResultMap in value.resultMap } } }, forKey: "edges")
            }
          }

          public struct Edge: GraphQLSelectionSet {
            public static let possibleTypes: [String] = ["LanguageEdge"]

            public static var selections: [GraphQLSelection] {
              return [
                GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
                GraphQLField("node", type: .nonNull(.object(Node.selections))),
              ]
            }

            public private(set) var resultMap: ResultMap

            public init(unsafeResultMap: ResultMap) {
              self.resultMap = unsafeResultMap
            }

            public init(node: Node) {
              self.init(unsafeResultMap: ["__typename": "LanguageEdge", "node": node.resultMap])
            }

            public var __typename: String {
              get {
                return resultMap["__typename"]! as! String
              }
              set {
                resultMap.updateValue(newValue, forKey: "__typename")
              }
            }

            public var node: Node {
              get {
                return Node(unsafeResultMap: resultMap["node"]! as! ResultMap)
              }
              set {
                resultMap.updateValue(newValue.resultMap, forKey: "node")
              }
            }

            public struct Node: GraphQLSelectionSet {
              public static let possibleTypes: [String] = ["Language"]

              public static var selections: [GraphQLSelection] {
                return [
                  GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
                  GraphQLField("name", type: .nonNull(.scalar(String.self))),
                ]
              }

              public private(set) var resultMap: ResultMap

              public init(unsafeResultMap: ResultMap) {
                self.resultMap = unsafeResultMap
              }

              public init(name: String) {
                self.init(unsafeResultMap: ["__typename": "Language", "name": name])
              }

              public var __typename: String {
                get {
                  return resultMap["__typename"]! as! String
                }
                set {
                  resultMap.updateValue(newValue, forKey: "__typename")
                }
              }

              /// The name of the current language.
              public var name: String {
                get {
                  return resultMap["name"]! as! String
                }
                set {
                  resultMap.updateValue(newValue, forKey: "name")
                }
              }
            }
          }
        }

        public struct Owner: GraphQLSelectionSet {
          public static let possibleTypes: [String] = ["Organization", "User"]

          public static var selections: [GraphQLSelection] {
            return [
              GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
              GraphQLField("avatarUrl", type: .nonNull(.scalar(String.self))),
              GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
            ]
          }

          public private(set) var resultMap: ResultMap

          public init(unsafeResultMap: ResultMap) {
            self.resultMap = unsafeResultMap
          }

          public static func makeOrganization(avatarUrl: String, id: GraphQLID) -> Owner {
            return Owner(unsafeResultMap: ["__typename": "Organization", "avatarUrl": avatarUrl, "id": id])
          }

          public static func makeUser(avatarUrl: String, id: GraphQLID) -> Owner {
            return Owner(unsafeResultMap: ["__typename": "User", "avatarUrl": avatarUrl, "id": id])
          }

          public var __typename: String {
            get {
              return resultMap["__typename"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "__typename")
            }
          }

          /// A URL pointing to the owner's public avatar.
          public var avatarUrl: String {
            get {
              return resultMap["avatarUrl"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "avatarUrl")
            }
          }

          public var id: GraphQLID {
            get {
              return resultMap["id"]! as! GraphQLID
            }
            set {
              resultMap.updateValue(newValue, forKey: "id")
            }
          }
        }
      }
    }
  }

  public struct StarredRepository: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["StarredRepositoryConnection"]

    public static var selections: [GraphQLSelection] {
      return [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("edges", type: .list(.object(Edge.selections))),
      ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(edges: [Edge?]? = nil) {
      self.init(unsafeResultMap: ["__typename": "StarredRepositoryConnection", "edges": edges.flatMap { (value: [Edge?]) -> [ResultMap?] in value.map { (value: Edge?) -> ResultMap? in value.flatMap { (value: Edge) -> ResultMap in value.resultMap } } }])
    }

    public var __typename: String {
      get {
        return resultMap["__typename"]! as! String
      }
      set {
        resultMap.updateValue(newValue, forKey: "__typename")
      }
    }

    /// A list of edges.
    public var edges: [Edge?]? {
      get {
        return (resultMap["edges"] as? [ResultMap?]).flatMap { (value: [ResultMap?]) -> [Edge?] in value.map { (value: ResultMap?) -> Edge? in value.flatMap { (value: ResultMap) -> Edge in Edge(unsafeResultMap: value) } } }
      }
      set {
        resultMap.updateValue(newValue.flatMap { (value: [Edge?]) -> [ResultMap?] in value.map { (value: Edge?) -> ResultMap? in value.flatMap { (value: Edge) -> ResultMap in value.resultMap } } }, forKey: "edges")
      }
    }

    public struct Edge: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["StarredRepositoryEdge"]

      public static var selections: [GraphQLSelection] {
        return [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("node", type: .nonNull(.object(Node.selections))),
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(node: Node) {
        self.init(unsafeResultMap: ["__typename": "StarredRepositoryEdge", "node": node.resultMap])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      public var node: Node {
        get {
          return Node(unsafeResultMap: resultMap["node"]! as! ResultMap)
        }
        set {
          resultMap.updateValue(newValue.resultMap, forKey: "node")
        }
      }

      public struct Node: GraphQLSelectionSet {
        public static let possibleTypes: [String] = ["Repository"]

        public static var selections: [GraphQLSelection] {
          return [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("description", type: .scalar(String.self)),
            GraphQLField("languages", arguments: ["first": 1], type: .object(Language.selections)),
            GraphQLField("name", type: .nonNull(.scalar(String.self))),
            GraphQLField("owner", type: .nonNull(.object(Owner.selections))),
            GraphQLField("stargazerCount", type: .nonNull(.scalar(Int.self))),
          ]
        }

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(description: String? = nil, languages: Language? = nil, name: String, owner: Owner, stargazerCount: Int) {
          self.init(unsafeResultMap: ["__typename": "Repository", "description": description, "languages": languages.flatMap { (value: Language) -> ResultMap in value.resultMap }, "name": name, "owner": owner.resultMap, "stargazerCount": stargazerCount])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        /// The description of the repository.
        public var description: String? {
          get {
            return resultMap["description"] as? String
          }
          set {
            resultMap.updateValue(newValue, forKey: "description")
          }
        }

        /// A list containing a breakdown of the language composition of the repository.
        public var languages: Language? {
          get {
            return (resultMap["languages"] as? ResultMap).flatMap { Language(unsafeResultMap: $0) }
          }
          set {
            resultMap.updateValue(newValue?.resultMap, forKey: "languages")
          }
        }

        /// The name of the repository.
        public var name: String {
          get {
            return resultMap["name"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "name")
          }
        }

        /// The User owner of the repository.
        public var owner: Owner {
          get {
            return Owner(unsafeResultMap: resultMap["owner"]! as! ResultMap)
          }
          set {
            resultMap.updateValue(newValue.resultMap, forKey: "owner")
          }
        }

        /// Returns a count of how many stargazers there are on this object
        public var stargazerCount: Int {
          get {
            return resultMap["stargazerCount"]! as! Int
          }
          set {
            resultMap.updateValue(newValue, forKey: "stargazerCount")
          }
        }

        public struct Language: GraphQLSelectionSet {
          public static let possibleTypes: [String] = ["LanguageConnection"]

          public static var selections: [GraphQLSelection] {
            return [
              GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
              GraphQLField("edges", type: .list(.object(Edge.selections))),
            ]
          }

          public private(set) var resultMap: ResultMap

          public init(unsafeResultMap: ResultMap) {
            self.resultMap = unsafeResultMap
          }

          public init(edges: [Edge?]? = nil) {
            self.init(unsafeResultMap: ["__typename": "LanguageConnection", "edges": edges.flatMap { (value: [Edge?]) -> [ResultMap?] in value.map { (value: Edge?) -> ResultMap? in value.flatMap { (value: Edge) -> ResultMap in value.resultMap } } }])
          }

          public var __typename: String {
            get {
              return resultMap["__typename"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "__typename")
            }
          }

          /// A list of edges.
          public var edges: [Edge?]? {
            get {
              return (resultMap["edges"] as? [ResultMap?]).flatMap { (value: [ResultMap?]) -> [Edge?] in value.map { (value: ResultMap?) -> Edge? in value.flatMap { (value: ResultMap) -> Edge in Edge(unsafeResultMap: value) } } }
            }
            set {
              resultMap.updateValue(newValue.flatMap { (value: [Edge?]) -> [ResultMap?] in value.map { (value: Edge?) -> ResultMap? in value.flatMap { (value: Edge) -> ResultMap in value.resultMap } } }, forKey: "edges")
            }
          }

          public struct Edge: GraphQLSelectionSet {
            public static let possibleTypes: [String] = ["LanguageEdge"]

            public static var selections: [GraphQLSelection] {
              return [
                GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
                GraphQLField("node", type: .nonNull(.object(Node.selections))),
              ]
            }

            public private(set) var resultMap: ResultMap

            public init(unsafeResultMap: ResultMap) {
              self.resultMap = unsafeResultMap
            }

            public init(node: Node) {
              self.init(unsafeResultMap: ["__typename": "LanguageEdge", "node": node.resultMap])
            }

            public var __typename: String {
              get {
                return resultMap["__typename"]! as! String
              }
              set {
                resultMap.updateValue(newValue, forKey: "__typename")
              }
            }

            public var node: Node {
              get {
                return Node(unsafeResultMap: resultMap["node"]! as! ResultMap)
              }
              set {
                resultMap.updateValue(newValue.resultMap, forKey: "node")
              }
            }

            public struct Node: GraphQLSelectionSet {
              public static let possibleTypes: [String] = ["Language"]

              public static var selections: [GraphQLSelection] {
                return [
                  GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
                  GraphQLField("name", type: .nonNull(.scalar(String.self))),
                ]
              }

              public private(set) var resultMap: ResultMap

              public init(unsafeResultMap: ResultMap) {
                self.resultMap = unsafeResultMap
              }

              public init(name: String) {
                self.init(unsafeResultMap: ["__typename": "Language", "name": name])
              }

              public var __typename: String {
                get {
                  return resultMap["__typename"]! as! String
                }
                set {
                  resultMap.updateValue(newValue, forKey: "__typename")
                }
              }

              /// The name of the current language.
              public var name: String {
                get {
                  return resultMap["name"]! as! String
                }
                set {
                  resultMap.updateValue(newValue, forKey: "name")
                }
              }
            }
          }
        }

        public struct Owner: GraphQLSelectionSet {
          public static let possibleTypes: [String] = ["Organization", "User"]

          public static var selections: [GraphQLSelection] {
            return [
              GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
              GraphQLField("avatarUrl", type: .nonNull(.scalar(String.self))),
              GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
            ]
          }

          public private(set) var resultMap: ResultMap

          public init(unsafeResultMap: ResultMap) {
            self.resultMap = unsafeResultMap
          }

          public static func makeOrganization(avatarUrl: String, id: GraphQLID) -> Owner {
            return Owner(unsafeResultMap: ["__typename": "Organization", "avatarUrl": avatarUrl, "id": id])
          }

          public static func makeUser(avatarUrl: String, id: GraphQLID) -> Owner {
            return Owner(unsafeResultMap: ["__typename": "User", "avatarUrl": avatarUrl, "id": id])
          }

          public var __typename: String {
            get {
              return resultMap["__typename"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "__typename")
            }
          }

          /// A URL pointing to the owner's public avatar.
          public var avatarUrl: String {
            get {
              return resultMap["avatarUrl"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "avatarUrl")
            }
          }

          public var id: GraphQLID {
            get {
              return resultMap["id"]! as! GraphQLID
            }
            set {
              resultMap.updateValue(newValue, forKey: "id")
            }
          }
        }
      }
    }
  }

  public struct PinnedItem: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["PinnableItemConnection"]

    public static var selections: [GraphQLSelection] {
      return [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("nodes", type: .list(.object(Node.selections))),
      ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(nodes: [Node?]? = nil) {
      self.init(unsafeResultMap: ["__typename": "PinnableItemConnection", "nodes": nodes.flatMap { (value: [Node?]) -> [ResultMap?] in value.map { (value: Node?) -> ResultMap? in value.flatMap { (value: Node) -> ResultMap in value.resultMap } } }])
    }

    public var __typename: String {
      get {
        return resultMap["__typename"]! as! String
      }
      set {
        resultMap.updateValue(newValue, forKey: "__typename")
      }
    }

    /// A list of nodes.
    public var nodes: [Node?]? {
      get {
        return (resultMap["nodes"] as? [ResultMap?]).flatMap { (value: [ResultMap?]) -> [Node?] in value.map { (value: ResultMap?) -> Node? in value.flatMap { (value: ResultMap) -> Node in Node(unsafeResultMap: value) } } }
      }
      set {
        resultMap.updateValue(newValue.flatMap { (value: [Node?]) -> [ResultMap?] in value.map { (value: Node?) -> ResultMap? in value.flatMap { (value: Node) -> ResultMap in value.resultMap } } }, forKey: "nodes")
      }
    }

    public struct Node: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["Gist", "Repository"]

      public static var selections: [GraphQLSelection] {
        return [
          GraphQLTypeCase(
            variants: ["Repository": AsRepository.selections],
            default: [
              GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            ]
          )
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public static func makeGist() -> Node {
        return Node(unsafeResultMap: ["__typename": "Gist"])
      }

      public static func makeRepository(name: String, description: String? = nil, languages: AsRepository.Language? = nil, owner: AsRepository.Owner, stargazerCount: Int) -> Node {
        return Node(unsafeResultMap: ["__typename": "Repository", "name": name, "description": description, "languages": languages.flatMap { (value: AsRepository.Language) -> ResultMap in value.resultMap }, "owner": owner.resultMap, "stargazerCount": stargazerCount])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      public var asRepository: AsRepository? {
        get {
          if !AsRepository.possibleTypes.contains(__typename) { return nil }
          return AsRepository(unsafeResultMap: resultMap)
        }
        set {
          guard let newValue = newValue else { return }
          resultMap = newValue.resultMap
        }
      }

      public struct AsRepository: GraphQLSelectionSet {
        public static let possibleTypes: [String] = ["Repository"]

        public static var selections: [GraphQLSelection] {
          return [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("name", type: .nonNull(.scalar(String.self))),
            GraphQLField("description", type: .scalar(String.self)),
            GraphQLField("languages", arguments: ["first": 1, "orderBy": ["field": "SIZE", "direction": "ASC"]], type: .object(Language.selections)),
            GraphQLField("owner", type: .nonNull(.object(Owner.selections))),
            GraphQLField("stargazerCount", type: .nonNull(.scalar(Int.self))),
          ]
        }

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(name: String, description: String? = nil, languages: Language? = nil, owner: Owner, stargazerCount: Int) {
          self.init(unsafeResultMap: ["__typename": "Repository", "name": name, "description": description, "languages": languages.flatMap { (value: Language) -> ResultMap in value.resultMap }, "owner": owner.resultMap, "stargazerCount": stargazerCount])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        /// The name of the repository.
        public var name: String {
          get {
            return resultMap["name"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "name")
          }
        }

        /// The description of the repository.
        public var description: String? {
          get {
            return resultMap["description"] as? String
          }
          set {
            resultMap.updateValue(newValue, forKey: "description")
          }
        }

        /// A list containing a breakdown of the language composition of the repository.
        public var languages: Language? {
          get {
            return (resultMap["languages"] as? ResultMap).flatMap { Language(unsafeResultMap: $0) }
          }
          set {
            resultMap.updateValue(newValue?.resultMap, forKey: "languages")
          }
        }

        /// The User owner of the repository.
        public var owner: Owner {
          get {
            return Owner(unsafeResultMap: resultMap["owner"]! as! ResultMap)
          }
          set {
            resultMap.updateValue(newValue.resultMap, forKey: "owner")
          }
        }

        /// Returns a count of how many stargazers there are on this object
        public var stargazerCount: Int {
          get {
            return resultMap["stargazerCount"]! as! Int
          }
          set {
            resultMap.updateValue(newValue, forKey: "stargazerCount")
          }
        }

        public struct Language: GraphQLSelectionSet {
          public static let possibleTypes: [String] = ["LanguageConnection"]

          public static var selections: [GraphQLSelection] {
            return [
              GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
              GraphQLField("edges", type: .list(.object(Edge.selections))),
            ]
          }

          public private(set) var resultMap: ResultMap

          public init(unsafeResultMap: ResultMap) {
            self.resultMap = unsafeResultMap
          }

          public init(edges: [Edge?]? = nil) {
            self.init(unsafeResultMap: ["__typename": "LanguageConnection", "edges": edges.flatMap { (value: [Edge?]) -> [ResultMap?] in value.map { (value: Edge?) -> ResultMap? in value.flatMap { (value: Edge) -> ResultMap in value.resultMap } } }])
          }

          public var __typename: String {
            get {
              return resultMap["__typename"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "__typename")
            }
          }

          /// A list of edges.
          public var edges: [Edge?]? {
            get {
              return (resultMap["edges"] as? [ResultMap?]).flatMap { (value: [ResultMap?]) -> [Edge?] in value.map { (value: ResultMap?) -> Edge? in value.flatMap { (value: ResultMap) -> Edge in Edge(unsafeResultMap: value) } } }
            }
            set {
              resultMap.updateValue(newValue.flatMap { (value: [Edge?]) -> [ResultMap?] in value.map { (value: Edge?) -> ResultMap? in value.flatMap { (value: Edge) -> ResultMap in value.resultMap } } }, forKey: "edges")
            }
          }

          public struct Edge: GraphQLSelectionSet {
            public static let possibleTypes: [String] = ["LanguageEdge"]

            public static var selections: [GraphQLSelection] {
              return [
                GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
                GraphQLField("node", type: .nonNull(.object(Node.selections))),
              ]
            }

            public private(set) var resultMap: ResultMap

            public init(unsafeResultMap: ResultMap) {
              self.resultMap = unsafeResultMap
            }

            public init(node: Node) {
              self.init(unsafeResultMap: ["__typename": "LanguageEdge", "node": node.resultMap])
            }

            public var __typename: String {
              get {
                return resultMap["__typename"]! as! String
              }
              set {
                resultMap.updateValue(newValue, forKey: "__typename")
              }
            }

            public var node: Node {
              get {
                return Node(unsafeResultMap: resultMap["node"]! as! ResultMap)
              }
              set {
                resultMap.updateValue(newValue.resultMap, forKey: "node")
              }
            }

            public struct Node: GraphQLSelectionSet {
              public static let possibleTypes: [String] = ["Language"]

              public static var selections: [GraphQLSelection] {
                return [
                  GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
                  GraphQLField("name", type: .nonNull(.scalar(String.self))),
                ]
              }

              public private(set) var resultMap: ResultMap

              public init(unsafeResultMap: ResultMap) {
                self.resultMap = unsafeResultMap
              }

              public init(name: String) {
                self.init(unsafeResultMap: ["__typename": "Language", "name": name])
              }

              public var __typename: String {
                get {
                  return resultMap["__typename"]! as! String
                }
                set {
                  resultMap.updateValue(newValue, forKey: "__typename")
                }
              }

              /// The name of the current language.
              public var name: String {
                get {
                  return resultMap["name"]! as! String
                }
                set {
                  resultMap.updateValue(newValue, forKey: "name")
                }
              }
            }
          }
        }

        public struct Owner: GraphQLSelectionSet {
          public static let possibleTypes: [String] = ["Organization", "User"]

          public static var selections: [GraphQLSelection] {
            return [
              GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
              GraphQLField("avatarUrl", type: .nonNull(.scalar(String.self))),
              GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
            ]
          }

          public private(set) var resultMap: ResultMap

          public init(unsafeResultMap: ResultMap) {
            self.resultMap = unsafeResultMap
          }

          public static func makeOrganization(avatarUrl: String, id: GraphQLID) -> Owner {
            return Owner(unsafeResultMap: ["__typename": "Organization", "avatarUrl": avatarUrl, "id": id])
          }

          public static func makeUser(avatarUrl: String, id: GraphQLID) -> Owner {
            return Owner(unsafeResultMap: ["__typename": "User", "avatarUrl": avatarUrl, "id": id])
          }

          public var __typename: String {
            get {
              return resultMap["__typename"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "__typename")
            }
          }

          /// A URL pointing to the owner's public avatar.
          public var avatarUrl: String {
            get {
              return resultMap["avatarUrl"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "avatarUrl")
            }
          }

          public var id: GraphQLID {
            get {
              return resultMap["id"]! as! GraphQLID
            }
            set {
              resultMap.updateValue(newValue, forKey: "id")
            }
          }
        }
      }
    }
  }
}
