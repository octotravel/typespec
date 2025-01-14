import "@typespec/http";
import "@typespec/openapi3";

import "../../src/responses/GetSupplierResponse.tsp";
import "../../src/models/Error.tsp";

import "../models/Supplier.tsp";

namespace Ventrata;
using TypeSpec.Http;

model GetSupplierSuccessResponse {
  @statusCode statusCode: 200;
  @body body: Supplier;
  ...ResponseHeaders;
}

const GET_SUPPLIER_RESPONSE = SUPPLIER_EXAMPLE;

model GetSupplierErrorResponse {
  @statusCode statusCode: 400;

  @body
  body: Octo.ErrorUnauthorized | Octo.ErrorInternalServerError | Octo.ErrorForbidden;
}

const GET_SUPPLIER_UNAUTHORIZED_RESPONSE_EXAMPLE = Octo.ERROR_UNAUTHORIZED_EXAMPLE;
const GET_SUPPLIER_INTERNAL_SERVER_ERROR_RESPONSE_EXAMPLE = Octo.ERROR_INTERNAL_SERVER_ERROR_EXAMPLE;
const GET_SUPPLIER_FORBIDDEN_RESPONSE_EXAMPLE = Octo.ERROR_FORBIDDEN_EXAMPLE;
