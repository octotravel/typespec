import "@typespec/http";
import "@typespec/openapi3";

import "../../src/models/Error.tsp";

import "../models/Product.tsp";

namespace Ventrata;
using TypeSpec.Http;

model GetProductsSuccessResponse {
  @statusCode statusCode: 200;
  @body body: Product[];
  ...ResponseHeaders;
}

const GET_PRODUCTS_RESPONSE = #[PRODUCT_EXAMPLE];

model GetProductsErrorResponse {
  @statusCode statusCode: 400;

  @body
  body: Octo.ErrorUnauthorized | Octo.ErrorInternalServerError | Octo.ErrorForbidden;
}

const GET_PRODUCTS_UNAUTHORIZED_RESPONSE_EXAMPLE = Octo.ERROR_UNAUTHORIZED_EXAMPLE;
const GET_PRODUCTS_INTERNAL_SERVER_ERROR_RESPONSE_EXAMPLE = Octo.ERROR_INTERNAL_SERVER_ERROR_EXAMPLE;
const GET_PRODUCTS_FORBIDDEN_RESPONSE_EXAMPLE = Octo.ERROR_FORBIDDEN_EXAMPLE;
