import "@typespec/openapi";

import "./Feature.tsp";

namespace Octo;

const UNIT_CONTENT_TITLE_DOC = "The public-facing name of the unit, designed to be displayed to customers. This should clearly convey the nature of the unit, such as \"Adult\" or \"Student\".";
const UNIT_CONTENT_SHORT_DESCRIPTION_DOC = "A concise summary of the unit, offering key details to customers. This helps in differentiating units and highlighting important characteristics.";
const UNIT_CONTENT_FEATURES_DOC = "An array of structured objects describing various aspects of the unit's features, grouped into clear categories. These include details about what is included, excluded, emphasized, essential, or safety-related, ensuring transparency and enhancing the option’s appeal to customers. Note: Features are intentionally repeated at both product and option levels, allowing suppliers to specify details where most applicable. Resellers must combine information from both levels for a comprehensive customer view.";

const UNIT_CONTENT_TITLE_EXAMPLE = "";
const UNIT_CONTENT_SHORT_DESCRIPTION_EXAMPLE = "";
const UNIT_CONTENT_FEATURES_EXAMPLE = #[FEATURE_EXAMPLE];

const UNIT_CONTENT_EXAMPLE = #{
  title: UNIT_CONTENT_TITLE_EXAMPLE,
  shortDescription: UNIT_CONTENT_SHORT_DESCRIPTION_EXAMPLE,
  features: UNIT_CONTENT_FEATURES_EXAMPLE,
};

model UnitContent {
  @doc(UNIT_CONTENT_TITLE_DOC)
  @example(UNIT_CONTENT_TITLE_EXAMPLE)
  @TypeSpec.OpenAPI.extension(
    "x-capability-data",
    {
      capability: "octo/content",
      required: true,
    }
  )
  title?: string | null;

  @doc(UNIT_CONTENT_SHORT_DESCRIPTION_DOC)
  @example(UNIT_CONTENT_SHORT_DESCRIPTION_EXAMPLE)
  @TypeSpec.OpenAPI.extension(
    "x-capability-data",
    {
      capability: "octo/content",
      required: true,
    }
  )
  shortDescription?: string;

  @doc(UNIT_CONTENT_FEATURES_DOC)
  @example(UNIT_CONTENT_FEATURES_EXAMPLE)
  @TypeSpec.OpenAPI.extension(
    "x-capability-data",
    {
      capability: "octo/content",
      required: true,
    }
  )
  features?: Feature[];
}
