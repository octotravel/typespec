import "@typespec/http";
import "@typespec/openapi3";

import "../schemas/BookingCancellationBody.tsp";
import "./RequestHeaders.tsp";

namespace Octo;
using TypeSpec.Http;

model BookingCancellationPathParams {
    @doc("The UUID of the booking")
    uuid: string;
}
model BookingCancellationRequest {
  @doc("The UUID of the booking")
  @path
  uuid: BookingCancellationPathParams.uuid;

  @body body: BookingCancellationBody;
  ...RequestHeaders;
}
