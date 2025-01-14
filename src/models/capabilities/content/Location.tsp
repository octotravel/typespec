import "@typespec/openapi";

import "./LocationType.tsp";
import "./Place.tsp";

namespace Octo;

const LOCATION_TITLE_DOC = "The name of the location, providing a recognizable identifier for customers (e.g., \"Statue of Liberty\"). This field can be null if no name is available.";
const LOCATION_SHORT_DESCRIPTION_DOC = "A brief description of the location, summarizing its significance or role in the product (e.g., \"Historic landmark and popular tourist destination\"). This field can be null if no description is provided.";
const LOCATION_TYPES_DOC = """
  Specifies the roles or purposes of the location within the product. START: The starting point or meeting location for the product or experience. This is where customers are expected to gather before the activity begins.
  REDEMPTION: A location where customers must go to exchange tickets, collect passes, or redeem vouchers before proceeding to the starting point or experience (if applicable).
  ITINERARY_ITEM: A designated stop or location within the itinerary, typically where customers pause or spend time during a moving tour or activity.
  POINT_OF_INTEREST: A notable location or attraction that customers may see or pass by without stopping. Generally used for sightseeing locations.
  ADMISSION_INCLUDED: A location where entry is included in the product price, often highlighting an attraction or event that customers can access as part of the experience.
  END: The final point or drop-off location where the activity concludes.
  """;
const LOCATION_MINUTES_TO_DOC = "The travel time, in minutes, needed to reach this location from the previous one in the itinerary. Useful for building schedules or itineraries. Set to null if travel time is unknown, not relevant, or not required.";
const LOCATION_MINUTES_AT_DOC = "The approximate duration, in minutes, spent at this location. Helps provide clarity on the itinerary or scheduling details. Set to null if the time spent is flexible, unknown, or not applicable.";
const LOCATION_PLACE_DOC = "An object containing detailed geospatial and postal address data for the location.";

const LOCATION_TITLE_EXAMPLE = "";
const LOCATION_SHORT_DESCRIPTION_EXAMPLE = "";
const LOCATION_TYPES_EXAMPLE = #[LocationType.POINT_OF_INTEREST];
const LOCATION_MINUTES_TO_EXAMPLE = null;
const LOCATION_MINUTES_AT_EXAMPLE = null;
const LOCATION_PLACE_EXAMPLE = PLACE_EXAMPLE;

const LOCATION_EXAMPLE = #{
  title: LOCATION_TITLE_EXAMPLE,
  shortDescription: LOCATION_SHORT_DESCRIPTION_EXAMPLE,
  types: LOCATION_TYPES_EXAMPLE,
  minutesTo: LOCATION_MINUTES_TO_EXAMPLE,
  minutesAt: LOCATION_MINUTES_AT_EXAMPLE,
  place: LOCATION_PLACE_EXAMPLE,
};

@example(LOCATION_EXAMPLE)
model Location {
  @doc(LOCATION_TITLE_DOC)
  @example(LOCATION_TITLE_EXAMPLE)
  title: string | null;

  @doc(LOCATION_SHORT_DESCRIPTION_DOC)
  @example(LOCATION_SHORT_DESCRIPTION_EXAMPLE)
  shortDescription: string | null;

  @doc(LOCATION_TYPES_DOC)
  @example(LOCATION_TYPES_EXAMPLE)
  types: LocationType[];

  @doc(LOCATION_MINUTES_TO_DOC)
  @example(LOCATION_MINUTES_TO_EXAMPLE)
  minutesTo: integer | null;

  @doc(LOCATION_MINUTES_AT_DOC)
  @example(LOCATION_MINUTES_AT_EXAMPLE)
  minutesAt: integer | null;

  @doc(LOCATION_PLACE_DOC)
  @example(LOCATION_PLACE_EXAMPLE)
  place: Place;
}
