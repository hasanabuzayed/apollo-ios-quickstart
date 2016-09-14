//  This file was automatically generated and should not be edited.

import Apollo

public enum Episode: String {
  case newhope = "NEWHOPE"
  case empire = "EMPIRE"
  case jedi = "JEDI"
}

extension Episode: JSONDecodable, JSONEncodable {}

public enum LengthUnit: String {
  case meter = "METER"
  case foot = "FOOT"
}

extension LengthUnit: JSONDecodable, JSONEncodable {}

public class HeroAndFriendsNamesQuery: GraphQLQuery {
  public let episode: Episode?
  
  public init(episode: Episode?) {
    self.episode = episode
  }
  
  public let operationDefinition =
    "query HeroAndFriendsNames($episode: Episode) {" +
    "  hero(episode: $episode) {" +
    "    name" +
    "    friends {" +
    "      name" +
    "    }" +
    "  }" +
    "}"
  
  public var variables: GraphQLMap? {
    return ["episode": episode]
  }
  
  public struct Data: GraphQLMapConvertible {
    public let hero: Hero?
    
    public init(map: GraphQLMap) throws {
      hero = try map.value(forKey: "hero")
    }
    
    public struct Hero: GraphQLMapConvertible {
      public let name: String
      public let friends: [Friends?]?
      
      public init(map: GraphQLMap) throws {
        name = try map.value(forKey: "name")
        friends = try map.list(forKey: "friends")
      }
      
      public struct Friends: GraphQLMapConvertible {
        public let name: String
        
        public init(map: GraphQLMap) throws {
          name = try map.value(forKey: "name")
        }
      }
    }
  }
}

public class HeroNameQuery: GraphQLQuery {
  public init() {}
  
  public let operationDefinition =
    "query HeroName {" +
    "  hero {" +
    "    name" +
    "  }" +
    "}"
  
  public struct Data: GraphQLMapConvertible {
    public let hero: Hero?
    
    public init(map: GraphQLMap) throws {
      hero = try map.value(forKey: "hero")
    }
    
    public struct Hero: GraphQLMapConvertible {
      public let name: String
      
      public init(map: GraphQLMap) throws {
        name = try map.value(forKey: "name")
      }
    }
  }
}