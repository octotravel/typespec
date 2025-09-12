import "@typespec/openapi";
import "./Media.tsp";
import "./CategoryLabel.tsp";
import "./Commentary.tsp";
import "./FAQ.tsp";
import "./Feature.tsp";
import "./Location.tsp";

namespace Octo;

const OPTION_CONTENT_TITLE_DOC = "The public, customer-facing name of the product. This name is displayed to end customers and should accurately represent the product for marketing and sales purposes";
const OPTION_CONTENT_SHORT_DESCRIPTION_DOC = "A brief, customer-facing description of the product. This field provides a concise overview of the product and can be null if no description is available.";
const OPTION_CONTENT_DESCRIPTION_DOC = "A detailed description of the product, offering in-depth information about it and relevant details. This field can be null if extended details are not provided.";
const OPTION_CONTENT_FEATURES_DOC = "An array of structured objects describing various aspects of the product's features, grouped into clear categories. These include details about what is included, excluded, emphasized, essential, or safety-related, ensuring transparency and enhancing the product’s appeal to customers. Note: Features are intentionally repeated at both product and option levels, allowing suppliers to specify details where most applicable. Resellers must combine information from both levels for a comprehensive customer view.";
const OPTION_CONTENT_FAQS_DOC = "An array containing frequently asked questions (FAQs) related to the product. This field is designed to address common customer inquiries by providing clear and concise answers, enhancing the customer experience and reducing potential confusion. Each object represents a single question and its corresponding answer. Note: FAQs are intentionally repeated at both product and option levels, enabling suppliers to address questions specific to each context. Resellers must combine FAQs from both levels for customer presentation.";
const OPTION_CONTENT_MEDIA_DOC = """
  A list of media files hosted at stable URLs. Media enhances the visual and informational representation of the product, supporting images, videos, or documents.
  Note: Media details are intentionally repeated at both product and option levels. Suppliers should use the level most relevant for the resource. Resellers must merge media information for customer presentation.
  """;
const OPTION_CONTENT_LOCATIONS_DOC = "A list of geographical locations associated with the product. These locations can represent an itinerary where the order of locations matters, such as for tours or experiences, or simply a list of related locations linked to the product. This field is particularly useful for map-dependent reseller platforms, as it provides geographic and contextual details to enhance customer understanding and platform integration. Each object in the array represents a single related location and includes the following fields:";
const OPTION_CONTENT_CATEGORY_LABELS_DOC = "A list of labels representing the categories applicable to the product or experience. These categories help customers quickly understand the nature, format, or features of the product. The predefined category labels are based on Google's Product Categories for Things to Do, ensuring alignment with industry standards. OCTO has also added custom categories to cover additional popular offerings. OCTO welcomes suggestions for additional categories to ensure consistency and better coverage. Please contact the team to propose updates to the specification.";
const OPTION_CONTENT_DURATION_MINUTES_FROM_DOC = "Indicates the duration of the product or experience in minutes. If the duration is flexible, this represents the typical minimum duration.";
const OPTION_CONTENT_DURATION_MINUTES_TO_DOC = """
  If a number: Represents the maximum in flexible duration of the product or experience in minutes, defining a range.
  If null: Indicates that the duration is exact and matches the value of durationMinutesFrom.
  """;
const OPTION_CONTENT_COMMENTARY_DOC = "A list of commentary options available for the product. Each object in the array specifies the format and language of the commentary.";

const OPTION_CONTENT_TITLE_EXAMPLE = "";
const OPTION_CONTENT_SHORT_DESCRIPTION_EXAMPLE = "";
const OPTION_CONTENT_DESCRIPTION_EXAMPLE = "";
const OPTION_CONTENT_FEATURES_EXAMPLE = #[FEATURE_EXAMPLE];
const OPTION_CONTENT_FAQS_EXAMPLE = #[FAQ_EXAMPLE];
const OPTION_CONTENT_MEDIA_EXAMPLE = #[MEDIA_EXAMPLE];
const OPTION_CONTENT_LOCATIONS_EXAMPLE = #[LOCATION_EXAMPLE];
const OPTION_CONTENT_CATEGORY_LABELS_EXAMPLE = #[
  CategoryLabel.ADULTS_ONLY,
  CategoryLabel.ROMANTIC
];
const OPTION_CONTENT_DURATION_MINUTES_FROM_EXAMPLE = 30;
const OPTION_CONTENT_DURATION_MINUTES_TO_EXAMPLE = null;
const OPTION_CONTENT_COMMENTARY_EXAMPLE = #[COMMENTARY_EXAMPLE];

