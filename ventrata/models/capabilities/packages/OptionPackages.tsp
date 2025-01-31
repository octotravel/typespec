import "@typespec/openapi";

import "./PackageInclude.tsp";

namespace Ventrata;

using OpenAPI;

const OPTION_PACKAGES_PACKAGE_INCLDES_DOC = "Is on the object when Pricing capability is requested. Indicates whether the product is a package or not.";

const OPTION_PACKAGES_PACKAGE_INCLDES_EXAMPLE = #[PACKAGE_INCLUDE_EXAMPLE];

const OPTION_PACKAGES_EXAMPLE = #{
  packageIncludes: OPTION_PACKAGES_PACKAGE_INCLDES_EXAMPLE,
};

@example(OPTION_PACKAGES_EXAMPLE)
model OptionPackages {
  @example(OPTION_PACKAGES_PACKAGE_INCLDES_EXAMPLE)
  @extension(
    "x-capability-data",
    {
      capability: "octo/packages",
      required: true,
    }
  )
  @extension(
    "x-oapi-codegen-extra-tags",
    {
      capability: "octo/packages",
      required: true,
    }
  )
  @extension("x-go-type-skip-optional-pointer", true)
  packageIncludes?: PackageInclude[];
}
