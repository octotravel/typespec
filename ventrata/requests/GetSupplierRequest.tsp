import "../../src/requests/GetSupplierRequest.tsp";
import "./RequestHeaders.tsp";

namespace Ventrata;
using TypeSpec.Http;

model GetSupplierRequest extends Octo.GetSupplierRequest {
  ...RequestHeaders;
}
