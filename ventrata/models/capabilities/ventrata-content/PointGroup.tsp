const POINT_GROUP_ID_EXAMPLE = "";
const POINT_GROUP_INTERNAL_NAME_EXAMPLE = "";
const POINT_GROUP_TITLE_EXAMPLE = "";
const POINT_GROUP_SHORT_DESCRIPTION_EXAMPLE = "";

const POINT_GROUP_EXAMPLE = #{
  id: POINT_GROUP_ID_EXAMPLE,
  internalName: POINT_GROUP_INTERNAL_NAME_EXAMPLE,
  title: POINT_GROUP_TITLE_EXAMPLE,
  shortDescription: POINT_GROUP_SHORT_DESCRIPTION_EXAMPLE,
};

@example(POINT_GROUP_EXAMPLE)
model PointGroup {
  /**
   * The ID of the point group.
   */
  @example(POINT_GROUP_ID_EXAMPLE)
  id: string;

  /**
   * The internal name of the point group.
   */
  @example(POINT_GROUP_INTERNAL_NAME_EXAMPLE)
  internalName: string;

  /**
   * The title of the point group.
   */
  @example(POINT_GROUP_TITLE_EXAMPLE)
  title: string;

  /**
   * The short description of the point group.
   */
  @example(POINT_GROUP_SHORT_DESCRIPTION_EXAMPLE)
  shortDescription: string;
}
