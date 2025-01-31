import "@typespec/openapi";

import "../../src/models/UnitItem.tsp";
import "../../src/models/capabilities/Capability.tsp";

import "./capabilities/pricing/UnitItemPricing.tsp";
import "./capabilities/questions/UnitItemQuestions.tsp";

namespace Ventrata;
using OpenAPI;
using Octo;

const UNIT_ITEM_ID_EXAMPLE = "";
const UNIT_ITEM_ALIAS_EXAMPLE = "";
const UNIT_ITEM_RESELLER_REFERENCE_EXAMPLE = "";
const UNIT_ITEM_SUPPLIER_REFERENCE_EXAMPLE = "";
const UNIT_ITEM_UNIT_ID_EXAMPLE = "";
const UNIT_ITEM_REBOOKING_UUID_EXAMPLE = "";
const UNIT_ITEM_REBOOKING_UNIT_ITEM_UUID_EXAMPLE = "";
const UNIT_ITEM_ORIGINAL_REBOOKING_UUID_EXAMPLE = "";
const UNIT_ITEM_ORIGINAL_REBOOKING_UNIT_ITEM_UUID_EXAMPLE = "";
const UNIT_ITEM_UTC_REBOOKED_AT_EXAMPLE = utcDateTime.fromISO("2021-10-27 23:28:43Z");
const UNIT_ITEM_UTC_REDEEMED_AT_EXAMPLE = utcDateTime.fromISO("2021-10-27 23:28:43Z");
const UNIT_ITEM_UTC_NOSHOWED_AT_EXAMPLE = utcDateTime.fromISO("2021-10-27 23:28:43Z");

const UNIT_ITEM_EXAMPLE = #{
  ...Octo.UNIT_ITEM_ADULT_ON_HOLD,
  id: UNIT_ITEM_ID_EXAMPLE,
  `alias`: UNIT_ITEM_ALIAS_EXAMPLE,
  resellerReference: UNIT_ITEM_RESELLER_REFERENCE_EXAMPLE,
  supplierReference: UNIT_ITEM_SUPPLIER_REFERENCE_EXAMPLE,
  unitId: UNIT_ITEM_UNIT_ID_EXAMPLE,
  rebookingUuid: UNIT_ITEM_REBOOKING_UUID_EXAMPLE,
  rebookingUnitItemUuid: UNIT_ITEM_REBOOKING_UNIT_ITEM_UUID_EXAMPLE,
  originalRebookingUuid: UNIT_ITEM_ORIGINAL_REBOOKING_UUID_EXAMPLE,
  originalRebookingUnitItemUuid: UNIT_ITEM_ORIGINAL_REBOOKING_UNIT_ITEM_UUID_EXAMPLE,
  utcRebookedAt: UNIT_ITEM_UTC_REBOOKED_AT_EXAMPLE,
  utcRedeemedAt: UNIT_ITEM_UTC_REDEEMED_AT_EXAMPLE,
  utcNoshowedAt: UNIT_ITEM_UTC_NOSHOWED_AT_EXAMPLE,
};

@example(UNIT_ITEM_EXAMPLE)
model UnitItem extends Octo.UnitItem {
  @extension("x-order", 1)
  @extension("x-go-name", "capabilities")
  @extension("x-internal", true)
  @extension("x-go-type-skip-optional-pointer", true)
  @extension("x-oapi-codegen-only-honour-go-name", true)
  capabilities?: Capability[];

  /**
   * The id of the unit, this will be unique to the option.
   */
  @example(UNIT_ITEM_ID_EXAMPLE)
  @extension("x-order", 2)
  @format("uuid")
  id?: string;

  /**
   * An alias for the unit.
   */
  @example(UNIT_ITEM_ALIAS_EXAMPLE)
  `alias`: string | null;

  /**
   * A reference the reseller uses to identify the unit within all bookings.
   */
  @example(UNIT_ITEM_RESELLER_REFERENCE_EXAMPLE)
  resellerReference: string | null;

  /**
   * A reference the supplier uses to identify the unit within all bookings.
   */
  @example(UNIT_ITEM_SUPPLIER_REFERENCE_EXAMPLE)
  supplierReference: string | null;

  /**
   * This MUST be a unique identifier within the scope of the option.
   */
  @example(UNIT_ID_EXAMPLE)
  unitId: string;

  /**
   * The id of the unit, this will be unique to the option.
   */
  @example(UNIT_ITEM_REBOOKING_UUID_EXAMPLE)
  @format("uuid")
  rebookingUuid: string | null;

  /**
   * The id of the unit, this will be unique to the option.
   */
  @example(UNIT_ITEM_REBOOKING_UNIT_ITEM_UUID_EXAMPLE)
  @format("uuid")
  rebookingUnitItemUuid: string | null;

  /**
   * The id of the unit, this will be unique to the option.
   */
  @example(UNIT_ITEM_ORIGINAL_REBOOKING_UUID_EXAMPLE)
  @format("uuid")
  originalRebookingUuid: string | null;

  /**
   * The id of the unit, this will be unique to the option.
   */
  @example(UNIT_ITEM_ORIGINAL_REBOOKING_UNIT_ITEM_UUID_EXAMPLE)
  @format("uuid")
  originalRebookingUnitItemUuid: string | null;

  /**
   * The RFC 3339 date in UTC indicating when the ticket was rebooked.
   */
  @example(UNIT_ITEM_UTC_REBOOKED_AT_EXAMPLE)
  @extension("x-go-type", "types.TimeRFC3339")
  @extension(
    "x-go-type-import",
    {
      path: "ventrata-octo-api/pkg/types",
    }
  )
  utcRebookedAt: utcDateTime | null;

  /**
   * The RFC 3339 date in UTC indicating when the ticket was used at the attraction.
   */
  @example(UNIT_ITEM_UTC_REDEEMED_AT_EXAMPLE)
  @extension("x-go-type", "types.TimeRFC3339")
  @extension(
    "x-go-type-import",
    {
      path: "ventrata-octo-api/pkg/types",
    }
  )
  utcRedeemedAt: utcDateTime | null;

  @extension("x-go-type", "types.TimeRFC3339")
  @extension(
    "x-go-type-import",
    {
      path: "ventrata-octo-api/pkg/types",
      type: "string",
      format: "date-time",
      example: "2021-10-27 23:28:43Z",
      description: "The time the ticket was noshowed.",
    }
  )
  @example(UNIT_ITEM_UTC_NOSHOWED_AT_EXAMPLE)
  utcNoshowedAt: utcDateTime | null;

  ...UnitItemPricing;
  ...UnitItemQuestions;
}
