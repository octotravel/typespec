import "@typespec/openapi";

namespace Ventrata;

using OpenAPI;

const PRODUCT_PACKAGES_IS_PACKAGE_DOC = "Is on the object when Pricing capability is requested. Indicates whether the product is a package or not.";
const PRODUCT_PACKAGES_PACKAGE_BOOKING_AVAILABILITY_REQUIRED_DOC = "Is on the object when Pricing capability is requested. Indicates whether the package booking requires availability to be checked.";

const PRODUCT_PACKAGES_IS_PACKAGE_EXAMPLE = true;
const PRODUCT_PACKAGES_PACKAGE_BOOKING_AVAILABILITY_REQUIRED_EXAMPLE = true;

const PRODUCT_PACKAGES_EXAMPLE = #{
  isPackage: PRODUCT_PACKAGES_IS_PACKAGE_EXAMPLE,
  packageBookingAvailabilityRequired: PRODUCT_PACKAGES_PACKAGE_BOOKING_AVAILABILITY_REQUIRED_EXAMPLE,
};

@example(PRODUCT_PACKAGES_EXAMPLE)
model ProductPackages {
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
  isPackage?: boolean;

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
  packageBookingAvailabilityRequired?: boolean;
}
