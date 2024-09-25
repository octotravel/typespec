const BASE_ERROR_DOC = "The error code. A table of possible error codes is shown below.";
const BASE_ERROR_MESSAGE_DOC = "A human-readable error message will be translated depending on the language provided by the Accept-Language header.";

model BaseError {
  @doc(BASE_ERROR_DOC)
  error: string;

  @doc(BASE_ERROR_MESSAGE_DOC)
  errorMessage: string;
}

const ERROR_INVALID_PRODUCT_ID_DOC = "Missing or invalid `productId` in the request";

const ERROR_INVALID_PRODUCT_ID_ERROR_EXAMPLE = "INVALID_PRODUCT_ID";
const ERROR_INVALID_PRODUCT_ID_ERROR_MESSAGE_EXAMPLE = "The productId was missing or invalid";
const ERROR_INVALID_PRODUCT_ID_PRODUCT_ID_EXAMPLE = "cc2a6d56-6efe-426f-99c9-6eb10e341565";

const ERROR_INVALID_PRODUCT_ID_EXAMPLE = #{
  error: ERROR_INVALID_PRODUCT_ID_ERROR_EXAMPLE,
  errorMessage: ERROR_INVALID_PRODUCT_ID_ERROR_MESSAGE_EXAMPLE,
  productId: ERROR_INVALID_PRODUCT_ID_PRODUCT_ID_EXAMPLE,
};

@example(ERROR_INVALID_PRODUCT_ID_EXAMPLE)
model ErrorInvalidProductID extends BaseError {
  @doc(ERROR_INVALID_PRODUCT_ID_DOC)
  productId: string;
}

const ERROR_INVALID_OPTION_ID_DOC = "Missing or invalid `optionId` in the request";

const ERROR_INVALID_OPTION_ID_ERROR_EXAMPLE = "INVALID_OPTION_ID";
const ERROR_INVALID_OPTION_ID_ERROR_MESSAGE_EXAMPLE = "The optionId was missing or invalid";
const ERROR_INVALID_OPTION_ID_OPTION_ID_EXAMPLE = "681fea0f-196e-45da-bec7-467bfacb1d87";

const ERROR_INVALID_OPTION_ID_EXAMPLE = #{
  error: ERROR_INVALID_OPTION_ID_ERROR_EXAMPLE,
  errorMessage: ERROR_INVALID_OPTION_ID_ERROR_MESSAGE_EXAMPLE,
  optionId: ERROR_INVALID_OPTION_ID_OPTION_ID_EXAMPLE,
};

@example(ERROR_INVALID_OPTION_ID_EXAMPLE)
model ErrorInvalidOptionID extends BaseError {
  @doc(ERROR_INVALID_OPTION_ID_DOC)
  optionId: string;
}

const ERROR_INVALID_UNIT_ID_DOC = "Missing or invalid `unitId` in the request";

const ERROR_INVALID_UNIT_ID_ERROR_EXAMPLE = "INVALID_UNIT_ID";
const ERROR_INVALID_UNIT_ID_ERROR_MESSAGE_EXAMPLE = "The unitId was missing or invalid";
const ERROR_INVALID_UNIT_ID_UNIT_ID_EXAMPLE = "senior";

const ERROR_INVALID_UNIT_ID_EXAMPLE = #{
  error: ERROR_INVALID_UNIT_ID_ERROR_EXAMPLE,
  errorMessage: ERROR_INVALID_UNIT_ID_ERROR_MESSAGE_EXAMPLE,
  unitId: ERROR_INVALID_UNIT_ID_UNIT_ID_EXAMPLE,
};

@example(ERROR_INVALID_UNIT_ID_EXAMPLE)
model ErrorInvalidUnitID extends BaseError {
  @doc(ERROR_INVALID_UNIT_ID_DOC)
  unitId: string;
}

const ERROR_INVALID_AVAILABILITY_ID_DOC = "Missing or invalid `availabilityId` in the request";

const ERROR_INVALID_AVAILABILITY_ID_ERROR_EXAMPLE = "INVALID_AVAILABILITY_ID";
const ERROR_INVALID_AVAILABILITY_ID_ERROR_MESSAGE_EXAMPLE = "The availabilityId was missing or invalid";
const ERROR_INVALID_AVAILABILITY_ID_AVAILABILITY_ID_EXAMPLE = "2022-03-12T00:00:00+00:00";

const ERROR_INVALID_AVAILABILITY_ID_EXAMPLE = #{
  error: ERROR_INVALID_AVAILABILITY_ID_ERROR_EXAMPLE,
  errorMessage: ERROR_INVALID_AVAILABILITY_ID_ERROR_MESSAGE_EXAMPLE,
  availabilityId: ERROR_INVALID_AVAILABILITY_ID_AVAILABILITY_ID_EXAMPLE,
};

