import "@typespec/http";

import "../../src/responses/GetSupplierResponse.tsp";
import "../../src/models/Error.tsp";

import "../models/Supplier.tsp";

namespace Ventrata;
using TypeSpec.Http;

model GetSupplierSuccessResponse extends Octo.GetSupplierSuccessResponse {
  @body body: Supplier;
  ...ResponseHeaders;
}

const GET_SUPPLIER_RESPONSE = SUPPLIER_EXAMPLE;

model GetSupplierErrorResponse extends Octo.GetSupplierErrorResponse {
  @statusCode statusCode: 400;
}

const GET_SUPPLIER_UNAUTHORIZED_RESPONSE_EXAMPLE = Octo.GET_SUPPLIER_UNAUTHORIZED_RESPONSE_EXAMPLE;
const GET_SUPPLIER_INTERNAL_SERVER_ERROR_RESPONSE_EXAMPLE = Octo.GET_SUPPLIER_INTERNAL_SERVER_ERROR_RESPONSE_EXAMPLE;
const GET_SUPPLIER_FORBIDDEN_RESPONSE_EXAMPLE = Octo.GET_SUPPLIER_FORBIDDEN_RESPONSE_EXAMPLE;
