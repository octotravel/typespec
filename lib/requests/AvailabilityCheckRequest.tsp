import "@typespec/http";
import "@typespec/openapi3";

import "./RequestHeaders.tsp";
import "../schemas/AvailabilityCheckBody.tsp";

namespace Octo;
using TypeSpec.Http;

model AvailabilityCheckRequest {
  @example(
    AVAILABILITY_CHECK_DATE_RANGE_BODY_EXAMPLE,
    #{ title: "Date Range example", description: "Date Range example" }
  )
  @example(
    AVAILABILITY_CHECK_AVAILABILITY_IDS_BODY_EXAMPLE,
    #{
      title: "Availability IDs example",
      description: "Availability IDs example",
    }
  )
  @example(
    AVAILABILITY_CHECK_WITH_UNITS_BODY_EXAMPLE,
    #{ title: "Example with units", description: "Example with units" }
  )
  @body
  body: AvailabilityCheckBody;

  ...RequestHeaders;
}
