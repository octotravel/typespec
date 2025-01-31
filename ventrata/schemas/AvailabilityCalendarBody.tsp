import "@typespec/openapi";

import "../../src/schemas/AvailabilityCalendarBody.tsp";
import "./common/AvailabilityUnit.tsp";

namespace Ventrata;
using OpenAPI;

@example(Octo.AVAILABILITY_CALENDAR_DATE_RANGE_BODY_EXAMPLE)
model AvailabilityCalendarBody extends Octo.AvailabilityCalendarBody {
  units?: AvailabilityUnit[];
}
