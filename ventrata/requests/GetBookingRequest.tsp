import "../../src/requests/GetBookingRequest.tsp";
import "./RequestHeaders.tsp";

namespace Ventrata;
using TypeSpec.Http;

model GetBookingRequest extends Octo.GetBookingRequest {
  ...RequestHeaders;
}
