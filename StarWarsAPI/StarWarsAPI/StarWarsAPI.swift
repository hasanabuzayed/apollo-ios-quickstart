//  This file was automatically generated and should not be edited.

import Apollo

/// The episodes in the Star Wars trilogy
public enum Episode: String {
  case newhope = "NEWHOPE" /// Star Wars Episode IV: A New Hope, released in 1977.
  case empire = "EMPIRE" /// Star Wars Episode V: The Empire Strikes Back, released in 1980.
  case jedi = "JEDI" /// Star Wars Episode VI: Return of the Jedi, released in 1983.
}

extension Episode: JSONDecodable, JSONEncodable {}

public final class HeroAndFriendsQuery: GraphQLQuery {
  public static let operationDefinition =
    "query HeroAndFriends($episode: Episode) {" +
    "  hero(episode: $episode) {" +
    "    __typename" +
    "    name" +
    "    appearsIn" +
    "    ...HeroDetails" +
    "    friends {" +
    "      __typename" +
    "      name" +
    "      ...HeroDetails" +
    "    }" +
    "  }" +
    "}"
  public static let queryDocument = operationDefinition.appending(HeroDetails.fragmentDefinition)

  public let episode: Episode?

  public init(episode: Episode? = nil) {
    self.episode = episode
  }

  public var variables: GraphQLMap? {
    return ["episode": episode]
  }

  public struct Data: GraphQLMapConvertible {
    public let hero: Hero?

    public init(map: GraphQLMap) throws {
      hero = try map.optionalValue(forKey: "hero")
    }

    public struct Hero: GraphQLMapConvertible {
      public let __typename: String
      public let name: String
      public let appearsIn: [Episode?]
      public let friends: [Friend?]?

      public let fragments: Fragments

      public init(map: GraphQLMap) throws {
        __typename = try map.value(forKey: "__typename")
        name = try map.value(forKey: "name")
        appearsIn = try map.list(forKey: "appearsIn")
        friends = try map.optionalList(forKey: "friends")

        let heroDetails = try HeroDetails(map: map)
        fragments = Fragments(heroDetails: heroDetails)
      }

      public struct Fragments {
        public let heroDetails: HeroDetails
      }

      public struct Friend: GraphQLMapConvertible {
        public let __typename: String
        public let name: String

        public let fragments: Fragments

        public init(map: GraphQLMap) throws {
          __typename = try map.value(forKey: "__typename")
          name = try map.value(forKey: "name")

          let heroDetails = try HeroDetails(map: map)
          fragments = Fragments(heroDetails: heroDetails)
        }

        public struct Fragments {
          public let heroDetails: HeroDetails
        }
      }
    }
  }
}

public final class HeroNameQuery: GraphQLQuery {
  public static let operationDefinition =
    "query HeroName {" +
    "  hero {" +
    "    __typename" +
    "    name" +
    "  }" +
    "}"

  public struct Data: GraphQLMapConvertible {
    public let hero: Hero?

    public init(map: GraphQLMap) throws {
      hero = try map.optionalValue(forKey: "hero")
    }

    public struct Hero: GraphQLMapConvertible {
      public let __typename: String
      public let name: String

      public init(map: GraphQLMap) throws {
        __typename = try map.value(forKey: "__typename")
        name = try map.value(forKey: "name")
      }
    }
  }
}

public final class TwoHeroesQuery: GraphQLQuery {
  public static let operationDefinition =
    "query TwoHeroes {" +
    "  r2: hero {" +
    "    __typename" +
    "    name" +
    "  }" +
    "  luke: hero(episode: EMPIRE) {" +
    "    __typename" +
    "    name" +
    "  }" +
    "}"

  public struct Data: GraphQLMapConvertible {
    public let r2: R2?
    public let luke: Luke?

    public init(map: GraphQLMap) throws {
      r2 = try map.optionalValue(forKey: "r2")
      luke = try map.optionalValue(forKey: "luke")
    }

    public struct R2: GraphQLMapConvertible {
      public let __typename: String
      public let name: String

      public init(map: GraphQLMap) throws {
        __typename = try map.value(forKey: "__typename")
        name = try map.value(forKey: "name")
      }
    }

    public struct Luke: GraphQLMapConvertible {
      public let __typename: String
      public let name: String

      public init(map: GraphQLMap) throws {
        __typename = try map.value(forKey: "__typename")
        name = try map.value(forKey: "name")
      }
    }
  }
}

public struct HeroDetails: GraphQLNamedFragment {
  public static let fragmentDefinition =
    "fragment HeroDetails on Character {" +
    "  __typename" +
    "  name" +
    "  appearsIn" +
    "  ... on Droid {" +
    "    primaryFunction" +
    "  }" +
    "  ... on Human {" +
    "    height" +
    "  }" +
    "}"

  public static let possibleTypes = ["Human", "Droid"]

  public let __typename: String
  public let name: String
  public let appearsIn: [Episode?]

  public let asDroid: AsDroid?
  public let asHuman: AsHuman?

  public init(map: GraphQLMap) throws {
    __typename = try map.value(forKey: "__typename")
    name = try map.value(forKey: "name")
    appearsIn = try map.list(forKey: "appearsIn")

    asDroid = try AsDroid(map: map, ifTypeMatches: __typename)
    asHuman = try AsHuman(map: map, ifTypeMatches: __typename)
  }

  public struct AsDroid: GraphQLConditionalFragment {
    public static let possibleTypes = ["Droid"]

    public let __typename = "Droid"
    public let name: String
    public let appearsIn: [Episode?]
    public let primaryFunction: String?

    public init(map: GraphQLMap) throws {
      name = try map.value(forKey: "name")
      appearsIn = try map.list(forKey: "appearsIn")
      primaryFunction = try map.optionalValue(forKey: "primaryFunction")
    }
  }

  public struct AsHuman: GraphQLConditionalFragment {
    public static let possibleTypes = ["Human"]

    public let __typename = "Human"
    public let name: String
    public let appearsIn: [Episode?]
    public let height: Float?

    public init(map: GraphQLMap) throws {
      name = try map.value(forKey: "name")
      appearsIn = try map.list(forKey: "appearsIn")
      height = try map.optionalValue(forKey: "height")
    }
  }
}