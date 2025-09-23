import "@typespec/http";
import "@typespec/openapi3";

import "./RequestHeaders.tsp";

namespace Octo;
using TypeSpec.Http;

model GetProductPathParams {
    @doc("The id of the product")
    id: string;
}

model GetProductRequest {
  @doc("The product id")
  @path
  id: GetProductPathParams.id;

  ...RequestHeaders;
}
