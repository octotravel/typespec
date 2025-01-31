import "@typespec/openapi";
import "../../../../src/models/capabilities/pricing/PricingUnit.tsp";
import "./Tax.tsp";
import "./Tax.tsp";

namespace Ventrata;

using OpenAPI;

model PricingUnit extends Octo.PricingUnit {
  @extension("x-go-type", "int64") original: integer;
  @extension("x-go-type", "int64") retail: integer;
  @extension("x-go-type", "int64") net: integer;
  includedTaxes: Ventrata.Tax[];
}
