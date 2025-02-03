import "../../src/requests/BookingReservationRequest.tsp";
import "../schemas/BookingReservationBody.tsp";
import "./RequestHeaders.tsp";

namespace Ventrata;
using TypeSpec.Http;

model BookingReservationRequest extends Octo.BookingReservationRequest {
  @example(
    BOOKING_RESERVATION_BODY_EXAMPLE,
    #{ title: "Reserve Booking", description: "Reserve Booking" }
  )
  @body
  body: BookingReservationBody;

  ...RequestHeaders;
}
