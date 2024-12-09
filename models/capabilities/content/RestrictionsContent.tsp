import "@typespec/openapi";

const RESTRICTIONS_CONTENT_MIN_HEIHGT_DOC = "Minimum height required for this unit (e.g., for amusement park rides).";
const RESTRICTIONS_CONTENT_MAX_HEIHGT_DOC = "Maximum height allowed.";
const RESTRICTIONS_CONTENT_HEIGHT_UNIT_DOC = "Unit of height measurement (e.g., \"cm\" or \"in\") used for values of minHeight, maxHeight.";
const RESTRICTIONS_CONTENT_MIN_WEIGHT_DOC = "Minimum weight required.";
const RESTRICTIONS_CONTENT_MAX_WEIGHT_DOC = "Maximum weight allowed.";
const RESTRICTIONS_CONTENT_WEIGHT_UNIT_DOC = "Unit of weight measurement (e.g., \"kg\" or \"lb\") used for values of minWeight, maxWeight.";

const RESTRICTIONS_CONTENT_MIN_HEIHGT_EXAMPLE = 120;
const RESTRICTIONS_CONTENT_MAX_HEIHGT_EXAMPLE = 220;
const RESTRICTIONS_CONTENT_HEIGHT_UNIT_EXAMPLE = "";
const RESTRICTIONS_CONTENT_MIN_WEIGHT_EXAMPLE = 50;
const RESTRICTIONS_CONTENT_MAX_WEIGHT_EXAMPLE = 120;
const RESTRICTIONS_CONTENT_WEIGHT_UNIT_EXAMPLE = "";

const RESTRICTIONS_CONTENT_EXAMPLE = #{
  maxHeight: RESTRICTIONS_CONTENT_MAX_HEIHGT_EXAMPLE,
  minHeight: RESTRICTIONS_CONTENT_MIN_HEIHGT_EXAMPLE,
  heightUnit: RESTRICTIONS_CONTENT_HEIGHT_UNIT_EXAMPLE,
  maxWeight: RESTRICTIONS_CONTENT_MAX_WEIGHT_EXAMPLE,
  minWeight: RESTRICTIONS_CONTENT_MIN_WEIGHT_EXAMPLE,
  weightUnit: RESTRICTIONS_CONTENT_WEIGHT_UNIT_EXAMPLE,
};

@example(RESTRICTIONS_CONTENT_EXAMPLE)
model RestrictionsContent {
  @doc(RESTRICTIONS_CONTENT_MIN_HEIHGT_DOC)
  @example(RESTRICTIONS_CONTENT_MAX_HEIHGT_EXAMPLE)
  @TypeSpec.OpenAPI.extension(
    "x-capability-data",
    {
      capability: "octo/content",
      required: false,
    }
  )
  minHeight?: integer;

  @doc(RESTRICTIONS_CONTENT_MAX_HEIHGT_DOC)
  @example(RESTRICTIONS_CONTENT_MIN_HEIHGT_EXAMPLE)
  @TypeSpec.OpenAPI.extension(
    "x-capability-data",
    {
      capability: "octo/content",
      required: false,
    }
  )
  maxHeight?: integer;

  @doc(RESTRICTIONS_CONTENT_HEIGHT_UNIT_DOC)
  @example(RESTRICTIONS_CONTENT_HEIGHT_UNIT_EXAMPLE)
  @TypeSpec.OpenAPI.extension(
    "x-capability-data",
    {
      capability: "octo/content",
      required: false,
    }
  )
  heightUnit?: string;

  @doc(RESTRICTIONS_CONTENT_MIN_WEIGHT_DOC)
  @example(RESTRICTIONS_CONTENT_MIN_WEIGHT_EXAMPLE)
  @TypeSpec.OpenAPI.extension(
    "x-capability-data",
    {
      capability: "octo/content",
      required: false,
    }
  )
  minWeight?: integer;

  @doc(RESTRICTIONS_CONTENT_MAX_WEIGHT_DOC)
  @example(RESTRICTIONS_CONTENT_MAX_WEIGHT_EXAMPLE)
  @TypeSpec.OpenAPI.extension(
    "x-capability-data",
    {
      capability: "octo/content",
      required: false,
    }
  )
  maxWeight?: integer;

  @doc(RESTRICTIONS_CONTENT_WEIGHT_UNIT_DOC)
  @example(RESTRICTIONS_CONTENT_WEIGHT_UNIT_EXAMPLE)
  @TypeSpec.OpenAPI.extension(
    "x-capability-data",
    {
      capability: "octo/content",
      required: false,
    }
  )
  weightUnit?: string;
}
