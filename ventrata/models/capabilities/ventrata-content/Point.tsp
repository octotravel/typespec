import "./PointGroup.tsp";

namespace Ventrata;

const POINT_ID_EXAMPLE = "";
const POINT_INTERNAL_NAME_EXAMPLE = "";
const POINT_TITLE_EXAMPLE = "";
const POINT_SHORT_DESCRIPTION_EXAMPLE = "";
const POINT_POINT_GROUP_EXAMPLE = POINT_GROUP_EXAMPLE;

const POINT_EXAMPLE = #{
  id: POINT_ID_EXAMPLE,
  internalName: POINT_INTERNAL_NAME_EXAMPLE,
  title: POINT_TITLE_EXAMPLE,
  shortDescription: POINT_SHORT_DESCRIPTION_EXAMPLE,
  pointGroup: POINT_POINT_GROUP_EXAMPLE,
};

@example(POINT_EXAMPLE)
model Point {
  /**
   * The ID of the point.
   */
  @example(POINT_ID_EXAMPLE)
  id: string;

  /**
   * The internal name of the point.
   */
  @example(POINT_INTERNAL_NAME_EXAMPLE)
  internalName: string | null;

  /**
   * The title of the point.
   */
  @example(POINT_TITLE_EXAMPLE)
  title: string | null;

  /**
   * The short description of the point. This is preserved for historical compatibility, but will
   * always be `nil`.
   *
   */
  @example(POINT_SHORT_DESCRIPTION_EXAMPLE)
  shortDescription: string | null;

  @example(POINT_POINT_GROUP_EXAMPLE)
  pointGroup: PointGroup;
}
