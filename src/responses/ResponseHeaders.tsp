import "../models/capabilities/content/ReponseHeadersContent.tsp";

namespace Octo;

using TypeSpec.Http;

model ResponseHeaders {
  @doc("A list of the Capabilities (their IDs) initialized with your request.")
  @example("octo/content, octo/pricing")
  @header({
    name: "Octo-Capabilities",
  })
  octoCapabilities: string;

  ...ResponseHeadersContent;
}
