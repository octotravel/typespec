namespace Octo;

const TAX_NAME_DOC = "The name of the tax or fee, such as \"VAT\", \"City Tax\", or \"Service Charge\". This field provides clear labeling of the tax or fee being applied, making the pricing structure easier to interpret.";
const TAX_RETAIL_DOC = "The value of the tax or fee included in the retail price, expressed in the same currency as the pricingFrom.currency. This value indicates the portion of the end-customer price attributable to the specific tax or fee.";
const TAX_ORIGINAL_DOC = "";
const TAX_NET_DOC = "The value of the tax or fee included in the net price, expressed in the same currency as the pricingFrom.currency. This value indicates the portion of the reseller’s cost attributable to the specific tax or fee.";

const TAX_NAME_EXAMPLE = "VAT 10";
const TAX_RETAIL_EXAMPLE = 700;
const TAX_ORIGINAL_EXAMPLE = 700;
const TAX_NET_EXAMPLE = 400;

const TAX_EXAMPLE = #{
  name: TAX_NAME_EXAMPLE,
  retail: TAX_RETAIL_EXAMPLE,
  original: TAX_ORIGINAL_EXAMPLE,
  net: TAX_NET_EXAMPLE,
};

@example(TAX_EXAMPLE)
model Tax {
  @doc(TAX_NAME_DOC)
  @example(TAX_NAME_EXAMPLE)
  name: string;

  @doc(TAX_RETAIL_DOC)
  @example(TAX_RETAIL_EXAMPLE)
  retail: integer;

  @doc(TAX_ORIGINAL_DOC)
  @example(TAX_ORIGINAL_EXAMPLE)
  original: integer;

  @doc(TAX_NET_DOC)
  @example(TAX_NET_EXAMPLE)
  net: integer | null;
}
