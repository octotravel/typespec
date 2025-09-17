import "../schemas/BookingUpdateBody.tsp";
import "./RequestHeaders.tsp";

namespace Octo;
using TypeSpec.Http;

model BookingUpdatePathParams {
    @doc("The UUID of the booking")
    uuid: string;
}

model BookingUpdateRequest {
  @doc("The UUID of the booking")
  @path
  uuid: BookingUpdatePathParams.uuid;

  @body body: BookingUpdateBody;
  ...RequestHeaders;
}
