import "./AdjustmentDiscount.tsp";
import "./AdjustmentPer.tsp";

import "@typespec/openapi";

namespace Ventrata;

using OpenAPI;

const BOOKING_ADJUSTMENT_PER_DOC = "The amount of the adjustment.";
const BOOKING_ADJUSTMENT_AMOUNT_DOC = "The amount of the adjustment.";
const BOOKING_ADJUSTMENT_NOTES_DOC = "Optional notes for the adjustment.";
const BOOKING_ADJUSTMENT_NET_DISCOUNT_DOC = "";

const BOOKING_ADJUSTMENT_PER_EXAMPLE = AdjustmentPer.UNIT;
const BOOKING_ADJUSTMENT_AMOUNT_EXAMPLE = 10;
const BOOKING_ADJUSTMENT_NOTES_EXAMPLE = "";
const BOOKING_ADJUSTMENT_NET_DISCOUNT_EXAMPLE = AdjustmentDiscount.FULL;

const BOOKING_ADJUSTMENT_EXAMPLE = #{
  per: BOOKING_ADJUSTMENT_PER_EXAMPLE,
  amount: BOOKING_ADJUSTMENT_AMOUNT_EXAMPLE,
  notes: BOOKING_ADJUSTMENT_NOTES_EXAMPLE,
  netDiscount: BOOKING_ADJUSTMENT_NET_DISCOUNT_EXAMPLE,
};

model BookingAdjustment {
  @doc(BOOKING_ADJUSTMENT_PER_DOC)
  @example(BOOKING_ADJUSTMENT_PER_EXAMPLE)
  per: AdjustmentPer;

  @doc(BOOKING_ADJUSTMENT_AMOUNT_DOC)
  @example(BOOKING_ADJUSTMENT_AMOUNT_EXAMPLE)
  @extension("x-go-type", "decimal.Decimal")
  @extension(
    "x-go-type-import",
    {
      path: "github.com/shopspring/decimal",
    }
  )
  amount: numeric;

  @doc(BOOKING_ADJUSTMENT_NOTES_DOC)
  @example(BOOKING_ADJUSTMENT_NOTES_EXAMPLE)
  notes: string | null;

  @doc(BOOKING_ADJUSTMENT_NET_DISCOUNT_DOC)
  @example(BOOKING_ADJUSTMENT_NET_DISCOUNT_EXAMPLE)
  netDiscount: AdjustmentDiscount;
}
