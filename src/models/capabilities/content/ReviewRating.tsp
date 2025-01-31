import "@typespec/openapi";
import "./ExternalPlatform.tsp";

namespace Octo;

const REVIEW_RATING_COUNT_DOC = "This field contains a list of rating objects, each representing a specific rating associated with the option. Ratings help resellers and customers evaluate the option’s quality and popularity based on user feedback. Each rating object includes the following details:";
const REVIEW_RATING_VALUE_DOC = "The total number of ratings received, represented as an integer. This count provides insight into how many users have submitted ratings for the option.";
const REVIEW_RATING_SCALE_DOC = "The average rating value, calculated from all submitted ratings. This value is typically a floating-point number that represents the mean score on the rating scale (e.g., 4.5 on a 5-star scale).";
const REVIEW_RATING_URL_DOC = "The maximum possible value on the rating scale, which defines the upper limit (e.g., 5 for a 5-star system or 10 for a 10-point system).";
const REVIEW_RATING_EXTERNAL_PLATFORM_DOC = """
  The platform from which the rating originates. Most common platforms include:
  GOOGLE: Ratings sourced from Google, often through Google Maps or the Google Business Profile.
  YELP: Ratings from Yelp, a platform focused on user reviews for businesses, restaurants, and attractions.
  TRIPADVISOR: Ratings from Tripadvisor, a well-known travel and review platform for accommodations, tours, and activities.
  FACEBOOK: Ratings or recommendations from a business or location's Facebook page.
  VIATOR: Ratings sourced from Viator, a platform specializing in tours and activities.
  GETYOURGUIDE: Ratings from GetYourGuide, another platform focused on booking and reviewing tours and activities.
  OTHER: A general category for platforms not explicitly listed, used for custom or less common sources of ratings.
  """;

const REVIEW_RATING_COUNT_EXAMPLE = 0;
const REVIEW_RATING_VALUE_EXAMPLE = 1;
const REVIEW_RATING_SCALE_EXAMPLE = 0;
const REVIEW_RATING_URL_EXAMPLE = "";
const REVIEW_RATING_EXTERNAL_PLATFORM_EXAMPLE = ExternalPLatform.GOOGLE;

const REVIEW_RATING_EXAMPLE = #{
  count: REVIEW_RATING_COUNT_EXAMPLE,
  value: REVIEW_RATING_VALUE_EXAMPLE,
  scale: REVIEW_RATING_SCALE_EXAMPLE,
  url: REVIEW_RATING_URL_EXAMPLE,
  externalPlatform: REVIEW_RATING_EXTERNAL_PLATFORM_EXAMPLE,
};

@example(REVIEW_RATING_EXAMPLE)
model ReviewRating {
  @doc(REVIEW_RATING_COUNT_DOC)
  @example(REVIEW_RATING_COUNT_EXAMPLE)
  @TypeSpec.OpenAPI.extension(
    "x-capability-data",
    {
      capability: "octo/content",
      required: false,
    }
  )
  count?: integer;

  @doc(REVIEW_RATING_VALUE_DOC)
  @example(REVIEW_RATING_VALUE_EXAMPLE)
  @TypeSpec.OpenAPI.extension(
    "x-capability-data",
    {
      capability: "octo/content",
      required: false,
    }
  )
  value?: float;

  @doc(REVIEW_RATING_SCALE_DOC)
  @example(REVIEW_RATING_SCALE_EXAMPLE)
  @TypeSpec.OpenAPI.extension(
    "x-capability-data",
    {
      capability: "octo/content",
      required: false,
    }
  )
  scale?: integer;

  @doc(REVIEW_RATING_URL_DOC)
  @example(REVIEW_RATING_URL_EXAMPLE)
  @format("uri")
  @TypeSpec.OpenAPI.extension(
    "x-capability-data",
    {
      capability: "octo/content",
      required: false,
    }
  )
  url?: url;

  @doc(REVIEW_RATING_EXTERNAL_PLATFORM_DOC)
  @example(REVIEW_RATING_EXTERNAL_PLATFORM_EXAMPLE)
  @TypeSpec.OpenAPI.extension(
    "x-capability-data",
    {
      capability: "octo/content",
      required: false,
    }
  )
  externalPlatform?: ExternalPLatform | null;
}
