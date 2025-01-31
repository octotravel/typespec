namespace Ventrata;

/**
 * The type of discount. Possible values are `NONE`, `FULL`, `SPLIT`, `PRORATED` or `MANUAL`
 */
@example(AdjustmentDiscount.FULL)
enum AdjustmentDiscount {
  NONE,
  FULL,
  SPLIT,
  PRORATED,
  MANUAL,
}
