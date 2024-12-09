import "@typespec/openapi3";

import "../../src/models/Product.tsp";
import "../../src/models/DurationUnit.tsp";

import "./SettlementMethod.tsp";

namespace Ventrata;

const PRODUCT_TAGS_DOC = "";
const PRODUCT_SETTLEMENT_METHOD_DOC = "";
const PRODUCT_FREESALE_DURATION_AMOUNT_DOC = "";
const PRODUCT_FREESALE_DURATION_UNIT_DOC = "";

const PRODUCT_TAGS_EXAMPLE = #[];
const PRODUCT_SETTLEMENT_METHOD_EXAMPLE = SettlementMethod.DIRECT;
const PRODUCT_FREESALE_DURATION_AMOUNT_EXAMPLE = 2;
const PRODUCT_FREESALE_DURATION_UNIT_EXAMPLE = Octo.DurationUnit.HOUR;

const PRODUCT_EXAMPLE = #{
    ...Octo.PRODUCT_EXAMPLE,
    tags: PRODUCT_TAGS_EXAMPLE,
    settlementMethods: PRODUCT_SETTLEMENT_METHOD_EXAMPLE,
    freesaleDurationAmount: PRODUCT_FREESALE_DURATION_AMOUNT_EXAMPLE,
    freesaleDurationUnit: PRODUCT_FREESALE_DURATION_UNIT_EXAMPLE,

};

@example(PRODUCT_EXAMPLE)
model Product extends Octo.Product {
    @doc(PRODUCT_TAGS_DOC)
  @example(PRODUCT_TAGS_EXAMPLE)
    tags: string[];
    @doc(PRODUCT_SETTLEMENT_METHOD_DOC)
  @example(PRODUCT_SETTLEMENT_METHOD_EXAMPLE)
    settlementMethods: SettlementMethod;
    @doc(PRODUCT_FREESALE_DURATION_AMOUNT_DOC)
  @example(PRODUCT_FREESALE_DURATION_AMOUNT_EXAMPLE)
    freesaleDurationAmount: integer;
    @doc(PRODUCT_FREESALE_DURATION_UNIT_DOC)
  @example(PRODUCT_FREESALE_DURATION_UNIT_EXAMPLE)
    freesaleDurationUnit: Octo.DurationUnit;
}

