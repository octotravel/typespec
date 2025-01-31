import "@typespec/http";
import "@typespec/openapi3";

import "../schemas/BookingReservationBody.tsp";
import "./RequestHeaders.tsp";

namespace Octo;
using TypeSpec.Http;

model BookingReservationRequest {
  @example(
    BOOKING_RESERVATION_BODY_EXAMPLE,
    #{ title: "Reserve Booking", description: "Reserve Booking" }
  )
  @body
  body: BookingReservationBody;

  ...RequestHeaders;
}
