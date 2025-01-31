import "@typespec/openapi";
import "../../../../src/models/capabilities/pricing/Pricing.tsp";
import "./Tax.tsp";

namespace Ventrata;

using OpenAPI;

model Pricing extends Octo.Pricing {
  @extension("x-go-type", "int64") original: integer;
  @extension("x-go-type", "int64") retail: integer;
  @extension("x-go-type", "int64") net: integer;
  includedTaxes: Ventrata.Tax[];
}
