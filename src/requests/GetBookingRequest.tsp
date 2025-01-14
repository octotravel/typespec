import "@typespec/http";
import "@typespec/openapi3";

import "../schemas/GetBookingsSchema.tsp";
import "./RequestHeaders.tsp";

namespace Octo;
using TypeSpec.Http;

model GetBookingRequest {
  @doc("The UUID of the booking")
  @path
  uuid: string;

  ...RequestHeaders;
}
