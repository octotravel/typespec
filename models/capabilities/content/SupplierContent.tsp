import "@typespec/openapi";
import "./Destination.tsp";

const SUPPLIER_CONTENT_COUNTRY_DOC = "The country the supplier is based in.";
const SUPPLIER_CONTENT_DESTINATIONS_DOC = "An array of destinations the supplier operates in.";

const SUPPLIER_CONTENT_COUNTRY_EXAMPLE = "United Kingdom";
const SUPPLIER_CONTENT_DESTINATIONS_EXAMPLE = #[DESTINATION_EXAMPLE];

model SupplierContent {
  @doc(SUPPLIER_CONTENT_COUNTRY_DOC)
  @example(SUPPLIER_CONTENT_COUNTRY_EXAMPLE)
  @TypeSpec.OpenAPI.extension(
    "x-oapi-codegen-extra-tags",
    {
      capability: "octo/content",
    }
  )
  country?: string | null;

  @doc(SUPPLIER_CONTENT_DESTINATIONS_DOC)
  @example(SUPPLIER_CONTENT_DESTINATIONS_EXAMPLE)
  @TypeSpec.OpenAPI.extension(
    "x-capability-data",
    {
      capability: "octo/content",
      required: true,
    }
  )
  destinations?: Destination[];
}
