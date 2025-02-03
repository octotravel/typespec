import "../../src/schemas/AvailabilityCheckBody.tsp";
import "./common/AvailabilityUnit.tsp";

namespace Ventrata;

@example(Octo.AVAILABILITY_CHECK_DATE_RANGE_BODY_EXAMPLE)
model AvailabilityCheckBody extends Octo.AvailabilityCheckBody {
  units?: AvailabilityUnit[];
}
