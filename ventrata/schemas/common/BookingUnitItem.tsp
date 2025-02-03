import "../../../src/schemas/common/BookingUnitItem.tsp";

namespace Ventrata;

const BOOKING_UNIT_ITEM_RESELLER_REFERENCE_EXAMPLE = "123321";
const BOOKING_UNIT_ITEM_ALIAS_EXAMPLE = "alias";

const BOOKING_UNIT_ITEM_EXAMPLE = #{
  ...Octo.BOOKING_UNITITEM_EXAMPLE,
  resellerReference: BOOKING_UNIT_ITEM_RESELLER_REFERENCE_EXAMPLE,
  `alias`: BOOKING_UNIT_ITEM_ALIAS_EXAMPLE,
};

@example(BOOKING_UNIT_ITEM_EXAMPLE)
model BookingUnitItem extends Octo.BookingUnitItem {
  @format("uuid") uuid?: string;
  unitId: string;

  /**
   * Your reference for this booking. Also known as a Voucher Number.
   */
  @example(BOOKING_UNIT_ITEM_RESELLER_REFERENCE_EXAMPLE)
  resellerReference?: string;

  /**
   * The alias of the unit item.
   */
  @example(BOOKING_UNIT_ITEM_ALIAS_EXAMPLE)
  `alias`?: string;
}
