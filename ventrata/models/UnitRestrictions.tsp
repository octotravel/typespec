import "@typespec/openapi";

import "../../src/models/UnitRestrictions.tsp";

namespace Ventrata;
using OpenAPI;

const UNIT_RESTRICTIONS_REQUIRED_EXAMPLE = false;

const UNIT_RESTRICTIONS_EXAMPLE = #{
  ...Octo.UNIT_RESTRICTIONS_EXAMPLE,
  required: UNIT_RESTRICTIONS_REQUIRED_EXAMPLE,
};

@example(UNIT_RESTRICTIONS_EXAMPLE)
model UnitRestrictions extends Octo.UnitRestrictions {
  /**
   * This is whether this unit is required to be chosen for purchase
   */
  @example(UNIT_RESTRICTIONS_REQUIRED_EXAMPLE)
  required: boolean;
}
