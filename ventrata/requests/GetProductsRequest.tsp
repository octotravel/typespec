import "../../src/requests/GetProductsRequest.tsp";
import "./RequestHeaders.tsp";

namespace Ventrata;
using TypeSpec.Http;

model GetProductsRequest extends Octo.GetProductsRequest {
  ...RequestHeaders;
}
