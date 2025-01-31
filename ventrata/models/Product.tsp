import "@typespec/openapi";

import "../../src/models/Product.tsp";
import "../../src/models/DurationUnit.tsp";
import "../../src/models/capabilities/Capability.tsp";

import "./SettlementMethod.tsp";
import "./Option.tsp";

import "./capabilities/ventrata-content/ProductContent.tsp";
import "./capabilities/pricing/ProductPricing.tsp";
import "./capabilities/packages/ProductPackages.tsp";

namespace Ventrata;
using OpenAPI;
using Octo;

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
  options: #[OPTION_EXAMPLE],
};

@example(PRODUCT_EXAMPLE)
model Product extends Octo.Product {
  @extension("x-order", 1)
  @extension("x-go-name", "capabilities")
  @extension("x-internal", true)
  @extension("x-go-type-skip-optional-pointer", true)
  @extension("x-oapi-codegen-only-honour-go-name", true)
  capabilities?: Capability[];

  @extension("x-order", 2) id: string;

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

  options: Option[];
  ...ProductContent;
  ...ProductPricing;
  ...ProductPackages;
}
