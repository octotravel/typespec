import "@typespec/openapi";
import "./Media.tsp";

namespace Octo;

const SUPPLIER_CONTENT_SHORT_DESCRIPTION_DOC = "A brief, customer-facing description of the supplier. This field provides a concise overview of the supplier's business and may be null if no description is available.";
const SUPPLIER_CONTENT_MEDIA_DOC = "A list of supplier media files hosted at stable URLs. Media enhances the visual and informational representation of the supplier, such as logos and supporting images. This array can be null if no media is available. Note: Media details are intentionally repeated at various levels. ";

const SUPPLIER_CONTENT_SHORT_DESCRIPTION_EXAMPLE = "";
const SUPPLIER_CONTENT_MEDIA_EXAMPLE = #[MEDIA_EXAMPLE];

const SUPPLIER_CONTENT_EXAMPLE = #{
  shortDescription: SUPPLIER_CONTENT_SHORT_DESCRIPTION_EXAMPLE,
  media: SUPPLIER_CONTENT_MEDIA_EXAMPLE,
};

@example(SUPPLIER_CONTENT_EXAMPLE)
model SupplierContent {
  @doc(SUPPLIER_CONTENT_SHORT_DESCRIPTION_DOC)
  @example(SUPPLIER_CONTENT_SHORT_DESCRIPTION_EXAMPLE)
  @TypeSpec.OpenAPI.extension(
    "x-capability-data",
    {
      capability: "octo/content",
      required: true,
    }
  )
  shortDescription?: string | null;

  @doc(SUPPLIER_CONTENT_MEDIA_DOC)
  @example(SUPPLIER_CONTENT_MEDIA_EXAMPLE)
  @TypeSpec.OpenAPI.extension(
    "x-capability-data",
    {
      capability: "octo/content",
      required: true,
    }
  )
  media?: Media[];
}
