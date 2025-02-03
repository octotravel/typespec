import "../../src/models/AvailabilityCalendar.tsp";
import "./capabilities/pricing/AvailabilityCalendarPricing.tsp";

namespace Ventrata;

const AVAILABILITY_CALENDAR_EXAMPLE = #{
  ...Octo.AVAILABILITY_CALENDAR_EXAMPLE,
};

@example(AVAILABILITY_CALENDAR_EXAMPLE)
model AvailabilityCalendar extends Octo.AvailabilityCalendar {
  ...AvailabilityCalendarPricing;
}
