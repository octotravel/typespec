import "@typespec/openapi";

namespace Octo;

const IDENTIFIERS_DOC = """
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

const IDENTIFIER_GOOGLE_PLACE_ID_DOC = "A unique identifier for locations on Google Maps.";
const IDENTIFIER_APPLE_PLACE_ID_DOC = "A unique identifier for locations on Apple Maps.";
const IDENTIFIER_TRIPADVISOR_LOCATION_ID_DOC = "A unique identifier for listings on TripAdvisor.";
const IDENTIFIER_YELP_PLACE_ID_DOC = "A unique identifier for locations on Yelp.";
const IDENTIFIER_FACEBOOK_PLACE_ID_DOC = "A unique identifier for places on Facebook.";
const IDENTIFIER_FOURSQUARE_PLACE_ID_DOC = "A unique identifier for venues on Foursquare.";
const IDENTIFIER_BAIDU_PLACE_ID_DOC = "A unique identifier for locations on Baidu Maps.";
const IDENTIFIER_AMAP_PLACE_ID_DOC = "A unique identifier for locations on Amap (China-based mapping platform).";

const IDENTIFIER_GOOGLE_PLACE_ID_EXAMPLE = null;
const IDENTIFIER_APPLE_PLACE_ID_EXAMPLE = null;
const IDENTIFIER_TRIPADVISOR_LOCATION_ID_EXAMPLE = null;
const IDENTIFIER_YELP_PLACE_ID_EXAMPLE = null;
const IDENTIFIER_FACEBOOK_PLACE_ID_EXAMPLE = null;
const IDENTIFIER_FOURSQUARE_PLACE_ID_EXAMPLE = null;
const IDENTIFIER_BAIDU_PLACE_ID_EXAMPLE = null;
const IDENTIFIER_AMAP_PLACE_ID_EXAMPLE = null;

const IDENTIFIERS_EXAMPLE = #{
  googlePlaceId: IDENTIFIER_GOOGLE_PLACE_ID_EXAMPLE,
  applePlaceId: IDENTIFIER_APPLE_PLACE_ID_EXAMPLE,
  tripadvisorLocationId: IDENTIFIER_TRIPADVISOR_LOCATION_ID_EXAMPLE,
  yelpPlaceId: IDENTIFIER_YELP_PLACE_ID_EXAMPLE,
  facebookPlaceId: IDENTIFIER_FACEBOOK_PLACE_ID_EXAMPLE,
  foursquarePlaceId: IDENTIFIER_FOURSQUARE_PLACE_ID_EXAMPLE,
  baiduPlaceId: IDENTIFIER_BAIDU_PLACE_ID_EXAMPLE,
  amapPlaceId: IDENTIFIER_AMAP_PLACE_ID_EXAMPLE,
};

@doc(IDENTIFIERS_DOC)
@example(IDENTIFIERS_EXAMPLE)
model Identifiers {
  googlePlaceId: string | null;
  applePlaceId: string | null;
  tripadvisorLocationId: string | null;
  yelpPlaceId: string | null;
  facebookPlaceId: string | null;
  foursquarePlaceId: string | null;
  baiduPlaceId: string | null;
  amapPlaceId: string | null;
}
