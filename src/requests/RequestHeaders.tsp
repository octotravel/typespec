import "../models/capabilities/content/RequestHeadersContent.tsp";

namespace Octo;

using TypeSpec.Http;

model RequestHeaders {
  @doc("A list of the Capabilities (their IDs) initialized with your request.")
  @example("octo/content, octo/pricing")
  @header({
    name: "Octo-Capabilities",
  })
  octoCapabilities: string;

  ...RequestHeadersContent;
}
