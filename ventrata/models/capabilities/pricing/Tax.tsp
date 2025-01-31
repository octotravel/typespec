import "@typespec/openapi";
import "../../../../src/models/capabilities/pricing/Tax.tsp";

namespace Ventrata;

using OpenAPI;

@example(Octo.TAX_EXAMPLE)
model Tax extends Octo.Tax {
  @extension("x-go-type", "int64") retail: integer;
  @extension("x-go-type", "int64") original: integer;
  @extension("x-go-type", "int64") net: integer | null;
}
