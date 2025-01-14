import "@typespec/http";
import "@typespec/openapi3";

import "../models/Product.tsp";
import "../models/Error.tsp";
import "./ResponseHeaders.tsp";

namespace Octo;
using TypeSpec.Http;

model GetProductsSuccessResponse {
  @statusCode statusCode: 200;
  @body body: Product[];
  ...ResponseHeaders;
}

const GET_PRODUCTS_RESPONSE = #[PRODUCT_EXAMPLE];
const GET_PRODUCTS_CONTENT_RESPONSE = #[PRODUCT_EXAMPLE_CONTENT];
const GET_PRODUCTS_PRICING_PER_UNIT_RESPONSE = #[
  PRODUCT_EXAMPLE_PRICING_PER_UNIT
];
const GET_PRODUCTS_PRICING_PER_BOOKING_RESPONSE = #[
  PRODUCT_EXAMPLE_PRICING_PER_BOOKING
];

model GetProductsErrorResponse {
  @statusCode statusCode: 400;
  @body body: ErrorUnauthorized | ErrorInternalServerError | ErrorForbidden;
}

const GET_PRODUCTS_UNAUTHORIZED_RESPONSE_EXAMPLE = ERROR_UNAUTHORIZED_EXAMPLE;
const GET_PRODUCTS_INTERNAL_SERVER_ERROR_RESPONSE_EXAMPLE = ERROR_INTERNAL_SERVER_ERROR_EXAMPLE;
const GET_PRODUCTS_FORBIDDEN_RESPONSE_EXAMPLE = ERROR_FORBIDDEN_EXAMPLE;
