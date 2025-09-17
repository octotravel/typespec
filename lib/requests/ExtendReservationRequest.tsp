import "@typespec/http";
import "@typespec/openapi3";

import "../schemas/ExtendReservationBody.tsp";
import "./RequestHeaders.tsp";

namespace Octo;
using TypeSpec.Http;

model ExtendReservationPathParams {
    @doc("The UUID of the booking")
    uuid: string;
}

model ExtendReservationRequest {
  @doc("The UUID of the booking")
  @path
  uuid: ExtendReservationPathParams.uuid;

  @body body: ExtendReservationBody;
  ...RequestHeaders;
}
