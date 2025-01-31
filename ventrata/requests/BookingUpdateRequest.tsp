import "@typespec/http";
import "@typespec/openapi3";

import "../schemas/BookingUpdateBody.tsp";
import "../../src/requests/BookingUpdateRequest.tsp";
import "./RequestHeaders.tsp";

namespace Ventrata;
using TypeSpec.Http;

model BookingUpdateRequest extends Octo.BookingUpdateRequest {
  @body body: BookingUpdateBody;
  ...RequestHeaders;
}
