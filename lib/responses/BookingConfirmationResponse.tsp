import "@typespec/http";
import "@typespec/openapi3";

import "../models/Booking.tsp";
import "../models/Error.tsp";
import "./ResponseHeaders.tsp";

namespace Octo;
using TypeSpec.Http;

model BookingConfirmationSuccessResponse {
  @statusCode statusCode: 200;
  @body body: Booking;
  ...ResponseHeaders;
}
const BOOKING_CONFIRMATION_RESPONSE = BOOKING_CONFIRMED_EXAMPLE;

model BookingConfirmationErrorResponse {
  @statusCode statusCode: 400;
  @body body:
    | ErrorInvalidProductID
    | ErrorInvalidOptionID
    | ErrorInvalidUnitID
    | ErrorInvalidAvailabilityID
    | ErrorInvalidBookingUUID
    | ErrorUnprocessableEntity
    | ErrorUnauthorized
    | ErrorInternalServerError
    | ErrorForbidden;
}

const BOOKING_CONFIRMATION_INVALID_PRODUCT_ID_RESPONSE_EXAMPLE = ERROR_INVALID_PRODUCT_ID_EXAMPLE;
const BOOKING_CONFIRMATION_INVALID_OPTION_ID_RESPONSE_EXAMPLE = ERROR_INVALID_OPTION_ID_EXAMPLE;
const BOOKING_CONFIRMATION_INVALID_UNIT_ID_RESPONSE_EXAMPLE = ERROR_INVALID_UNIT_ID_EXAMPLE;
const BOOKING_CONFIRMATION_INVALID_AVAILABILITY_ID_RESPONSE_EXAMPLE = ERROR_INVALID_AVAILABILITY_ID_EXAMPLE;
const BOOKING_CONFIRMATION_INVALID_BOOKING_UUID_RESPONSE_EXAMPLE = ERROR_INVALID_BOOKING_UUID_EXAMPLE;
const BOOKING_CONFIRMATION_UNPROCESSABLE_ENTITY_RESPONSE_EXAMPLE = #{
  error: ERROR_UNPROCESSABLE_ENTITY_ERROR_EXAMPLE,
  errorMessage: "The request body is technically correct but cannot be processed for other reasons. e.g. you tried to cancel a booking after the cancellation cutoff had elapsed",
};
const BOOKING_CONFIRMATION_UNAUTHORIZED_RESPONSE_EXAMPLE = ERROR_UNAUTHORIZED_EXAMPLE;
const BOOKING_CONFIRMATION_INTERNAL_SERVER_ERROR_RESPONSE_EXAMPLE = ERROR_INTERNAL_SERVER_ERROR_EXAMPLE;
const BOOKING_CONFIRMATION_FORBIDDEN_RESPONSE_EXAMPLE = ERROR_FORBIDDEN_EXAMPLE;
