import "@typespec/openapi";

namespace Ventrata;
using OpenAPI;

const UNIT_CONTENT_TITLE_EXAMPLE = "";
const UNIT_CONTENT_TITLE_PLURAL_EXAMPLE = "";
const UNIT_CONTENT_SUBTITLE_EXAMPLE = null;

const UNIT_CONTENT_EXAMPLE = #{
  title: UNIT_CONTENT_TITLE_EXAMPLE,
  titlePlural: UNIT_CONTENT_TITLE_PLURAL_EXAMPLE,
  subtitle: UNIT_CONTENT_SUBTITLE_EXAMPLE,
};

@example(UNIT_CONTENT_EXAMPLE)
model UnitContent {
  /**
   * Title for this unit. Only present when octo/content capability is requested.
   */
  @extension(
    "x-capability-data",
    {
      capability: "ventrata/content",
      required: true,
    }
  )
  @extension(
    "x-oapi-codegen-extra-tags",
    {
      capability: "ventrata/content",
      required: true,
    }
  )
  title?: string;

  /**
   * Plural title for this unit. Only present when octo/content capability is requested.
   */
  @extension(
    "x-capability-data",
    {
      capability: "ventrata/content",
      required: true,
    }
  )
  @extension(
    "x-oapi-codegen-extra-tags",
    {
      capability: "ventrata/content",
      required: true,
    }
  )
  titlePlural?: string;

  /**
   * Subtitle for this unit. Only present when octo/content capability is requested.
   */
  @extension(
    "x-capability-data",
    {
      capability: "ventrata/content",
      required: true,
    }
  )
  @extension(
    "x-oapi-codegen-extra-tags",
    {
      capability: "ventrata/content",
      required: true,
    }
  )
  subtitle?: string | null;
}
