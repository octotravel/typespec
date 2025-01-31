import "@typespec/openapi";

import "./PickupPoint.tsp";

using OpenAPI;

namespace Ventrata;

const AVAILABILITY_PICKUPS_PICKUP_AVAILABLE_DOC = """
  Whether this availability has pickup available.
  This field is only present when the capability `octo/pickups` is requested.
  """;
const AVAILABILITY_PICKUPS_PICKUP_REQUIRED_DOC = """
  Whether pickup is required for this availability.
  This field is only present when the capability `octo/pickups` is requested.
  """;
const AVAILABILITY_PICKUPS_PICKUP_POINTS_DOC = """
  A list of pickup points for this availability.
  This field is only present when the capability `octo/pickups` is requested.
  """;

const AVAILABILITY_PICKUPS_PICKUP_AVAILABLE_EXAMPLE = true;
const AVAILABILITY_PICKUPS_PICKUP_REQUIRED_EXAMPLE = true;
const AVAILABILITY_PICKUPS_PICKUP_POINTS_EXAMPLE = #[];

const AVAILABILITY_PICKUPS_EXAMPLE = #{
  pickupAvailable: AVAILABILITY_PICKUPS_PICKUP_AVAILABLE_EXAMPLE,
  pickupRequired: AVAILABILITY_PICKUPS_PICKUP_REQUIRED_EXAMPLE,
  pickupPoints: AVAILABILITY_PICKUPS_PICKUP_POINTS_EXAMPLE,
};

@example(AVAILABILITY_PICKUPS_EXAMPLE)
model AvailabilityPickups {
  @doc(AVAILABILITY_PICKUPS_PICKUP_AVAILABLE_DOC)
  @example(AVAILABILITY_PICKUPS_PICKUP_AVAILABLE_EXAMPLE)
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

  @doc(AVAILABILITY_PICKUPS_PICKUP_REQUIRED_DOC)
  @example(AVAILABILITY_PICKUPS_PICKUP_REQUIRED_EXAMPLE)
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

  @doc(AVAILABILITY_PICKUPS_PICKUP_REQUIRED_DOC)
  @example(AVAILABILITY_PICKUPS_PICKUP_POINTS_EXAMPLE)
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
