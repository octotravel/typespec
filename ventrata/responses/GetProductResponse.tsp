import "@typespec/http";

import "../../src/models/Error.tsp";
import "../../src/responses/GetProductResponse.tsp";

import "../models/Product.tsp";
import "./ResponseHeaders.tsp";

namespace Ventrata;
using TypeSpec.Http;

model GetProductSuccessResponse extends Octo.GetProductSuccessResponse {
  @body body: Product;
  ...ResponseHeaders;
}

const GET_PRODUCT_RESPONSE = PRODUCT_EXAMPLE;

model GetProductErrorResponse extends Octo.GetProductErrorResponse {
  @statusCode statusCode: 400;
}

const GET_PRODUCT_INVALID_PRODUCT_ID_RESPONSE_EXAMPLE = Octo.GET_PRODUCT_INVALID_PRODUCT_ID_RESPONSE_EXAMPLE;
const GET_PRODUCT_UNAUTHORIZED_RESPONSE_EXAMPLE = Octo.GET_PRODUCT_UNAUTHORIZED_RESPONSE_EXAMPLE;
const GET_PRODUCT_INTERNAL_SERVER_ERROR_RESPONSE_EXAMPLE = Octo.GET_PRODUCT_INTERNAL_SERVER_ERROR_RESPONSE_EXAMPLE;
const GET_PRODUCT_FORBIDDEN_RESPONSE_EXAMPLE = Octo.GET_PRODUCT_FORBIDDEN_RESPONSE_EXAMPLE;
