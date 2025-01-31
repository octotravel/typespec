import "@typespec/openapi";

import "../../src/models/Availability.tsp";
import "../../src/models/capabilities/Capability.tsp";
import "./capabilities/pickups/AvailabilityPickups.tsp";
import "./capabilities/pricing/AvailabilityPricing.tsp";

using OpenAPI;

namespace Ventrata;

const AVAILABILITY_PAX_COUNT_DOC = "The number of pax that can be booked on this availability.";
const AVAILABILITY_MAX_PAX_COUNT_DOC = "Maximum number of pax that can be sold within one booking on this day / slot.";

const AVAILABILITY_PAX_COUNT_EXAMPLE = null;
const AVAILABILITY_MAX_PAX_COUNT_EXAMPLE = null;

const AVAILABILITY_EXAMPLE = #{
  ...Octo.AVAILABILITY_EXAMPLE,
  paxCount: AVAILABILITY_PAX_COUNT_EXAMPLE,
  maxPaxCount: AVAILABILITY_MAX_PAX_COUNT_EXAMPLE,
};

@example(AVAILABILITY_EXAMPLE)
model Availability extends Octo.Availability {
  @extension("x-order", 1)
  @extension("x-go-name", "capabilities")
  @extension("x-internal", true)
  @extension("x-go-type-skip-optional-pointer", true)
  @extension("x-oapi-codegen-only-honour-go-name", true)
  capabilities?: Octo.Capability[];

  @extension("x-order", 2) id: string;

  @extension("x-go-type", "types.TimeRFC3339")
  @extension(
    "x-go-type-import",
    {
      path: "ventrata-octo-api/pkg/types",
    }
  )
  utcCutoffAt: utcDateTime;

  @extension("x-go-type", "float64") vacancies: integer | null;
  @extension("x-go-type", "float64") capacity: integer | null;
  @extension("x-go-type", "float64") paxCount: integer | null;
  @extension("x-go-type", "float64") maxUnits: integer | null;
  @extension("x-go-type", "float64") maxPaxCount: integer | null;
  ...AvailabilityPickups;
  ...AvailabilityPricing;
}
