import "@typespec/http";
import "@typespec/openapi3";

import "../models/Product.tsp";
import "../models/Error.tsp";

namespace Octo;
using TypeSpec.Http;

model GetProductsSuccessResponse {
  @statusCode statusCode: 200;
  @body body: Product[];
}

const GET_PRODUCTS_RESPONSE = #[PRODUCT_EXAMPLE];

model GetProductsErrorResponse {
  @statusCode statusCode: 400;
  @body body: ErrorUnauthorized | ErrorInternalServerError | ErrorForbidden;
}

const GET_PRODUCTS_UNAUTHORIZED_RESPONSE_EXAMPLE = ERROR_UNAUTHORIZED_EXAMPLE;
const GET_PRODUCTS_INTERNAL_SERVER_ERROR_RESPONSE_EXAMPLE = ERROR_INTERNAL_SERVER_ERROR_EXAMPLE;
const GET_PRODUCTS_FORBIDDEN_RESPONSE_EXAMPLE = ERROR_FORBIDDEN_EXAMPLE;
