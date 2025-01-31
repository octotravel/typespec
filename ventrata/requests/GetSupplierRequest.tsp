import "@typespec/http";
import "@typespec/openapi3";

import "../../src/requests/GetSupplierRequest.tsp";
import "./RequestHeaders.tsp";

namespace Ventrata;
using TypeSpec.Http;

model GetSupplierRequest extends Octo.GetSupplierRequest {
  ...RequestHeaders;
}
