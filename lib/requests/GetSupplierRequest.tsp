import "@typespec/http";
import "@typespec/openapi3";

import "../models/Supplier.tsp";
import "../models/Error.tsp";
import "./RequestHeaders.tsp";

namespace Octo;

using TypeSpec.Http;

model GetSupplierRequest {
  ...RequestHeaders;
}
