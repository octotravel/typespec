import "@typespec/openapi";

import "./ItineraryItemType.tsp";
import "../../../../src/models/DurationUnit.tsp";
import "../../../../src/models/capabilities/content/FAQ.tsp";

namespace Ventrata;
using OpenAPI;
using Octo;

const ITINERARY_ITEM_NAME_EXAMPLE = "";
const ITINERARY_ITEM_TYPE_EXAMPLE = ItineraryItemType.POI;
const ITINERARY_ITEM_DESCRIPTION_EXAMPLE = "";
const ITINERARY_ITEM_ADDRESS_EXAMPLE = "";
const ITINERARY_ITEM_GOOGLE_PLACE_ID_EXAMPLE = "";
const ITINERARY_ITEM_LATITUDE_EXAMPLE = 0;
const ITINERARY_ITEM_LONGITUDE_EXAMPLE = 0;
const ITINERARY_ITEM_TRAVEL_TIME_EXAMPLE = "3 hours";
const ITINERARY_ITEM_TRAVEL_TIME_AMOUNT_EXAMPLE = 3;
const ITINERARY_ITEM_TRAVEL_TIME_UNIT_EXAMPLE = DurationUnit.HOUR;
const ITINERARY_ITEM_DURATION_EXAMPLE = "3 hours";
const ITINERARY_ITEM_DURATION_AMOUNT_EXAMPLE = 3;
const ITINERARY_ITEM_DURATION_UNIT_EXAMPLE = DurationUnit.HOUR;

const ITINERARY_ITEM_EXAMPLE = #{
  name: ITINERARY_ITEM_NAME_EXAMPLE,
  type: ITINERARY_ITEM_TYPE_EXAMPLE,
  description: ITINERARY_ITEM_DESCRIPTION_EXAMPLE,
  address: ITINERARY_ITEM_ADDRESS_EXAMPLE,
  googlePlaceId: ITINERARY_ITEM_GOOGLE_PLACE_ID_EXAMPLE,
  latitude: ITINERARY_ITEM_LATITUDE_EXAMPLE,
  longitude: ITINERARY_ITEM_LONGITUDE_EXAMPLE,
  travelTime: ITINERARY_ITEM_TRAVEL_TIME_EXAMPLE,
  travelTimeAmount: ITINERARY_ITEM_TRAVEL_TIME_AMOUNT_EXAMPLE,
  travelTimeUnit: ITINERARY_ITEM_TRAVEL_TIME_UNIT_EXAMPLE,
  duration: ITINERARY_ITEM_DURATION_EXAMPLE,
  durationAmount: ITINERARY_ITEM_DURATION_AMOUNT_EXAMPLE,
  durationUnit: ITINERARY_ITEM_DURATION_UNIT_EXAMPLE,
};

@example(ITINERARY_ITEM_EXAMPLE)
model ItineraryItem {
  /**
   * The name of the itinerary.
   */
  @example(ITINERARY_ITEM_NAME_EXAMPLE)
  name: string;

  /**
   * The type of the itinerary.
   * Possible values are `START`, `POI`, `END`, `EVENT`. The default is `START`.
   *
   */
  @example(ITINERARY_ITEM_TYPE_EXAMPLE)
  type: ItineraryItemType;

  /**
   * The description of the itinerary.
   */
  @example(ITINERARY_ITEM_DESCRIPTION_EXAMPLE)
  description: string | null;

  /**
   * The address of the itinerary.
   */
  @example(ITINERARY_ITEM_ADDRESS_EXAMPLE)
  address: string | null;

  /**
   * The Google Place ID of the itinerary.
   */
  @example(ITINERARY_ITEM_GOOGLE_PLACE_ID_EXAMPLE)
  googlePlaceId: string | null;

  /**
   * The latitude of the itinerary.
   */
  @example(ITINERARY_ITEM_LATITUDE_EXAMPLE)
  latitude: numeric | null;

  /**
   * The longitude of the itinerary.
   */
  @example(ITINERARY_ITEM_LONGITUDE_EXAMPLE)
  longitude: numeric | null;

  /**
   * The travel time of the itinerary.
   */
  @example(ITINERARY_ITEM_TRAVEL_TIME_EXAMPLE)
  travelTime: string | null;

  /**
   * The travel time amount of the itinerary.
   */
  @example(ITINERARY_ITEM_TRAVEL_TIME_AMOUNT_EXAMPLE)
  @extension("x-go-type", "float64")
  travelTimeAmount: numeric | null;

  /**
   * The travel time unit of the itinerary.
   */
  @example(ITINERARY_ITEM_TRAVEL_TIME_UNIT_EXAMPLE)
  travelTimeUnit: DurationUnit | null;

  /**
   * Human readable duration of the option. Duration starts to count on redemption.
   * This field can be hidden by `hide_duration`.
   *
   */
  @example(ITINERARY_ITEM_DURATION_EXAMPLE)
  duration: string | null;

  /**
   * The duration amount of the option.
   * This field can be hidden by `hide_duration`.
   *
   */
  @example(ITINERARY_ITEM_DURATION_AMOUNT_EXAMPLE)
  @extension("x-go-type", "float64")
  durationAmount: numeric;

  /**
   * The duration unit. Possible values are `hour`, `minute`, `day`.
   * This field can be hidden by `hide_duration`.
   *
   */
  @example(ITINERARY_ITEM_DURATION_UNIT_EXAMPLE)
  durationUnit: DurationUnit;
}
