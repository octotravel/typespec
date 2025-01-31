import "@typespec/http";
import "@typespec/openapi3";

import "../../src/requests/BookingConfirmationRequest.tsp";
import "../schemas/BookingConfirmationBody.tsp";
import "./RequestHeaders.tsp";

namespace Ventrata;
using TypeSpec.Http;

model BookingConfirmationRequest extends Octo.BookingConfirmationRequest {
  @example(
    BOOKING_CONFIRMATION_BODY_EXAMPLE,
    #{ title: "Confirmation", description: "Confirmation" }
  )
  @body
  body: BookingConfirmationBody;

  ...RequestHeaders;
}
