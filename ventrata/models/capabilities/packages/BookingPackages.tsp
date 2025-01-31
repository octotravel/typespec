import "@typespec/openapi";

import "./PackageInclude.tsp";

namespace Ventrata;

using OpenAPI;

const BOOKING_PACKAGES_IS_PACKAGE_EXAMPLE = true;
const BOOKING_PACKAGES_PACKAGE_INCLUDE_ID_EXAMPLE = "";
const BOOKING_PACKAGES_PACKAGE_INCLUDE_EXAMPLE = null;
const BOOKING_PACKAGES_PACKAGE_BOOKINGS_EXAMPLE = #[];

const BOOKING_PACKAGES_EXAMPLE = #{
  isPackage: BOOKING_PACKAGES_IS_PACKAGE_EXAMPLE,
  packageIncludeId: BOOKING_PACKAGES_PACKAGE_INCLUDE_ID_EXAMPLE,
  packageInclude: BOOKING_PACKAGES_PACKAGE_INCLUDE_EXAMPLE,
  packageBookings: BOOKING_PACKAGES_PACKAGE_BOOKINGS_EXAMPLE,
};

@example(BOOKING_PACKAGES_EXAMPLE)
model BookingPackages {
  /**
   * Whether the booking is a package.
   * This field is only present when octo/packages capability is requested.
   *
   */
  @example(BOOKING_PACKAGES_IS_PACKAGE_EXAMPLE)
  @extension(
    "x-oapi-codegen-extra-tags",
    {
      capability: "octo/packages",
    }
  )
  isPackage?: boolean;

  /**
   * The package ID that identifies the package in the booking system to make this reservation.
   * This field is only present when octo/packages capability is requested.
   *
   */
  @example(BOOKING_PACKAGES_PACKAGE_INCLUDE_ID_EXAMPLE)
  @extension(
    "x-oapi-codegen-extra-tags",
    {
      capability: "octo/packages",
    }
  )
  @format("uuid")
  packageIncludeId?: string;

  /**
   * A package that will be included in the booking.
   * This field is only present when octo/packages capability is requested.
   *
   */
  @example(BOOKING_PACKAGES_PACKAGE_INCLUDE_EXAMPLE)
  @extension(
    "x-oapi-codegen-extra-tags",
    {
      capability: "octo/packages",
    }
  )
  packageInclude?: PackageInclude | null;

  /**
   * An array of bookings that will be included in the package.
   * This field is only present when octo/packages capability is requested.
   *
   */
  @example(BOOKING_PACKAGES_PACKAGE_BOOKINGS_EXAMPLE)
  @extension(
    "x-oapi-codegen-extra-tags",
    {
      capability: "octo/packages",
    }
  )
  packageBookings?: unknown[];
}
