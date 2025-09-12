import "@typespec/http";
import "@typespec/openapi3";

import "../models/Product.tsp";
import "../models/Error.tsp";
import "./ResponseHeaders.tsp";

namespace Octo;
using TypeSpec.Http;

model GetProductSuccessResponse {
  @statusCode statusCode: 200;
  @body body: Product;
  ...ResponseHeaders;
}

const GET_PRODUCT_RESPONSE = PRODUCT_EXAMPLE;
const GET_PRODUCT_CONTENT_RESPONSE = PRODUCT_EXAMPLE_CONTENT;
const GET_PRODUCT_PRICING_PER_UNIT_RESPONSE = PRODUCT_EXAMPLE_PRICING_PER_UNIT;
const GET_PRODUCT_PRICING_PER_BOOKING_RESPONSE = PRODUCT_EXAMPLE_PRICING_PER_BOOKING;

model GetProductErrorResponse {
  @statusCode statusCode: 400;
  @body body:
    | ErrorInvalidProductID
    | ErrorUnauthorized
    | ErrorInternalServerError
    | ErrorForbidden;
}

const GET_PRODUCT_INVALID_PRODUCT_ID_RESPONSE_EXAMPLE = ERROR_INVALID_PRODUCT_ID_EXAMPLE;
const GET_PRODUCT_UNAUTHORIZED_RESPONSE_EXAMPLE = ERROR_UNAUTHORIZED_EXAMPLE;
const GET_PRODUCT_INTERNAL_SERVER_ERROR_RESPONSE_EXAMPLE = ERROR_INTERNAL_SERVER_ERROR_EXAMPLE;
const GET_PRODUCT_FORBIDDEN_RESPONSE_EXAMPLE = ERROR_FORBIDDEN_EXAMPLE;
