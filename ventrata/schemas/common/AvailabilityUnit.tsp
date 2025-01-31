import "@typespec/openapi";

import "../../../src/schemas/common/AvailabilityUnit.tsp";

namespace Ventrata;
using OpenAPI;

const AVAILABILITY_UNIY_EXAMPLE = Octo.AVILABILITY_UNIT_EXAMPLE;

@example(AVAILABILITY_UNIY_EXAMPLE)
model AvailabilityUnit extends Octo.AvailabilityUnit {
  @extension("x-order", 1) id: string;
}
