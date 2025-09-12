import "@typespec/openapi";

import "./Identifiers.tsp";
import "./PostalAddress.tsp";

namespace Octo;

const PLACE_LATITUDE_DOC = "The latitude of the location, expressed in decimal degrees. Negative values represent southern latitudes.";
const PLACE_LONGITUDE_DOC = "The longitude of the location, expressed in decimal degrees. Negative values represent western longitudes.";
const PLACE_POSTAL_ADDRESS_DOC = "Structured postal address details for the location.";
const PLACE_IDENTIFIERS_DOC = "A list of unique identifiers from third-party platforms (e.g., Google Maps, Yelp, Tripadvisor).";
const PLACE_SAME_AS_DOC = "A list of URLs pointing to web pages or social media profiles for the location.";

const PLACE_LATITUDE_EXAMPLE = 55.9533;
const PLACE_LONGITUDE_EXAMPLE = -3.1883;
const PLACE_POSTAL_ADDRESS_EXAMPLE = POSTAL_ADDRESS_EXAMPLE;
const PLACE_IDENTIFIERS_EXAMPLE = IDENTIFIERS_EXAMPLE;
const PLACE_SAME_AS_EXAMPLE = #[];

const PLACE_EXAMPLE = #{
  latitude: PLACE_LATITUDE_EXAMPLE,
  longitude: PLACE_LONGITUDE_EXAMPLE,
  postalAddress: PLACE_POSTAL_ADDRESS_EXAMPLE,
  identifiers: PLACE_IDENTIFIERS_EXAMPLE,
  sameAs: PLACE_SAME_AS_EXAMPLE,
};

@example(PLACE_EXAMPLE)
model Place {
  @doc(PLACE_LATITUDE_DOC)
  @example(PLACE_LATITUDE_EXAMPLE)
  latitude: float;

  @doc(PLACE_LONGITUDE_DOC)
  @example(PLACE_LONGITUDE_EXAMPLE)
  longitude: float;

  @doc(PLACE_POSTAL_ADDRESS_DOC)
  @example(PLACE_POSTAL_ADDRESS_EXAMPLE)
  postalAddress: PostalAddress;

  // TODO: not sure how these should look like
  @doc(PLACE_IDENTIFIERS_DOC)
  @example(PLACE_IDENTIFIERS_EXAMPLE)
  identifiers: Identifiers;

  @doc(PLACE_SAME_AS_DOC)
  @example(PLACE_SAME_AS_EXAMPLE)
  sameAs: string[];
}
