import "@typespec/http";
import "@typespec/openapi3";

import "../../src/requests/GetBookingsRequest.tsp";
import "./RequestHeaders.tsp";

namespace Ventrata;
using TypeSpec.Http;

model GetBookingsRequest extends Octo.GetBookingsRequest {
  ...RequestHeaders;
}
