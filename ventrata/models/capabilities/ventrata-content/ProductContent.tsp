import "@typespec/openapi";

import "./Destination.tsp";
import "./Image.tsp";
import "../../../../src/models/capabilities/content/FAQ.tsp";

namespace Ventrata;
using OpenAPI;
using Octo;

const PRODUCT_CONTENT_COUNTRY_DOC = "Country code for this product. Only present when ventrata/content capability is requested.";
const PRODUCT_CONTENT_LOCATION_DOC = "Location for this product. Only present when ventrata/content capability is requested.";
const PRODUCT_CONTENT_DESTINATION_DOC = "Destination for this product. Only present when ventrata/content capability is requested.";
const PRODUCT_CONTENT_ALERT_DOC = "Alert message for this product. Only present when ventrata/content capability is requested.";
const PRODUCT_CONTENT_TITLE_DOC = "Title for this product. Only present when ventrata/content capability is requested.";
const PRODUCT_CONTENT_SUBTITLE_DOC = "Subtitle for this product. Only present when ventrata/content capability is requested.";
const PRODUCT_CONTENT_DESCRIPTION_DOC = "Description for this product. Only present when ventrata/content capability is requested.";
const PRODUCT_CONTENT_SHORT_DESCRIPTION_DOC = "Short description for this product. Only present when ventrata/content capability is requested.";
const PRODUCT_CONTENT_CATEGORIES_DOC = "Categories for this product. Only present when ventrata/content capability is requested.";
const PRODUCT_CONTENT_INCLUSIONS_DOC = "Inclusions for this product. Only present when ventrata/content capability is requested.";
const PRODUCT_CONTENT_EXCLUSIONS_DOC = "Exclusions for this product. Only present when ventrata/content capability is requested.";
const PRODUCT_CONTENT_HIGHLIGHTS_DOC = "Highlights for this product. Only present when ventrata/content capability is requested.";
const PRODUCT_CONTENT_POINT_TO_POINT_DOC = "Whether this product is point to point or not. Only present when ventrata/content capability is requested.";
const PRODUCT_CONTENT_BOOKING_TERMS_DOC = "Booking terms for this product. Only present when ventrata/content capability is requested.";
const PRODUCT_CONTENT_PRIVACY_TERMS_DOC = "Privacy terms for this product. Only present when ventrata/content capability is requested.";
const PRODUCT_CONTENT_REDEMPTION_INSTRUCTIONS_DOC = "Redemption instructions for this product. Only present when ventrata/content capability is requested.";
const PRODUCT_CONTENT_CANCELLATION_POLICY_DOC = "Cancellation policy for this product. Only present when ventrata/content capability is requested.";
const PRODUCT_CONTENT_FAQS_DOC = "FAQs for this product. Only present when ventrata/content capability is requested.";
const PRODUCT_CONTENT_COVER_IMAGE_URL_DOC = "";
const PRODUCT_CONTENT_BANNER_IMAGE_URL_DOC = "";
const PRODUCT_CONTENT_VIDEO_URL_DOC = "";
const PRODUCT_CONTENT_GALLERY_IMAGES_DOC = "Gallery image URLs for this product. Only present when ventrata/content capability is requested.";
const PRODUCT_CONTENT_BANNER_IMAGES_DOC = "Banner image URLs for this product. Only present when ventrata/content capability is requested.";

