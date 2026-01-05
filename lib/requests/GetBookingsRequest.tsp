import "@typespec/http";
import "@typespec/openapi3";

import "./RequestHeaders.tsp";
import "../schemas/GetBookingsQueryParams.tsp";

namespace Octo;

model GetBookingsSchema {
  ...GetBookingsQueryParams;
}

model GetBookingsRequest {
  ...GetBookingsQuery;
  ...RequestHeaders;
}
