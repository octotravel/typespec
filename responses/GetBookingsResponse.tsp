import "@typespec/http";
import "@typespec/openapi3";

import "../models/Booking.tsp";
import "../models/Error.tsp";

using TypeSpec.Http;

model GetBookingsSuccessResponse {
  @statusCode statusCode: 200;
  @body body: Booking[];
}

const GET_BOOKINGS_RESPONSE = #[BOOKING_CONFIRMED_EXAMPLE];

model GetBookingsErrorResponse {
  @statusCode statusCode: 400;
  @body body: ErrorUnauthorized | ErrorInternalServerError | ErrorForbidden;
}

const GET_BOOKINGS_BAD_REQUEST_RESPONSE_EXAMPLE = #{
  error: ERROR_BAD_REQUEST_ERROR_EXAMPLE,
  errorMessage: "either resellerReference, supplierReference, localDate or localDateStart/localDateEnd is required",
};
const GET_BOOKINGS_UNAUTHORIZED_RESPONSE_EXAMPLE = ERROR_UNAUTHORIZED_EXAMPLE;
const GET_BOOKINGS_INTERNAL_SERVER_ERROR_RESPONSE_EXAMPLE = ERROR_INTERNAL_SERVER_ERROR_EXAMPLE;
const GET_BOOKINGs_FORBIDDEN_RESPONSE_EXAMPLE = ERROR_FORBIDDEN_EXAMPLE;
