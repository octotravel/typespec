import "@typespec/http";
import "@typespec/openapi3";

import "../schemas/BookingConfirmationSchema.tsp";
import "./RequestHeaders.tsp";

namespace Octo;
using TypeSpec.Http;

model BookingConfirmationRequest {
  @doc("The UUID of the booking")
  @path
  uuid: string;

  @example(
    BOOKING_CONFIRMATION_BODY_EXAMPLE,
    #{ title: "Confirmation", description: "Confirmation" }
  )
  @body
  body: BookingConfirmationBody;

  ...RequestHeaders;
}
