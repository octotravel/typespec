import "@typespec/http";
import "@typespec/openapi3";

import "../models/Booking.tsp";
import "../models/Error.tsp";

using TypeSpec.Http;

model BookingCancellationSuccessResponse {
  @statusCode statusCode: 200;
  @body body: Booking;
}

const BOOKING_CANCELLATION_RESPONSE = BOOKING_CANCELLED_EXAMPLE;

model BookingCancellationErrorResponse {
  @statusCode statusCode: 400;
  @body body:
    | ErrorInvalidBookingUUID
    | ErrorUnprocessableEntity
    | ErrorUnauthorized
    | ErrorInternalServerError
    | ErrorForbidden;
}
const BOOKING_CANCELLATION_INVALID_BOOKING_UUID_RESPONSE_EXAMPLE = ERROR_INVALID_BOOKING_UUID_EXAMPLE;
const BOOKING_CANCELLATION_UNPROCESSABLE_ENTITY_RESPONSE_EXAMPLE = #{
  error: ERROR_UNPROCESSABLE_ENTITY_ERROR_EXAMPLE,
  errorMessage: "The request body is technically correct but cannot be processed for other reasons. e.g. you tried to cancel a booking after the cancellation cutoff had elapsed",
};
const BOOKING_CANCELLATION_UNAUTHORIZED_RESPONSE_EXAMPLE = ERROR_UNAUTHORIZED_EXAMPLE;
const BOOKING_CANCELLATION_INTERNAL_SERVER_ERROR_RESPONSE_EXAMPLE = ERROR_INTERNAL_SERVER_ERROR_EXAMPLE;
const BOOKING_CANCELLATION_FORBIDDEN_RESPONSE_EXAMPLE = ERROR_FORBIDDEN_EXAMPLE;
