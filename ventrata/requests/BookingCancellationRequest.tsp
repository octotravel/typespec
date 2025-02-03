import "../../src/requests/BookingCancellationRequest.tsp";
import "../schemas/BookingCancellationBody.tsp";
import "./RequestHeaders.tsp";

namespace Ventrata;
using TypeSpec.Http;

model BookingCancellationRequest extends Octo.BookingCancellationRequest {
  @body body: BookingCancellationBody;
  ...RequestHeaders;
}
