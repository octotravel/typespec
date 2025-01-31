import "@typespec/openapi";

import "../../src/models/OptionRestrictions.tsp";

import "./SettlementMethod.tsp";

import "./capabilities/ventrata-content/ProductContent.tsp";
import "./capabilities/pricing/ProductPricing.tsp";
import "./capabilities/packages/ProductPackages.tsp";

namespace Ventrata;
using OpenAPI;
using Octo;

const OPTION_RESTRICTIONS_MIN_PAX_COUNT_DOC = "The minimum number of pax units that can be purchased in a single booking (null = 0).";
const OPTION_RESTRICTIONS_MAX_PAX_COUNT_DOC = "The maximum number of pax units that can be purchased in a single booking (null = unlimited).";

const OPTION_RESTRICTIONS_MIN_PAX_COUNT_EXAMPLE = 0;
const OPTION_RESTRICTIONS_MAX_PAX_COUNT_EXAMPLE = null;

const OPTION_RESTRICTIONS_EXAMPLE = #{
  ...Octo.OPTION_RESTRICTIONS_EXAMPLE,
  minPaxCount: OPTION_RESTRICTIONS_MIN_PAX_COUNT_EXAMPLE,
  maxPaxCount: OPTION_RESTRICTIONS_MAX_PAX_COUNT_EXAMPLE,
};

@example(OPTION_RESTRICTIONS_EXAMPLE)
model OptionRestrictions extends Octo.OptionRestrictions {
  @doc(OPTION_RESTRICTIONS_MIN_PAX_COUNT_DOC)
  @example(OPTION_RESTRICTIONS_MIN_PAX_COUNT_EXAMPLE)
  minPaxCount: integer | null;

  @doc(OPTION_RESTRICTIONS_MAX_PAX_COUNT_DOC)
  @example(OPTION_RESTRICTIONS_MAX_PAX_COUNT_EXAMPLE)
  maxPaxCount: integer | null;
}
