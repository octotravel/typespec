import "../../src/schemas/AvailabilityCalendarBody.tsp";
import "./common/AvailabilityUnit.tsp";

namespace Ventrata;

@example(Octo.AVAILABILITY_CALENDAR_DATE_RANGE_BODY_EXAMPLE)
model AvailabilityCalendarBody extends Octo.AvailabilityCalendarBody {
  units?: AvailabilityUnit[];
}
