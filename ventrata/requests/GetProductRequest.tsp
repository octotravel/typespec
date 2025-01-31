import "@typespec/http";
import "@typespec/openapi3";

import "../../src/requests/GetProductRequest.tsp";
import "./RequestHeaders.tsp";

namespace Ventrata;
using TypeSpec.Http;

model GetProductRequest extends Octo.GetProductRequest {
  ...RequestHeaders;
}
