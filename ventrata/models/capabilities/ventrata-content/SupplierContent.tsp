import "@typespec/openapi";
import "./Destination.tsp";

namespace Ventrata;

const SUPPLIER_CONTENT_COUNTRY_DOC = "";
const SUPPLIER_CONTENT_DESTINATIONS_DOC = "";

const SUPPLIER_CONTENT_COUNTRY_EXAMPLE = "";
const SUPPLIER_CONTENT_DESTINATIONS_EXAMPLE = #[DESTINATION_EXAMPLE];

const SUPPLIER_CONTENT_EXAMPLE = #{
  country: SUPPLIER_CONTENT_COUNTRY_EXAMPLE,
  destinations: SUPPLIER_CONTENT_DESTINATIONS_EXAMPLE,
};

@example(SUPPLIER_CONTENT_EXAMPLE)
model SupplierContent {
  @doc(SUPPLIER_CONTENT_COUNTRY_DOC)
  @example(SUPPLIER_CONTENT_COUNTRY_EXAMPLE)
  @TypeSpec.OpenAPI.extension(
    "x-capability-data",
    {
      capability: "ventrata/content",
      required: true,
    }
  )
  @TypeSpec.OpenAPI.extension(
    "x-oapi-codegen-extra-tags",
    {
      capability: "ventrata/content",
      required: true,
    }
  )
  country?: string | null;

  @doc(SUPPLIER_CONTENT_DESTINATIONS_DOC)
  @example(SUPPLIER_CONTENT_DESTINATIONS_EXAMPLE)
  @TypeSpec.OpenAPI.extension(
    "x-capability-data",
    {
      capability: "ventrata/content",
      required: true,
    }
  )
  @TypeSpec.OpenAPI.extension(
    "x-oapi-codegen-extra-tags",
    {
      capability: "ventrata/content",
      required: true,
    }
  )
  destinations?: Destination[];
}
