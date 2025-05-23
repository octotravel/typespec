import "@typespec/openapi";

import "./Feature.tsp";

namespace Octo;

const AVAILABILITY_CONTENT_TITLE_DOC = "The public, customer-facing for the availablity. This name is displayed to end customers and should accurately represent the option for marketing and sales purposes. Can be null when not appliable ";
const AVAILABILITY_CONTENT_SHORT_DESCRIPTION_DOC = "A brief, customer-facing description of the availability. This field provides a concise overview of availability. ";

const AVAILABILITY_CONTENT_TITLE_EXAMPLE = "";
const AVAILABILITY_CONTENT_SHORT_DESCRIPTION_EXAMPLE = "";

const AVAILABILITY_CONTENT_EXAMPLE = #{
  title: AVAILABILITY_CONTENT_TITLE_EXAMPLE,
  shortDescription: AVAILABILITY_CONTENT_SHORT_DESCRIPTION_EXAMPLE,
};

model AvailabilityContent {
  @doc(AVAILABILITY_CONTENT_TITLE_DOC)
  @example(AVAILABILITY_CONTENT_TITLE_EXAMPLE)
  @TypeSpec.OpenAPI.extension(
    "x-capability-data",
    #{
      capability: "octo/content",
      required: true,
    }
  )
  title?: string | null;

  @doc(AVAILABILITY_CONTENT_SHORT_DESCRIPTION_DOC)
  @example(AVAILABILITY_CONTENT_SHORT_DESCRIPTION_EXAMPLE)
  @TypeSpec.OpenAPI.extension(
    "x-capability-data",
    #{
      capability: "octo/content",
      required: true,
    }
  )
  shortDescription?: string;
}
