const TAX_NAME_DOC = "";
const TAX_RETAIL_DOC = "";
const TAX_ORIGINAL_DOC = "";
const TAX_NET_DOC = "";

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
