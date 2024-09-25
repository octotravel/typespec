import "@typespec/http";
import "@typespec/openapi3";

import "../models/Booking.tsp";
import "../models/Error.tsp";

using TypeSpec.Http;

model ExtendReservationSuccessResponse {
  @statusCode statusCode: 200;
  @body body: Booking;
}

const EXTEND_RESERVATION_RESPONSE = BOOKING_ON_HOLD_EXAMPLE;

model ExtendReservationErrorResponse {
  @statusCode statusCode: 400;
  @body body:
    | ErrorInvalidBookingUUID
    | ErrorUnprocessableEntity
    | ErrorUnauthorized
    | ErrorInternalServerError
    | ErrorForbidden;
}

const EXTEND_RESERVATION_INVALID_BOOKING_UUID_RESPONSE_EXAMPLE = ERROR_INVALID_BOOKING_UUID_EXAMPLE;
const EXTEND_RESERVATION_UNPROCESSABLE_ENTITY_RESPONSE_EXAMPLE = #{
  error: ERROR_UNPROCESSABLE_ENTITY_ERROR_EXAMPLE,
  errorMessage: "The request body is technically correct but cannot be processed for other reasons. e.g. you tried to cancel a booking after the cancellation cutoff had elapsed",
};
const EXTEND_RESERVATION_UNAUTHORIZED_RESPONSE_EXAMPLE = ERROR_UNAUTHORIZED_EXAMPLE;
const EXTEND_RESERVATION_INTERNAL_SERVER_ERROR_RESPONSE_EXAMPLE = ERROR_INTERNAL_SERVER_ERROR_EXAMPLE;
const EXTEND_RESERVATION_FORBIDDEN_RESPONSE_EXAMPLE = ERROR_FORBIDDEN_EXAMPLE;
