import "@typespec/http";
import "@typespec/openapi3";

import "../../src/models/Error.tsp";

import "../models/Product.tsp";
import "./ResponseHeaders.tsp";

namespace Ventrata;
using TypeSpec.Http;

model GetProductSuccessResponse {
  @statusCode statusCode: 200;
  @body body: Product;
  ...ResponseHeaders;
}

const GET_PRODUCT_RESPONSE = PRODUCT_EXAMPLE;

model GetProductErrorResponse {
  @statusCode statusCode: 400;
  @body body:
    | Octo.ErrorInvalidProductID
    | Octo.ErrorUnauthorized
    | Octo.ErrorInternalServerError
    | Octo.ErrorForbidden;
}

const GET_PRODUCT_INVALID_PRODUCT_ID_RESPONSE_EXAMPLE = Octo.ERROR_INVALID_PRODUCT_ID_EXAMPLE;
const GET_PRODUCT_UNAUTHORIZED_RESPONSE_EXAMPLE = Octo.ERROR_UNAUTHORIZED_EXAMPLE;
const GET_PRODUCT_INTERNAL_SERVER_ERROR_RESPONSE_EXAMPLE = Octo.ERROR_INTERNAL_SERVER_ERROR_EXAMPLE;
const GET_PRODUCT_FORBIDDEN_RESPONSE_EXAMPLE = Octo.ERROR_FORBIDDEN_EXAMPLE;