const OPTION_CONTENT_EXAMPLE = #{
  title: OPTION_CONTENT_TITLE_EXAMPLE,
  shortDescription: OPTION_CONTENT_SHORT_DESCRIPTION_EXAMPLE,
  description: OPTION_CONTENT_DESCRIPTION_EXAMPLE,
  features: OPTION_CONTENT_FEATURES_EXAMPLE,
  faqs: OPTION_CONTENT_FAQS_EXAMPLE,
  media: OPTION_CONTENT_MEDIA_EXAMPLE,
  locations: OPTION_CONTENT_LOCATIONS_EXAMPLE,
  categoryLabels: OPTION_CONTENT_CATEGORY_LABELS_EXAMPLE,
  durationMinutesFrom: OPTION_CONTENT_DURATION_MINUTES_FROM_EXAMPLE,
  durationMinutesTo: OPTION_CONTENT_DURATION_MINUTES_TO_EXAMPLE,
  commentary: OPTION_CONTENT_COMMENTARY_EXAMPLE,
};

@example(OPTION_CONTENT_EXAMPLE)
model OptionContent {
  @doc(OPTION_CONTENT_TITLE_DOC)
  @example(OPTION_CONTENT_TITLE_EXAMPLE)
  @TypeSpec.OpenAPI.extension(
    "x-capability-data",
    #{
      capability: "octo/content",
      required: true,
    }
  )
  title?: string;

  @doc(OPTION_CONTENT_SHORT_DESCRIPTION_DOC)
  @example(OPTION_CONTENT_SHORT_DESCRIPTION_EXAMPLE)
  @TypeSpec.OpenAPI.extension(
    "x-capability-data",
    #{
      capability: "octo/content",
      required: true,
    }
  )
  shortDescription?: string | null;

  @doc(OPTION_CONTENT_DESCRIPTION_DOC)
  @example(OPTION_CONTENT_DESCRIPTION_EXAMPLE)
  @TypeSpec.OpenAPI.extension(
    "x-capability-data",
    #{
      capability: "octo/content",
      required: true,
    }
  )
  description?: string | null;

  @doc(OPTION_CONTENT_FEATURES_DOC)
  @example(OPTION_CONTENT_FEATURES_EXAMPLE)
  @TypeSpec.OpenAPI.extension(
    "x-capability-data",
    #{
      capability: "octo/content",
      required: true,
    }
  )
  features?: Feature[];

  @doc(OPTION_CONTENT_FAQS_DOC)
  @example(OPTION_CONTENT_FAQS_EXAMPLE)
  @TypeSpec.OpenAPI.extension(
    "x-capability-data",
    #{
      capability: "octo/content",
      required: true,
    }
  )
  faqs?: FAQ[];

  @doc(OPTION_CONTENT_MEDIA_DOC)
  @example(OPTION_CONTENT_MEDIA_EXAMPLE)
  @TypeSpec.OpenAPI.extension(
    "x-capability-data",
    #{
      capability: "octo/content",
      required: true,
    }
  )
  media?: Media[];

  @doc(OPTION_CONTENT_LOCATIONS_DOC)
  @example(OPTION_CONTENT_LOCATIONS_EXAMPLE)
  @TypeSpec.OpenAPI.extension(
    "x-capability-data",
    #{
      capability: "octo/content",
      required: true,
    }
  )
  locations?: Location[];

  @doc(OPTION_CONTENT_CATEGORY_LABELS_DOC)
  @example(OPTION_CONTENT_CATEGORY_LABELS_EXAMPLE)
  @TypeSpec.OpenAPI.extension(
    "x-capability-data",
    #{
      capability: "octo/content",
      required: true,
    }
  )
  categoryLabels?: CategoryLabel[];

  @doc(OPTION_CONTENT_DURATION_MINUTES_FROM_DOC)
  @example(OPTION_CONTENT_DURATION_MINUTES_FROM_EXAMPLE)
  @TypeSpec.OpenAPI.extension(
    "x-capability-data",
    #{
      capability: "octo/content",
      required: true,
    }
  )
  durationMinutesFrom?: integer;

  @doc(OPTION_CONTENT_DURATION_MINUTES_TO_DOC)
  @example(OPTION_CONTENT_DURATION_MINUTES_TO_EXAMPLE)
  @TypeSpec.OpenAPI.extension(
    "x-capability-data",
    #{
      capability: "octo/content",
      required: true,
    }
  )
  durationMinutesTo?: integer | null;

  @doc(OPTION_CONTENT_COMMENTARY_DOC)
  @example(OPTION_CONTENT_COMMENTARY_EXAMPLE)
  @TypeSpec.OpenAPI.extension(
    "x-capability-data",
    #{
      capability: "octo/content",
      required: true,
    }
  )
  commentary?: Commentary[];
}
