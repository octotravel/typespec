import "@typespec/http";
import "@typespec/openapi3";

import "../../src/models/Error.tsp";
import "../../src/models/Booking.tsp";
import "../../src/responses/BookingCancellationResponse.tsp";
import "./ResponseHeaders.tsp";

namespace Ventrata;
using TypeSpec.Http;

model BookingCancellationSuccessResponse
  extends Octo.BookingCancellationSuccessResponse {
  @body body: Booking;
  ...ResponseHeaders;
}

const BOOKING_CANCELLATION_RESPONSE = BOOKING_EXAMPLE;

model BookingCancellationErrorResponse
  extends Octo.BookingCancellationErrorResponse {}
const BOOKING_CANCELLATION_INVALID_BOOKING_UUID_RESPONSE_EXAMPLE = Octo.BOOKING_CANCELLATION_INVALID_BOOKING_UUID_RESPONSE_EXAMPLE;
const BOOKING_CANCELLATION_UNPROCESSABLE_ENTITY_RESPONSE_EXAMPLE = Octo.BOOKING_CANCELLATION_UNPROCESSABLE_ENTITY_RESPONSE_EXAMPLE;
const BOOKING_CANCELLATION_UNAUTHORIZED_RESPONSE_EXAMPLE = Octo.BOOKING_CANCELLATION_UNAUTHORIZED_RESPONSE_EXAMPLE;
const BOOKING_CANCELLATION_INTERNAL_SERVER_ERROR_RESPONSE_EXAMPLE = Octo.BOOKING_CANCELLATION_INTERNAL_SERVER_ERROR_RESPONSE_EXAMPLE;
const BOOKING_CANCELLATION_FORBIDDEN_RESPONSE_EXAMPLE = Octo.BOOKING_CANCELLATION_FORBIDDEN_RESPONSE_EXAMPLE;
