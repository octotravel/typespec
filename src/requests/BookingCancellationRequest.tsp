import "@typespec/http";
import "@typespec/openapi3";

import "../schemas/BookingCancellationBody.tsp";
import "./RequestHeaders.tsp";

namespace Octo;
using TypeSpec.Http;

model BookingCancellationRequest {
  @doc("The UUID of the booking")
  @path
  uuid: string;

  @body body: BookingCancellationBody;
  ...RequestHeaders;
}
