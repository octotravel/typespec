import "../schemas/ExtendReservationBody.tsp";
import "../../src/requests/ExtendReservationRequest.tsp";
import "./RequestHeaders.tsp";

namespace Ventrata;
using TypeSpec.Http;

model ExtendReservationRequest extends Octo.ExtendReservationRequest {
  @body body: ExtendReservationBody;
  ...RequestHeaders;
}
