import "./Include.tsp";

namespace Ventrata;

const PACKAGE_INCLUDE_TITLE_EXAMPLE = "";
const PACKAGE_INCLUDE_COUNT_EXAMPLE = 1;
const PACKAGE_INCLUDE_INCLUDES_EXAMPLE = #[];

const PACKAGE_INCLUDE_EXAMPLE = #{
  title: PACKAGE_INCLUDE_TITLE_EXAMPLE,
  count: PACKAGE_INCLUDE_COUNT_EXAMPLE,
  includes: PACKAGE_INCLUDE_INCLUDES_EXAMPLE,
};

@example(PACKAGE_INCLUDE_EXAMPLE)
model PackageInclude {
  /**
   * Include group name or product name.
   */
  @example(PACKAGE_INCLUDE_TITLE_EXAMPLE)
  title?: string;

  /**
   * Include count.
   */
  @example(PACKAGE_INCLUDE_COUNT_EXAMPLE)
  count: integer;

  /**
   * An array of includes.
   */
  @example(PACKAGE_INCLUDE_INCLUDES_EXAMPLE)
  includes: Include[];
}
