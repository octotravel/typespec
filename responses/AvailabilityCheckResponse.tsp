import "@typespec/http";
import "@typespec/openapi3";

import "../models/Availability.tsp";
import "../models/Error.tsp";

using TypeSpec.Http;

model AvailabilityCheckSuccessResponse {
  @statusCode statusCode: 200;
  @body body: Availability[];
}

const AVAILABILITY_CHECK_START_TIMES_RESPONSE = #[
  AVAILABILITY_START_TIME_EXAMPLE_1,
  AVAILABILITY_START_TIME_EXAMPLE_2
];

const AVAILABILITY_CHECK_OPENING_HOURS_RESPONSE = #[
  AVAILABILITY_OPENING_HOURS_EXAMPLE_1
];

model AvailabilityCheckErrorResponse {
  @statusCode statusCode: 400;
  @body body:
    | ErrorInvalidProductID
    | ErrorInvalidOptionID
    | ErrorBadRequest
    | ErrorUnauthorized
    | ErrorInternalServerError
    | ErrorForbidden;
}

const AVAILABILITY_CHECK_INVALID_PRODUCT_ID_RESPONSE_EXAMPLE = ERROR_INVALID_PRODUCT_ID_EXAMPLE;
const AVAILABILITY_CHECK_INVALID_OPTION_ID_RESPONSE_EXAMPLE = ERROR_INVALID_OPTION_ID_EXAMPLE;
const AVAILABILITY_CHECK_BAD_REQUEST_RESPONSE_EXAMPLE = #{
  error: ERROR_BAD_REQUEST_ERROR_EXAMPLE,
  errorMessage: "either localDate, localDateStart/localDateEnd or availabilityIds is required",
};
const AVAILABILITY_CHECK_UNAUTHORIZED_RESPONSE_EXAMPLE = ERROR_UNAUTHORIZED_EXAMPLE;
const AVAILABILITY_CHECK_INTERNAL_SERVER_ERROR_RESPONSE_EXAMPLE = ERROR_INTERNAL_SERVER_ERROR_EXAMPLE;
const AVAILABILITY_CHECK_FORBIDDEN_RESPONSE_EXAMPLE = ERROR_FORBIDDEN_EXAMPLE;
