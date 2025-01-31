import "@typespec/openapi";

import "./PickupPoint.tsp";

using OpenAPI;

namespace Ventrata;

const OPTION_PICKUPS_PICKUP_AVAILABLE_DOC = """
  Whether this option has pickup available.
  This field is only present when the capability `octo/pickups` is requested.
  """;
const OPTION_PICKUPS_PICKUP_REQUIRED_DOC = """
  Whether pickup is required for this option.
  This field is only present when the capability `octo/pickups` is requested.
  """;
const OPTION_PICKUPS_PICKUP_POINTS_DOC = """
  A list of pickup points for this option.
  This field is only present when the capability `octo/pickups` is requested.
  """;

const OPTION_PICKUPS_PICKUP_AVAILABLE_EXAMPLE = true;
const OPTION_PICKUPS_PICKUP_REQUIRED_EXAMPLE = true;
const OPTION_PICKUPS_PICKUP_POINTS_EXAMPLE = #[];

const OPTION_PICKUPS_EXAMPLE = #{
  pickupAvailable: OPTION_PICKUPS_PICKUP_AVAILABLE_EXAMPLE,
  pickupRequired: OPTION_PICKUPS_PICKUP_REQUIRED_EXAMPLE,
  pickupPoints: OPTION_PICKUPS_PICKUP_POINTS_EXAMPLE,
};

@example(OPTION_PICKUPS_EXAMPLE)
model OptionPickups {
  @doc(OPTION_PICKUPS_PICKUP_AVAILABLE_DOC)
  @example(OPTION_PICKUPS_PICKUP_AVAILABLE_EXAMPLE)
  @extension(
    "x-capability-data",
    {
      capability: "octo/pickups",
      required: true,
    }
  )
  @extension(
    "x-oapi-codegen-extra-tags",
    {
      capability: "octo/pickups",
      required: true,
    }
  )
  @extension("x-go-type-skip-optional-pointer", true)
  pickupAvailable?: boolean;

  @doc(OPTION_PICKUPS_PICKUP_REQUIRED_DOC)
  @example(OPTION_PICKUPS_PICKUP_REQUIRED_EXAMPLE)
  @extension(
    "x-capability-data",
    {
      capability: "octo/pickups",
      required: true,
    }
  )
  @extension(
    "x-oapi-codegen-extra-tags",
    {
      capability: "octo/pickups",
      required: true,
    }
  )
  @extension("x-go-type-skip-optional-pointer", true)
  pickupRequired?: boolean;

  @doc(OPTION_PICKUPS_PICKUP_REQUIRED_DOC)
  @example(OPTION_PICKUPS_PICKUP_POINTS_EXAMPLE)
  @extension(
    "x-capability-data",
    {
      capability: "octo/pickups",
      required: true,
    }
  )
  @extension(
    "x-oapi-codegen-extra-tags",
    {
      capability: "octo/pickups",
      required: true,
    }
  )
  @extension("x-go-type-skip-optional-pointer", true)
  pickupPoints?: PickupPoint[];
}
