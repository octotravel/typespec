import "@typespec/openapi";
using OpenAPI;

namespace Ventrata;

const PICKUP_POINT_ID_DOC = "Unique identifier for the pickup point.";
const PICKUP_POINT_NAME_DOC = "Name of the pickup point.";
const PICKUP_POINT_DIRECTIONS_DOC = "Optional directions to reach the pickup point.";
const PICKUP_POINT_ADDRESS_DOC = "Optional address of the pickup point.";
const PICKUP_POINT_LATITUDE_DOC = "Latitude coordinate of the pickup point.";
const PICKUP_POINT_LONGITUDE_DOC = "Longitude coordinate of the pickup point.";
const PICKUP_POINT_LOCAL_DATE_TIME_DOC = "Local date and time of the pickup point.";
const PICKUP_POINT_LOCAL_DATE_TIME_TO_DOC = "Local date and time of the pickup point.";
const PICKUP_POINT_GOOGLE_PLACE_ID_DOC = "Google Place ID associated with the pickup point.";
const PICKUP_POINT_STREET_DOC = "Street address of the pickup point.";
const PICKUP_POINT_POSTAL_CODE_DOC = "Postal code of the pickup point location.";
const PICKUP_POINT_LOCALITY_DOC = "Locality (city or town) of the pickup point.";
const PICKUP_POINT_REGION_DOC = "Region (e.g., state or province) of the pickup point.";
const PICKUP_POINT_STATE_DOC = "State of the pickup point.";
const PICKUP_POINT_COUNTRY_DOC = "Country of the pickup point.";

const PICKUP_POINT_ID_EXAMPLE = "";
const PICKUP_POINT_NAME_EXAMPLE = "";
const PICKUP_POINT_DIRECTIONS_EXAMPLE = "";
const PICKUP_POINT_ADDRESS_EXAMPLE = "";
const PICKUP_POINT_LATITUDE_EXAMPLE = 0;
const PICKUP_POINT_LONGITUDE_EXAMPLE = 0;
const PICKUP_POINT_LOCAL_DATE_TIME_EXAMPLE = "";
const PICKUP_POINT_LOCAL_DATE_TIME_TO_EXAMPLE = "";
const PICKUP_POINT_GOOGLE_PLACE_ID_EXAMPLE = "";
const PICKUP_POINT_STREET_EXAMPLE = "";
const PICKUP_POINT_POSTAL_CODE_EXAMPLE = "";
const PICKUP_POINT_LOCALITY_EXAMPLE = "";
const PICKUP_POINT_REGION_EXAMPLE = "";
const PICKUP_POINT_STATE_EXAMPLE = "";
const PICKUP_POINT_COUNTRY_EXAMPLE = "";

const PICKUP_POINT_EXAMPLE = #{
  id: PICKUP_POINT_ID_EXAMPLE,
  name: PICKUP_POINT_NAME_EXAMPLE,
  directions: PICKUP_POINT_DIRECTIONS_EXAMPLE,
  address: PICKUP_POINT_ADDRESS_EXAMPLE,
  latitude: PICKUP_POINT_LATITUDE_EXAMPLE,
  longitude: PICKUP_POINT_LONGITUDE_EXAMPLE,
  localDateTime: PICKUP_POINT_LOCAL_DATE_TIME_EXAMPLE,
  localDateTimeTo: PICKUP_POINT_LOCAL_DATE_TIME_TO_EXAMPLE,
  googlePlaceId: PICKUP_POINT_GOOGLE_PLACE_ID_EXAMPLE,
  street: PICKUP_POINT_STREET_EXAMPLE,
  postalCode: PICKUP_POINT_POSTAL_CODE_EXAMPLE,
  locality: PICKUP_POINT_LOCALITY_EXAMPLE,
  region: PICKUP_POINT_REGION_EXAMPLE,
  state: PICKUP_POINT_STATE_EXAMPLE,
  country: PICKUP_POINT_COUNTRY_EXAMPLE,
};

@example(PICKUP_POINT_EXAMPLE)
model PickupPoint {
  @doc(PICKUP_POINT_ID_DOC)
  @example(PICKUP_POINT_ID_EXAMPLE)
  @format("uuid")
  id: string;

  @doc(PICKUP_POINT_NAME_DOC)
  @example(PICKUP_POINT_NAME_EXAMPLE)
  name: string;

  @doc(PICKUP_POINT_DIRECTIONS_DOC)
  @example(PICKUP_POINT_DIRECTIONS_EXAMPLE)
  directions: string | null;

  @doc(PICKUP_POINT_ADDRESS_DOC)
  @example(PICKUP_POINT_ADDRESS_EXAMPLE)
  address: string | null;

  @doc(PICKUP_POINT_LATITUDE_DOC)
  @example(PICKUP_POINT_LATITUDE_EXAMPLE)
  latitude: float32 | null;

  @doc(PICKUP_POINT_LONGITUDE_DOC)
  @example(PICKUP_POINT_LONGITUDE_EXAMPLE)
  longitude: float32 | null;

  @doc(PICKUP_POINT_LOCAL_DATE_TIME_DOC)
  @example(PICKUP_POINT_LOCAL_DATE_TIME_EXAMPLE)
  @extension("x-go-type", "types.TimeRFC3339")
  @extension(
    "x-go-type-import",
    {
      path: "ventrata-octo-api/pkg/types",
    }
  )
  localDateTime: string | null;

  @doc(PICKUP_POINT_LOCAL_DATE_TIME_TO_DOC)
  @example(PICKUP_POINT_LOCAL_DATE_TIME_TO_EXAMPLE)
  @extension("x-go-type", "types.TimeRFC3339")
  @extension(
    "x-go-type-import",
    {
      path: "ventrata-octo-api/pkg/types",
    }
  )
  localDateTimeTo: string | null;

  @doc(PICKUP_POINT_GOOGLE_PLACE_ID_DOC)
  @example(PICKUP_POINT_GOOGLE_PLACE_ID_EXAMPLE)
  googlePlaceId: string | null;

  @doc(PICKUP_POINT_STREET_DOC)
  @example(PICKUP_POINT_STREET_EXAMPLE)
  street: string | null;

  @doc(PICKUP_POINT_POSTAL_CODE_DOC)
  @example(PICKUP_POINT_POSTAL_CODE_EXAMPLE)
  postalCode: string | null;

  @doc(PICKUP_POINT_LOCALITY_DOC)
  @example(PICKUP_POINT_LOCALITY_EXAMPLE)
  locality: string | null;

  @doc(PICKUP_POINT_REGION_DOC)
  @example(PICKUP_POINT_REGION_EXAMPLE)
  region: string | null;

  @doc(PICKUP_POINT_STATE_DOC)
  @example(PICKUP_POINT_STATE_EXAMPLE)
  state: string | null;

  @doc(PICKUP_POINT_COUNTRY_DOC)
  @example(PICKUP_POINT_COUNTRY_EXAMPLE)
  country: string | null;
}
