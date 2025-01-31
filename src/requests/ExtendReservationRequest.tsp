import "@typespec/http";
import "@typespec/openapi3";

import "../schemas/ExtendReservationBody.tsp";
import "./RequestHeaders.tsp";

namespace Octo;
using TypeSpec.Http;

model ExtendReservationRequest {
  @doc("The UUID of the booking")
  @path
  uuid: string;

  @body body: ExtendReservationBody;
  ...RequestHeaders;
}
