import "@typespec/http";
import "@typespec/openapi3";

import "./RequestHeaders.tsp";

namespace Ventrata;
using TypeSpec.Http;

model GetProductRequest {
  @doc("The product id")
  @path
  id: string;

  ...RequestHeaders;
}
