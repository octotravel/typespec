import "@typespec/http";

import "../../../responses/ResponseHeaders.tsp";
import "../Capability.tsp";

namespace Octo;
using TypeSpec.Http;

model ListCapabilitiesResponse {
  @statusCode statusCode: 200;
  @body body: Capability[];
  ...ResponseHeaders;
}

const LIST_CAPABILITIES_RESPONSE = #[CAPABILITY_EXAMPLE];

