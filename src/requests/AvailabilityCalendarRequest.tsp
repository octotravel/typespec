import "@typespec/http";
import "@typespec/openapi3";

import "../schemas/AvailabilityCalendarSchema.tsp";
import "./RequestHeaders.tsp";

namespace Octo;
using TypeSpec.Http;

model AvailabilityCalendarRequest {
  @example(
    AVAILABILITY_CALENDAR_DATE_RANGE_BODY_EXAMPLE,
    #{ title: "Date Range example", description: "Date Range example" }
  )
  @example(
    AVAILABILITY_CALENDAR_WITH_UNITS_BODY_EXAMPLE,
    #{ title: "Example with units", description: "Example with units" }
  )
  @body
  body: AvailabilityCalendarBody;

  ...RequestHeaders;
}