const PRODUCT_CONTENT_COUNTRY_EXAMPLE = "";
const PRODUCT_CONTENT_LOCATION_EXAMPLE = "";
const PRODUCT_CONTENT_DESTINATION_EXAMPLE = "";
const PRODUCT_CONTENT_ALERT_EXAMPLE = "";
const PRODUCT_CONTENT_TITLE_EXAMPLE = "";
const PRODUCT_CONTENT_SUBTITLE_EXAMPLE = "";
const PRODUCT_CONTENT_DESCRIPTION_EXAMPLE = "";
const PRODUCT_CONTENT_SHORT_DESCRIPTION_EXAMPLE = "";
const PRODUCT_CONTENT_CATEGORIES_EXAMPLE = #[];
const PRODUCT_CONTENT_INCLUSIONS_EXAMPLE = #[];
const PRODUCT_CONTENT_EXCLUSIONS_EXAMPLE = #[];
const PRODUCT_CONTENT_HIGHLIGHTS_EXAMPLE = #[];
const PRODUCT_CONTENT_POINT_TO_POINT_EXAMPLE = false;
const PRODUCT_CONTENT_BOOKING_TERMS_EXAMPLE = "";
const PRODUCT_CONTENT_PRIVACY_TERMS_EXAMPLE = "";
const PRODUCT_CONTENT_REDEMPTION_INSTRUCTIONS_EXAMPLE = "";
const PRODUCT_CONTENT_CANCELLATION_POLICY_EXAMPLE = "";
const PRODUCT_CONTENT_FAQS_EXAMPLE = #[];
const PRODUCT_CONTENT_COVER_IMAGE_URL_EXAMPLE = "";
const PRODUCT_CONTENT_BANNER_IMAGE_URL_EXAMPLE = "";
const PRODUCT_CONTENT_VIDEO_URL_EXAMPLE = "";
const PRODUCT_CONTENT_GALLERY_IMAGES_EXAMPLE = #[];
const PRODUCT_CONTENT_BANNER_IMAGES_EXAMPLE = #[];

const PRODUCT_CONTENT_EXAMPLE = #{
  country: PRODUCT_CONTENT_COUNTRY_EXAMPLE,
  location: PRODUCT_CONTENT_LOCATION_EXAMPLE,
  destination: PRODUCT_CONTENT_DESTINATION_EXAMPLE,
  alert: PRODUCT_CONTENT_ALERT_EXAMPLE,
  title: PRODUCT_CONTENT_TITLE_EXAMPLE,
  subtitle: PRODUCT_CONTENT_SUBTITLE_EXAMPLE,
  description: PRODUCT_CONTENT_DESCRIPTION_EXAMPLE,
  shortDescription: PRODUCT_CONTENT_SHORT_DESCRIPTION_EXAMPLE,
  categories: PRODUCT_CONTENT_CATEGORIES_EXAMPLE,
  inclusions: PRODUCT_CONTENT_INCLUSIONS_EXAMPLE,
  exclusions: PRODUCT_CONTENT_EXCLUSIONS_EXAMPLE,
  highlights: PRODUCT_CONTENT_HIGHLIGHTS_EXAMPLE,
  pointToPoint: PRODUCT_CONTENT_POINT_TO_POINT_EXAMPLE,
  bookingTerms: PRODUCT_CONTENT_BOOKING_TERMS_EXAMPLE,
  privacyTerms: PRODUCT_CONTENT_PRIVACY_TERMS_EXAMPLE,
  redemptionInstructions: PRODUCT_CONTENT_REDEMPTION_INSTRUCTIONS_EXAMPLE,
  cancellationPolicy: PRODUCT_CONTENT_CANCELLATION_POLICY_EXAMPLE,
  faqs: PRODUCT_CONTENT_FAQS_EXAMPLE,
  coverImageUrl: PRODUCT_CONTENT_COVER_IMAGE_URL_EXAMPLE,
  bannerImageUrl: PRODUCT_CONTENT_BANNER_IMAGE_URL_EXAMPLE,
  videoUrl: PRODUCT_CONTENT_VIDEO_URL_EXAMPLE,
  galleryImages: PRODUCT_CONTENT_GALLERY_IMAGES_EXAMPLE,
  bannerImages: PRODUCT_CONTENT_BANNER_IMAGES_EXAMPLE,
};

