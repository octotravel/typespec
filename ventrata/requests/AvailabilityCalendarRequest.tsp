import "../../src/requests/AvailabilityCalendarRequest.tsp";
import "../schemas/AvailabilityCalendarBody.tsp";
import "./RequestHeaders.tsp";

namespace Ventrata;
using TypeSpec.Http;

model AvailabilityCalendarRequest extends Octo.AvailabilityCalendarRequest {
  @body
  body: AvailabilityCalendarBody;

  ...RequestHeaders;
}
