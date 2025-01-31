import "@typespec/http";
import "@typespec/openapi3";

import "../../src/requests/GetBookingRequest.tsp";
import "./RequestHeaders.tsp";

namespace Ventrata;
using TypeSpec.Http;

model GetBookingRequest extends Octo.GetBookingRequest {
  ...RequestHeaders;
}
