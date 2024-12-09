import "@typespec/http";
import "@typespec/openapi3";

import "../models/Supplier.tsp";
import "../models/Error.tsp";


namespace Octo;

using TypeSpec.Http;

model GetSupplierSuccessResponse {
  @statusCode statusCode: 200;
  @body body: Supplier;
}

const GET_SUPPLIER_RESPONSE = SUPPLIER_EXAMPLE;

model GetSupplierErrorResponse {
  @statusCode statusCode: 400;
  @body body: ErrorUnauthorized | ErrorInternalServerError | ErrorForbidden;
}

const GET_SUPPLIER_UNAUTHORIZED_RESPONSE_EXAMPLE = ERROR_UNAUTHORIZED_EXAMPLE;
const GET_SUPPLIER_INTERNAL_SERVER_ERROR_RESPONSE_EXAMPLE = ERROR_INTERNAL_SERVER_ERROR_EXAMPLE;
const GET_SUPPLIER_FORBIDDEN_RESPONSE_EXAMPLE = ERROR_FORBIDDEN_EXAMPLE;
