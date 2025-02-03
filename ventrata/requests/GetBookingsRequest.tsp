import "../../src/requests/GetBookingsRequest.tsp";
import "./RequestHeaders.tsp";

namespace Ventrata;
using TypeSpec.Http;

model GetBookingsRequest extends Octo.GetBookingsRequest {
  ...RequestHeaders;
}
