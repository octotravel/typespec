import "@typespec/http";
import "@typespec/openapi3";

import "./RequestHeaders.tsp";

namespace Octo;
using TypeSpec.Http;

model GetProductSuccessRequest {
  @doc("The product id")
  @path
  id: string;

  ...RequestHeaders;
}