@example(ERROR_INVALID_AVAILABILITY_ID_EXAMPLE)
model ErrorInvalidAvailabilityID extends BaseError {
  @doc(ERROR_INVALID_AVAILABILITY_ID_DOC)
  availabilityId: string;
}

const ERROR_INVALID_BOOKING_UUID_DOC = "Missing or invalid booking UUID, or if you're confirming the booking the booking may have expired already.";

const ERROR_INVALID_BOOKING_UUID_ERROR_EXAMPLE = "INVALID_BOOKING_UUID";
const ERROR_INVALID_BOOKING_UUID_ERROR_MESSAGE_EXAMPLE = "The uuid was already used, missing or invalid";
const ERROR_INVALID_BOOKING_UUID_UUID_EXAMPLE = "bbbb6227-54fc-4c32-9ed7-dc3eb99966ea";

const ERROR_INVALID_BOOKING_UUID_EXAMPLE = #{
  error: ERROR_INVALID_BOOKING_UUID_ERROR_EXAMPLE,
  errorMessage: ERROR_INVALID_BOOKING_UUID_ERROR_MESSAGE_EXAMPLE,
  uuid: ERROR_INVALID_BOOKING_UUID_UUID_EXAMPLE,
};

@example(ERROR_INVALID_BOOKING_UUID_EXAMPLE)
model ErrorInvalidBookingUUID extends BaseError {
  @doc(ERROR_INVALID_BOOKING_UUID_DOC)
  uuid: string;
}

const ERROR_BAD_REQUEST_ERROR_EXAMPLE = "BAD_REQUEST";
const ERROR_BAD_REQUEST_ERROR_MESSAGE_EXAMPLE = "PAYMENT_DECLINED";

const ERROR_BAD_REQUEST_EXAMPLE = #{
  error: ERROR_BAD_REQUEST_ERROR_EXAMPLE,
  errorMessage: ERROR_BAD_REQUEST_ERROR_MESSAGE_EXAMPLE,
};
@example(ERROR_BAD_REQUEST_EXAMPLE)
model ErrorBadRequest extends BaseError {}

const ERROR_FORBIDDEN_ERROR_EXAMPLE = "FORBIDDEN";
const ERROR_FORBIDDEN_ERROR_MESSAGE_EXAMPLE = "You sent an API Key that was invalid or has been revoked by the backend system. Or you're trying to access an endpoint/resource that you do not have access to";

const ERROR_FORBIDDEN_EXAMPLE = #{
  error: ERROR_FORBIDDEN_ERROR_EXAMPLE,
  errorMessage: ERROR_FORBIDDEN_ERROR_MESSAGE_EXAMPLE,
};
@example(ERROR_BAD_REQUEST_EXAMPLE)
model ErrorForbidden extends BaseError {}

const ERROR_INTERNAL_SERVER_ERROR_ERROR_EXAMPLE = "INTERNAL_SERVER_ERROR";
const ERROR_INTERNAL_SERVER_ERROR_ERROR_MESSAGE_EXAMPLE = "There was an un-recoverable error, please try again";

const ERROR_INTERNAL_SERVER_ERROR_EXAMPLE = #{
  error: ERROR_INTERNAL_SERVER_ERROR_ERROR_EXAMPLE,
  errorMessage: ERROR_INTERNAL_SERVER_ERROR_ERROR_MESSAGE_EXAMPLE,
};
@example(ERROR_INTERNAL_SERVER_ERROR_EXAMPLE)
model ErrorInternalServerError extends BaseError {}

const ERROR_UNPROCESSABLE_ENTITY_ERROR_EXAMPLE = "UNPROCESSABLE_ENTITY";
const ERROR_UNPROCESSABLE_ENTITY_ERROR_MESSAGE_EXAMPLE = "The request body is technically correct but cannot be processed for other reasons. e.g. you tried to cancel a booking after the cancellation cutoff had elapsed";

const ERROR_UNPROCESSABLE_ENTITY_EXAMPLE = #{
  error: ERROR_UNPROCESSABLE_ENTITY_ERROR_EXAMPLE,
  errorMessage: ERROR_UNPROCESSABLE_ENTITY_ERROR_MESSAGE_EXAMPLE,
};
@example(ERROR_UNPROCESSABLE_ENTITY_EXAMPLE)
model ErrorUnprocessableEntity extends BaseError {}

const ERROR_UNAUTHORIZED_ERROR_EXAMPLE = "UNAUTHORIZED";
const ERROR_UNAUTHORIZED_ERROR_MESSAGE_EXAMPLE = "You didn't send the API Key in the Authorization header to an endpoint that requires authentication";

const ERROR_UNAUTHORIZED_EXAMPLE = #{
  error: ERROR_UNAUTHORIZED_ERROR_EXAMPLE,
  errorMessage: ERROR_UNAUTHORIZED_ERROR_MESSAGE_EXAMPLE,
};
@example(ERROR_UNAUTHORIZED_EXAMPLE)
model ErrorUnauthorized extends BaseError {}