@example(PRODUCT_CONTENT_EXAMPLE)
model ProductContent {
  @doc(PRODUCT_CONTENT_COUNTRY_DOC)
  @example(PRODUCT_CONTENT_COUNTRY_EXAMPLE)
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
  @extension("x-go-type-skip-optional-pointer", true)
  country?: string;

  @doc(PRODUCT_CONTENT_LOCATION_DOC)
  @example(PRODUCT_CONTENT_LOCATION_EXAMPLE)
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
  location?: string;

  @doc(PRODUCT_CONTENT_DESTINATION_DOC)
  @example(PRODUCT_CONTENT_DESTINATION_EXAMPLE)
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
  destination?: unknown;

  @doc(PRODUCT_CONTENT_ALERT_DOC)
  @example(PRODUCT_CONTENT_ALERT_EXAMPLE)
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
  alert?: string;

  @doc(PRODUCT_CONTENT_TITLE_DOC)
  @example(PRODUCT_CONTENT_TITLE_EXAMPLE)
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

  @doc(PRODUCT_CONTENT_SUBTITLE_DOC)
  @example(PRODUCT_CONTENT_SUBTITLE_EXAMPLE)
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
  subtitle?: string;

  @doc(PRODUCT_CONTENT_DESCRIPTION_DOC)
  @example(PRODUCT_CONTENT_DESCRIPTION_EXAMPLE)
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
  description?: string;

  @doc(PRODUCT_CONTENT_SHORT_DESCRIPTION_DOC)
  @example(PRODUCT_CONTENT_SHORT_DESCRIPTION_EXAMPLE)
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
  shortDescription?: string;

  @doc(PRODUCT_CONTENT_CATEGORIES_DOC)
  @example(PRODUCT_CONTENT_CATEGORIES_EXAMPLE)
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
  @extension("x-go-type-skip-optional-pointer", true)
  categories?: Category[];

  @doc(PRODUCT_CONTENT_INCLUSIONS_DOC)
  @example(PRODUCT_CONTENT_INCLUSIONS_EXAMPLE)
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
  @extension("x-go-type-skip-optional-pointer", true)
  inclusions?: string[];

  @doc(PRODUCT_CONTENT_EXCLUSIONS_DOC)
  @example(PRODUCT_CONTENT_EXCLUSIONS_EXAMPLE)
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
  @extension("x-go-type-skip-optional-pointer", true)
  exclusions?: string[];

  @doc(PRODUCT_CONTENT_HIGHLIGHTS_DOC)
  @example(PRODUCT_CONTENT_HIGHLIGHTS_EXAMPLE)
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
  @extension("x-go-type-skip-optional-pointer", true)
  highlights?: string[];

  @doc(PRODUCT_CONTENT_POINT_TO_POINT_DOC)
  @example(PRODUCT_CONTENT_POINT_TO_POINT_EXAMPLE)
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
  @extension("x-go-type-skip-optional-pointer", true)
  pointToPoint?: boolean;

  @doc(PRODUCT_CONTENT_BOOKING_TERMS_DOC)
  @example(PRODUCT_CONTENT_BOOKING_TERMS_EXAMPLE)
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
  bookingTerms?: string;

  @doc(PRODUCT_CONTENT_PRIVACY_TERMS_DOC)
  @example(PRODUCT_CONTENT_PRIVACY_TERMS_EXAMPLE)
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
  privacyTerms?: string;

  @doc(PRODUCT_CONTENT_REDEMPTION_INSTRUCTIONS_DOC)
  @example(PRODUCT_CONTENT_REDEMPTION_INSTRUCTIONS_EXAMPLE)
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
  redemptionInstructions?: string;

  @doc(PRODUCT_CONTENT_CANCELLATION_POLICY_DOC)
  @example(PRODUCT_CONTENT_CANCELLATION_POLICY_EXAMPLE)
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
  cancellationPolicy?: string;

  @doc(PRODUCT_CONTENT_FAQS_DOC)
  @example(PRODUCT_CONTENT_FAQS_EXAMPLE)
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
  @extension("x-go-type-skip-optional-pointer", true)
  faqs?: FAQ[];

  @doc(PRODUCT_CONTENT_COVER_IMAGE_URL_DOC)
  @example(PRODUCT_CONTENT_COVER_IMAGE_URL_EXAMPLE)
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
  coverImageUrl?: url;

  @doc(PRODUCT_CONTENT_BANNER_IMAGE_URL_DOC)
  @example(PRODUCT_CONTENT_BANNER_IMAGE_URL_EXAMPLE)
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
  bannerImageUrl?: url;

  @doc(PRODUCT_CONTENT_VIDEO_URL_DOC)
  @example(PRODUCT_CONTENT_VIDEO_URL_EXAMPLE)
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
  videoUrl?: url;

  @doc(PRODUCT_CONTENT_GALLERY_IMAGES_DOC)
  @example(PRODUCT_CONTENT_GALLERY_IMAGES_EXAMPLE)
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
  @extension("x-go-type-skip-optional-pointer", true)
  galleryImages?: Image[];

  @doc(PRODUCT_CONTENT_BANNER_IMAGES_DOC)
  @example(PRODUCT_CONTENT_BANNER_IMAGES_EXAMPLE)
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
  @extension("x-go-type-skip-optional-pointer", true)
  bannerImages?: Image[];
}
