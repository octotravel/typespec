import "@typespec/http";
import "@typespec/openapi3";

import "../schemas/BookingConfirmationBody.tsp";
import "./RequestHeaders.tsp";

namespace Octo;
using TypeSpec.Http;


model BookingConfirmationPathParams {
    @doc("The UUID of the booking")
    uuid: string;
}

model BookingConfirmationRequest {
  @doc("The UUID of the booking")
  @path
  uuid: BookingConfirmationPathParams.uuid;

  @example(
    BOOKING_CONFIRMATION_BODY_EXAMPLE,
    #{ title: "Confirmation", description: "Confirmation" }
  )
  @body
  body: BookingConfirmationBody;

  ...RequestHeaders;
}
