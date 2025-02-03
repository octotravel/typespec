import "../../src/requests/BookingUpdateRequest.tsp";
import "../schemas/BookingUpdateBody.tsp";
import "./RequestHeaders.tsp";

namespace Ventrata;
using TypeSpec.Http;

model BookingUpdateRequest extends Octo.BookingUpdateRequest{
  @example(
    BOOKING_UPDATE_BODY_EXAMPLE,
    #{ title: "Update Booking", description: "Update Booking" }
  )
  @body body: Ventrata.BookingUpdateBody;
  ...RequestHeaders;
}
