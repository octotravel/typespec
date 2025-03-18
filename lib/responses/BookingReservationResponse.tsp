import "@typespec/http";
import "@typespec/openapi3";

import "../models/Booking.tsp";
import "../models/Error.tsp";
import "./ResponseHeaders.tsp";

namespace Octo;
using TypeSpec.Http;

model BookingReservationSuccessResponse {
  @statusCode statusCode: 200;
  @body body: Booking;
  ...ResponseHeaders;
}

const BOOKING_RESERVATION_RESPONSE = BOOKING_ON_HOLD_EXAMPLE;

model BookingReservationErrorResponse {
  @statusCode statusCode: 400;
  @body body:
    | ErrorInvalidProductID
    | ErrorInvalidOptionID
    | ErrorInvalidUnitID
    | ErrorInvalidAvailabilityID
    | ErrorUnprocessableEntity
    | ErrorUnauthorized
    | ErrorInternalServerError
    | ErrorForbidden;
}

const BOOKING_RESERVATION_INVALID_PRODUCT_ID_RESPONSE_EXAMPLE = ERROR_INVALID_PRODUCT_ID_EXAMPLE;
const BOOKING_RESERVATION_INVALID_OPTION_ID_RESPONSE_EXAMPLE = ERROR_INVALID_OPTION_ID_EXAMPLE;
const BOOKING_RESERVATION_INVALID_UNIT_ID_RESPONSE_EXAMPLE = ERROR_INVALID_UNIT_ID_EXAMPLE;
const BOOKING_RESERVATION_INVALID_AVAILABILITY_ID_RESPONSE_EXAMPLE = ERROR_INVALID_AVAILABILITY_ID_EXAMPLE;
const BOOKING_RESERVATION_UNPROCESSABLE_ENTITY_RESPONSE_EXAMPLE = #{
  error: ERROR_UNPROCESSABLE_ENTITY_ERROR_EXAMPLE,
  errorMessage: "Validation failed: Minimum tickets is 2",
};
const BOOKING_RESERVATION_UNAUTHORIZED_RESPONSE_EXAMPLE = ERROR_UNAUTHORIZED_EXAMPLE;
const BOOKING_RESERVATION_INTERNAL_SERVER_ERROR_RESPONSE_EXAMPLE = ERROR_INTERNAL_SERVER_ERROR_EXAMPLE;
const BOOKING_RESERVATION_FORBIDDEN_RESPONSE_EXAMPLE = ERROR_FORBIDDEN_EXAMPLE;
