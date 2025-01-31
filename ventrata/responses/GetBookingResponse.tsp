import "@typespec/http";
import "@typespec/openapi3";

import "../../src/models/Error.tsp";
import "../../src/models/Booking.tsp";
import "../../src/responses/GetBookingResponse.tsp";
import "./ResponseHeaders.tsp";

namespace Ventrata;
using TypeSpec.Http;

model GetBookingSuccessResponse extends Octo.GetBookingSuccessResponse {
  @body body: Booking;
  ...ResponseHeaders;
}

const GET_BOOKING_RESPONSE = BOOKING_EXAMPLE;

model GetBookingErrorResponse extends Octo.GetBookingErrorResponse {}

const GET_BOOKING_INVALID_BOOKING_UUID_RESPONSE_EXAMPLE = Octo.GET_BOOKING_INVALID_BOOKING_UUID_RESPONSE_EXAMPLE;
const GET_BOOKING_UNAUTHORIZED_RESPONSE_EXAMPLE = Octo.GET_BOOKING_UNAUTHORIZED_RESPONSE_EXAMPLE;
const GET_BOOKING_INTERNAL_SERVER_ERROR_RESPONSE_EXAMPLE = Octo.GET_BOOKING_INTERNAL_SERVER_ERROR_RESPONSE_EXAMPLE;
const GET_BOOKING_FORBIDDEN_RESPONSE_EXAMPLE = Octo.GET_BOOKING_FORBIDDEN_RESPONSE_EXAMPLE;
