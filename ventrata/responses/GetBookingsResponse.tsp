import "@typespec/http";
import "@typespec/openapi3";

import "../../src/models/Error.tsp";
import "../../src/models/Booking.tsp";
import "../../src/responses/GetBookingsResponse.tsp";
import "./ResponseHeaders.tsp";

namespace Ventrata;
using TypeSpec.Http;

model GetBookingsSuccessResponse extends Octo.GetBookingsSuccessResponse {
  @body body: Booking[];
  ...ResponseHeaders;
}

const GET_BOOKINGS_RESPONSE = #[BOOKING_EXAMPLE];

model GetBookingsErrorResponse extends Octo.GetBookingsErrorResponse {}

const GET_BOOKINGS_BAD_REQUEST_RESPONSE_EXAMPLE = Octo.GET_BOOKINGS_BAD_REQUEST_RESPONSE_EXAMPLE;
const GET_BOOKINGS_UNAUTHORIZED_RESPONSE_EXAMPLE = Octo.GET_BOOKINGS_UNAUTHORIZED_RESPONSE_EXAMPLE;
const GET_BOOKINGS_INTERNAL_SERVER_ERROR_RESPONSE_EXAMPLE = Octo.GET_BOOKINGS_INTERNAL_SERVER_ERROR_RESPONSE_EXAMPLE;
const GET_BOOKINGs_FORBIDDEN_RESPONSE_EXAMPLE = Octo.GET_BOOKINGs_FORBIDDEN_RESPONSE_EXAMPLE;
