import "../../src/requests/AvailabilityCheckRequest.tsp";
import "../schemas/AvailabilityCheckBody.tsp";
import "./RequestHeaders.tsp";

namespace Ventrata;
using TypeSpec.Http;

model AvailabilityCheckRequest extends Octo.AvailabilityCheckRequest {
  @body
  body: AvailabilityCheckBody;

  ...RequestHeaders;
}
