import "@typespec/http";
import "@typespec/openapi3";

import "../schemas/BookingUpdateBody.tsp";
import "./RequestHeaders.tsp";

namespace Octo;
using TypeSpec.Http;

model BookingUpdateRequest {
  @doc("The UUID of the booking")
  @path
  uuid: string;

  @body body: BookingUpdateBody;
  ...RequestHeaders;
}
