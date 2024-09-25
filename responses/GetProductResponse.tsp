import "@typespec/http";
import "@typespec/openapi3";

import "../models/Product.tsp";
import "../models/Error.tsp";

using TypeSpec.Http;

model GetProductSuccessResponse {
  @statusCode statusCode: 200;
  @body body: Product;
}

const GET_PRODUCT_RESPONSE = PRODUCT_EXAMPLE;

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
