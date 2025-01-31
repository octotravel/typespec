import "@typespec/openapi";

import "./Point.tsp";
import "./ItineraryItem.tsp";
import "../../../../src/models/DurationUnit.tsp";
import "../../../../src/models/capabilities/content/FAQ.tsp";

namespace Ventrata;
using OpenAPI;
using Octo;

const OPTION_CONTENT_TITLE_EXAMPLE = "";
const OPTION_CONTENT_SUBTITLE_EXAMPLE = null;
const OPTION_CONTENT_LANGUAGE_EXAMPLE = "";
const OPTION_CONTENT_SHORT_DESCRIPTION_EXAMPLE = null;
const OPTION_CONTENT_DURATION_EXAMPLE = "3 hours";
const OPTION_CONTENT_DURATION_AMOUNT_EXAMPLE = 3;
const OPTION_CONTENT_DURATION_UNIT_EXAMPLE = DurationUnit.HOUR;
const OPTION_CONTENT_COVER_IMAGE_URL_EXAMPLE = null;
const OPTION_CONTENT_ITINERARY_EXAMPLE = #[];
const OPTION_CONTENT_FROM_POINT_EXAMPLE = null;
const OPTION_CONTENT_TO_POINT_EXAMPLE = null;

const OPTION_CONTENT_EXAMPLE = #{
  title: OPTION_CONTENT_TITLE_EXAMPLE,
  subtitle: OPTION_CONTENT_SUBTITLE_EXAMPLE,
  language: OPTION_CONTENT_LANGUAGE_EXAMPLE,
  shortDescription: OPTION_CONTENT_SHORT_DESCRIPTION_EXAMPLE,
  duration: OPTION_CONTENT_DURATION_EXAMPLE,
  durationAmount: OPTION_CONTENT_DURATION_AMOUNT_EXAMPLE,
  durationUnit: OPTION_CONTENT_DURATION_UNIT_EXAMPLE,
  coverImageUrl: OPTION_CONTENT_COVER_IMAGE_URL_EXAMPLE,
  itinerary: OPTION_CONTENT_ITINERARY_EXAMPLE,
  fromPoint: OPTION_CONTENT_FROM_POINT_EXAMPLE,
  toPoint: OPTION_CONTENT_TO_POINT_EXAMPLE,
};

@example(OPTION_CONTENT_EXAMPLE)
model OptionContent {
  /**
   * The title of the option. Only present when ventrata/content capability is requested.
   */
  @example(OPTION_CONTENT_TITLE_EXAMPLE)
  @extension(
    "x-capability-data",
    {
      capability: "ventrata/content",
      required: true,
    }
  )
  @extension(
    "x-oapi-codegen-extra-tags",
    {
      capability: "ventrata/content",
      required: true,
    }
  )
  title?: string;

  /**
   * The subtitle of the option. Only present when ventrata/content capability is requested.
   */
  @example(OPTION_CONTENT_SUBTITLE_EXAMPLE)
  @extension(
    "x-capability-data",
    {
      capability: "ventrata/content",
      required: true,
    }
  )
  @extension(
    "x-oapi-codegen-extra-tags",
    {
      capability: "ventrata/content",
      required: true,
    }
  )
  subtitle?: string | null;

  /**
   * The language of the option. Only present when ventrata/content capability is requested.
   */
  @example(OPTION_CONTENT_LANGUAGE_EXAMPLE)
  @extension(
    "x-capability-data",
    {
      capability: "ventrata/content",
      required: true,
    }
  )
  @extension(
    "x-oapi-codegen-extra-tags",
    {
      capability: "ventrata/content",
      required: true,
    }
  )
  language?: string;

  /**
   * The description of the option. Only present when ventrata/content capability is requested.
   */
  @example(OPTION_CONTENT_SHORT_DESCRIPTION_EXAMPLE)
  @extension(
    "x-capability-data",
    {
      capability: "ventrata/content",
      required: true,
    }
  )
  @extension(
    "x-oapi-codegen-extra-tags",
    {
      capability: "ventrata/content",
      required: true,
    }
  )
  shortDescription?: string | null;

  /**
   * Human readable duration of the option. Duration starts to count on redemption.
   * This field can be hidden by `hide_duration`.
   * Only present when ventrata/content capability is requested.
   *
   */
  @example(OPTION_CONTENT_DURATION_EXAMPLE)
  @extension(
    "x-capability-data",
    {
      capability: "ventrata/content",
      required: true,
    }
  )
  @extension(
    "x-oapi-codegen-extra-tags",
    {
      capability: "ventrata/content",
      required: true,
    }
  )
  duration?: string;

  /**
   * The duration amount of the option.
   * This field can be hidden by `hide_duration`.
   * Only present when ventrata/content capability is requested.
   *
   */
  @example(OPTION_CONTENT_DURATION_AMOUNT_EXAMPLE)
  @extension(
    "x-capability-data",
    {
      capability: "ventrata/content",
      required: true,
    }
  )
  @extension(
    "x-oapi-codegen-extra-tags",
    {
      capability: "ventrata/content",
      required: true,
    }
  )
  @extension("x-go-type", "float64")
  durationAmount?: numeric;

  /**
   * The duration unit. Possible values are `hour`, `minute`, `day`.
   * This field can be hidden by `hide_duration`.
   * Only present when ventrata/content capability is requested.
   *
   */
  @example(OPTION_CONTENT_DURATION_UNIT_EXAMPLE)
  @extension(
    "x-capability-data",
    {
      capability: "ventrata/content",
      required: true,
    }
  )
  @extension(
    "x-oapi-codegen-extra-tags",
    {
      capability: "ventrata/content",
      required: true,
    }
  )
  durationUnit?: DurationUnit;

  /**
   * The cover image URL of the option. Only present when ventrata/content capability is requested.
   */
  @example(OPTION_CONTENT_COVER_IMAGE_URL_EXAMPLE)
  @extension(
    "x-capability-data",
    {
      capability: "ventrata/content",
      required: true,
    }
  )
  @extension(
    "x-oapi-codegen-extra-tags",
    {
      capability: "ventrata/content",
      required: true,
    }
  )
  coverImageUrl?: url | null;

  /**
   * The itinerary of the option. Only present when ventrata/content capability is requested.
   */
  @example(OPTION_CONTENT_ITINERARY_EXAMPLE)
  @extension(
    "x-capability-data",
    {
      capability: "ventrata/content",
      required: true,
    }
  )
  @extension(
    "x-oapi-codegen-extra-tags",
    {
      capability: "ventrata/content",
      required: true,
    }
  )
  itinerary?: ItineraryItem[] | null;

  /**
   * The origin point of the option. Only present when ventrata/content capability is requested.
   */
  @example(OPTION_CONTENT_FROM_POINT_EXAMPLE)
  @extension(
    "x-capability-data",
    {
      capability: "ventrata/content",
      required: true,
    }
  )
  @extension(
    "x-oapi-codegen-extra-tags",
    {
      capability: "ventrata/content",
      required: true,
    }
  )
  fromPoint?: Point | null;

  /**
   * The destination point of the option. Only present when ventrata/content capability is requested.
   */
  @example(OPTION_CONTENT_TO_POINT_EXAMPLE)
  @extension(
    "x-capability-data",
    {
      capability: "ventrata/content",
      required: true,
    }
  )
  @extension(
    "x-oapi-codegen-extra-tags",
    {
      capability: "ventrata/content",
      required: true,
    }
  )
  toPoint?: Point | null;
}
