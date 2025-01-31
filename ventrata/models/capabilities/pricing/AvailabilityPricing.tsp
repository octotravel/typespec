import "@typespec/openapi";
import "../../../../src/models/capabilities/pricing/AvailabilityPricing.tsp";
import "./Pricing.tsp";
import "./PricingUnit.tsp";

namespace Ventrata;

using OpenAPI;

model AvailabilityPricing extends Octo.AvailabilityPricing {
  @extension(
    "x-capability-data",
    {
      capability: "octo/pricing",
      required: true,
    }
  )
  @extension(
    "x-oapi-codegen-extra-tags",
    {
      capability: "octo/pricing",
      required: true,
    }
  )
  unitPricing?: PricingUnit[];

  @extension(
    "x-capability-data",
    {
      capability: "octo/pricing",
      required: true,
    }
  )
  @extension(
    "x-oapi-codegen-extra-tags",
    {
      capability: "octo/pricing",
      required: true,
    }
  )
  pricing?: Pricing[];
}
