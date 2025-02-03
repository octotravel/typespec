import "../../Product.tsp";
import "../../Option.tsp";
import "../../DefaultableId.tsp";

namespace Ventrata;

const INCLUDE_ID_EXAMPLE = "";
const INCLUDE_REQUIRED_EXAMPLE = false;
const INCLUDE_LIMIT_EXAMPLE = 2;
const INCLUDE_VALIDATE_DAYS_EXAMPLE = 3;
const INCLUDE_PRODUCT_ID_EXAMPLE = "";
const INCLUDE_PRODUCT_EXAMPLE = null;
const INCLUDE_OPTION_ID_EXAMPLE = "";
const INCLUDE_OPTION_EXAMPLE = null;

const INCLUDE_EXAMPLE = #{
  id: INCLUDE_ID_EXAMPLE,
  required: INCLUDE_REQUIRED_EXAMPLE,
  limit: INCLUDE_LIMIT_EXAMPLE,
  validityDays: INCLUDE_VALIDATE_DAYS_EXAMPLE,
  productId: INCLUDE_PRODUCT_ID_EXAMPLE,
  product: INCLUDE_PRODUCT_EXAMPLE,
  optionId: INCLUDE_OPTION_ID_EXAMPLE,
  option: INCLUDE_OPTION_EXAMPLE,
};

@example(INCLUDE_EXAMPLE)
model Include {
  /**
   * The ID of the include.
   */
  @example(INCLUDE_ID_EXAMPLE)
  @format("uuid")
  id: string;

  /**
   * Whether the include is required.
   */
  @example(INCLUDE_REQUIRED_EXAMPLE)
  required: boolean;

  /**
   * The limit of the include.
   */
  @example(INCLUDE_LIMIT_EXAMPLE)
  limit: integer;

  /**
   * The validity days of the include.
   */
  @example(INCLUDE_VALIDATE_DAYS_EXAMPLE)
  validityDays?: integer;

  /**
   * The product ID of the include.
   */
  @example(INCLUDE_PRODUCT_ID_EXAMPLE)
  @format("uuid")
  productId: string;

  @example(INCLUDE_PRODUCT_EXAMPLE)
  product: Product | null;

  @example(INCLUDE_OPTION_ID_EXAMPLE)
  optionId: DefaultableID;

  @example(INCLUDE_OPTION_EXAMPLE)
  option: Option | null;
}
