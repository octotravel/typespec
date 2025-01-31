import "@typespec/openapi";
import "../../../../src/models/capabilities/pricing/AvailabilityCalendarPricing.tsp";
import "./Pricing.tsp";
import "./PricingUnit.tsp";

namespace Ventrata;

using OpenAPI;

model AvailabilityCalendarPricing extends Octo.AvailabilityCalendarPricing {
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
