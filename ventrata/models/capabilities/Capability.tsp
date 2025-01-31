import "../../../src/models/capabilities/Capability.tsp";

namespace Ventrata;

enum Capability {
  ...Octo.Capability,
  VENTRATA_CONTENT: "ventrata/content",
}
