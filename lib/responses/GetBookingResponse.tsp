import "@typespec/http";
import "@typespec/openapi3";

import "../models/Booking.tsp";
import "../models/Error.tsp";
import "./ResponseHeaders.tsp";

namespace Octo;
using TypeSpec.Http;

model GetBookingSuccessResponse {
  @statusCode statusCode: 200;
  @body body: Booking;
  ...ResponseHeaders;
}

const GET_BOOKING_RESPONSE = BOOKING_CONFIRMED_EXAMPLE;

model GetBookingErrorResponse {
  @statusCode statusCode: 400;
  @body body:
    | ErrorInvalidBookingUUID
    | ErrorUnauthorized
    | ErrorInternalServerError
    | ErrorForbidden;
}

const GET_BOOKING_INVALID_BOOKING_UUID_RESPONSE_EXAMPLE = ERROR_INVALID_BOOKING_UUID_EXAMPLE;
const GET_BOOKING_UNAUTHORIZED_RESPONSE_EXAMPLE = ERROR_UNAUTHORIZED_EXAMPLE;
const GET_BOOKING_INTERNAL_SERVER_ERROR_RESPONSE_EXAMPLE = ERROR_INTERNAL_SERVER_ERROR_EXAMPLE;
const GET_BOOKING_FORBIDDEN_RESPONSE_EXAMPLE = ERROR_FORBIDDEN_EXAMPLE;
