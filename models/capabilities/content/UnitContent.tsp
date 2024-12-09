import "@typespec/openapi";

const UNIT_CONTENT_TITLE_DOC = "The public-facing name of the unit, designed to be displayed to customers. This should clearly convey the nature of the unit, such as \"Adult\" or \"Student\".";
const UNIT_CONTENT_SHORT_DESCRIPTION_DOC = "A concise summary of the unit, offering key details to customers. This helps in differentiating units and highlighting important characteristics.";

const UNIT_CONTENT_TITLE_EXAMPLE = "";
const UNIT_CONTENT_SHORT_DESCRIPTION_EXAMPLE = "";

const UNIT_CONTENT_EXAMPLE = #{
  title: UNIT_CONTENT_TITLE_EXAMPLE,
  shortDescription: UNIT_CONTENT_SHORT_DESCRIPTION_EXAMPLE,
};

model UnitContent {
  @doc(UNIT_CONTENT_TITLE_DOC)
  @example(UNIT_CONTENT_TITLE_EXAMPLE)
  @TypeSpec.OpenAPI.extension(
    "x-capability-data",
    {
      capability: "octo/content",
      required: true,
    }
  )
  title?: string | null;

  @doc(UNIT_CONTENT_SHORT_DESCRIPTION_DOC)
  @example(UNIT_CONTENT_SHORT_DESCRIPTION_EXAMPLE)
  @TypeSpec.OpenAPI.extension(
    "x-capability-data",
    {
      capability: "octo/content",
      required: true,
    }
  )
  shortDescription?: string;
}
