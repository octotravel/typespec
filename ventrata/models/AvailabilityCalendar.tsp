import "@typespec/openapi";

import "../../src/models/AvailabilityCalendar.tsp";
import "./capabilities/pricing/AvailabilityCalendarPricing.tsp";

using OpenAPI;

namespace Ventrata;

const AVAILABILITY_CALENDAR_EXAMPLE = #{
  ...Octo.AVAILABILITY_CALENDAR_EXAMPLE,
};

@example(AVAILABILITY_CALENDAR_EXAMPLE)
model AvailabilityCalendar extends Octo.AvailabilityCalendar {
  ...AvailabilityCalendarPricing;
}
