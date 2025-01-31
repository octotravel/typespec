import "@typespec/http";
import "@typespec/openapi3";

import "../../src/models/Error.tsp";
import "../../src/responses/GetProductsResponse.tsp";

import "../models/Product.tsp";

namespace Ventrata;
using TypeSpec.Http;

model GetProductsSuccessResponse extends Octo.GetProductsSuccessResponse {
  @body body: Product[];
  ...ResponseHeaders;
}

const GET_PRODUCTS_RESPONSE = #[PRODUCT_EXAMPLE];

model GetProductsErrorResponse extends Octo.GetProductsErrorResponse {}

const GET_PRODUCTS_UNAUTHORIZED_RESPONSE_EXAMPLE = Octo.GET_PRODUCTS_UNAUTHORIZED_RESPONSE_EXAMPLE;
const GET_PRODUCTS_INTERNAL_SERVER_ERROR_RESPONSE_EXAMPLE = Octo.GET_PRODUCTS_INTERNAL_SERVER_ERROR_RESPONSE_EXAMPLE;
const GET_PRODUCTS_FORBIDDEN_RESPONSE_EXAMPLE = Octo.GET_PRODUCTS_FORBIDDEN_RESPONSE_EXAMPLE;
