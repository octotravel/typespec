import "@typespec/openapi";
import "./ExternalPlatformLocationType.tsp";

namespace Octo;

const EXTERNAL_PLATFORM_LOCATION_TYPE_DOC = "";
const EXTERNAL_PLATFORM_LOCATION_ID_DOC = "";
const EXTERNAL_PLATFORM_LOCATION_NAME_DOC = "";
const EXTERNAL_PLATFORM_LOCATION_URL_DOC = "";

const EXTERNAL_PLATFORM_LOCATION_TYPE_EXAMPLE = "";
const EXTERNAL_PLATFORM_LOCATION_ID_EXAMPLE = "";
const EXTERNAL_PLATFORM_LOCATION_NAME_EXAMPLE = "";
const EXTERNAL_PLATFORM_LOCATION_URL_EXAMPLE = "";

model ExternalPlatformLocation {
  @doc("")
  @example(ExternalPlatformLocationType.AMAP_PLACE_ID)
  @TypeSpec.OpenAPI.extension(
    "x-capability-data",
    {
      capability: "octo/content",
      required: true,
    }
  )
  type: ExternalPlatformLocationType;

  @doc("COMMENTARY_LANGUAGE_DOC")
  @example("COMMENTARY_LANGUAGE_EXAMPLE")
  @TypeSpec.OpenAPI.extension(
    "x-capability-data",
    {
      capability: "octo/content",
      required: true,
    }
  )
  language: string;
}
