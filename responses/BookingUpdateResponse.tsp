import "@typespec/http";
import "@typespec/openapi3";

import "../models/Booking.tsp";
import "../models/Error.tsp";

using TypeSpec.Http;

model BookingUpdateSuccessResponse {
  @statusCode statusCode: 200;
  @body body: Booking;
}

const BOOKING_UPDATE_RESPONSE = BOOKING_CONFIRMED_EXAMPLE;

model BookingUpdateErrorResponse {
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

const BOOKING_UPDATE_INVALID_PRODUCT_ID_RESPONSE_EXAMPLE = ERROR_INVALID_PRODUCT_ID_EXAMPLE;
const BOOKING_UPDATE_INVALID_OPTION_ID_RESPONSE_EXAMPLE = ERROR_INVALID_OPTION_ID_EXAMPLE;
const BOOKING_UPDATE_INVALID_UNIT_ID_RESPONSE_EXAMPLE = ERROR_INVALID_UNIT_ID_EXAMPLE;
const BOOKING_UPDATE_INVALID_AVAILABILITY_ID_RESPONSE_EXAMPLE = ERROR_INVALID_AVAILABILITY_ID_EXAMPLE;
const BOOKING_UPDATE_INVALID_BOOKING_UUID_RESPONSE_EXAMPLE = ERROR_INVALID_BOOKING_UUID_EXAMPLE;
const BOOKING_UPDATE_UNPROCESSABLE_ENTITY_RESPONSE_EXAMPLE = #{
  error: ERROR_UNPROCESSABLE_ENTITY_ERROR_EXAMPLE,
  errorMessage: "The request body is technically correct but cannot be processed for other reasons. e.g. you tried to cancel a booking after the cancellation cutoff had elapsed",
};
const BOOKING_UPDATE_UNAUTHORIZED_RESPONSE_EXAMPLE = ERROR_UNAUTHORIZED_EXAMPLE;
const BOOKING_UPDATE_INTERNAL_SERVER_ERROR_RESPONSE_EXAMPLE = ERROR_INTERNAL_SERVER_ERROR_EXAMPLE;
const BOOKING_UPDATE_FORBIDDEN_RESPONSE_EXAMPLE = ERROR_FORBIDDEN_EXAMPLE;
