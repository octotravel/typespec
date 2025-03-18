import "@typespec/openapi";

namespace Octo;

const IDENTIFIER_TYPE_DOC = """
  Specifies the type or source of the identifier for the location. This field defines the platform or system where the identifier is valid, allowing for seamless integration with third-party systems or mapping platforms. Common examples include:
  googlePlaceId: A unique identifier for locations on Google Maps.
  applePlaceId: A unique identifier for locations on Apple Maps.
  tripadvisorLocationId: A unique identifier for listings on TripAdvisor.
  yelpPlaceId: A unique identifier for locations on Yelp.
  facebookPlaceId: A unique identifier for places on Facebook.
  foursquarePlaceId: A unique identifier for venues on Foursquare.
  baiduPlaceId: A unique identifier for locations on Baidu Maps.
  amapPlaceId: A unique identifier for locations on Amap (China-based mapping platform).
  """;
const IDENTIFIER_VALUE_DOC = "Represents the value of the location's identifier corresponding to the platform or system specified in <identifierType>. This value is a unique, platform-specific identifier that allows external systems to reference the location accurately.";

const IDENTIFIER_TYPE_EXAMPLE = "";
const IDENTIFIER_VALUE_EXAMPLE = "";

const IDENTIFIER_EXAMPLE = #{
  type: IDENTIFIER_TYPE_EXAMPLE,
  value: IDENTIFIER_VALUE_EXAMPLE,
};

@example(IDENTIFIER_EXAMPLE)
model Identifier {
  @doc(IDENTIFIER_TYPE_DOC)
  @example(IDENTIFIER_TYPE_EXAMPLE)
  type: string;

  @doc(IDENTIFIER_VALUE_DOC)
  @example(IDENTIFIER_VALUE_EXAMPLE)
  value: string;
}
