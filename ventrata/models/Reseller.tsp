namespace Ventrata;

const RESELLER_ID_DOC = "A unique ID / UUID generated to identify the reseller.";
const RESELLER_NAME_DOC = "Reseller name.";
const RESELLER_REFERENCE_DOC = "Reseller reference.";
const RESELLER_TAGS_DOC = "An array of tags that can be used to filter.";

const RESELLER_ID_EXAMPLE = "1223";
const RESELLER_NAME_EXAMPLE = "";
const RESELLER_REFERENCE_EXAMPLE = "";
const RESELLER_TAGS_EXAMPLE = #[];

const RESELLER_EXAMPLE = #{
  id: RESELLER_ID_EXAMPLE,
  name: RESELLER_NAME_EXAMPLE,
  reference: RESELLER_REFERENCE_EXAMPLE,
  tags: RESELLER_TAGS_EXAMPLE,
};

@example(RESELLER_EXAMPLE)
model Reseller {
  @doc(RESELLER_ID_DOC)
  @example(RESELLER_ID_EXAMPLE)
  @format("uuid")
  id: string;

  @doc(RESELLER_NAME_DOC)
  @example(RESELLER_NAME_EXAMPLE)
  name: string;

  @doc(RESELLER_REFERENCE_DOC)
  @example(RESELLER_REFERENCE_EXAMPLE)
  reference: string | null;

  @doc(RESELLER_TAGS_DOC)
  @example(RESELLER_TAGS_EXAMPLE)
  tags: string[];
}
