import "@typespec/http";
import "../../../requests/RequestHeaders.tsp";

namespace Octo;
using TypeSpec.Http;


model ListCapabilitiesRequestHeaders {
  ...RequestHeadersContent;
}

model ListCapabilitiesRequest{
  ...ListCapabilitiesRequestHeaders;
}
