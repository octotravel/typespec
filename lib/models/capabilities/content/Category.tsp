import "./Destination.tsp";

namespace Octo;

const CATEGORY_ID_DOC = "Unique identifier used in the platform to represent the category.";
const CATEGORY_DEFAULT_DOC = "TRUE` identifies the category as default, and should therefore rendered and selected first";
const CATEGORY_NAME_DOC = "The name of the category.";
const CATEGORY_TITLE_DOC = "The title of the category.";
const CATEGORY_SHORT_DESCRIPTION_DOC = "The description of the category";
const CATEGORY_BANNER_IMAGE_URL_DOC = "The URL of the image that represents the category.";
const CATEGORY_COVER_IMAGE_URL_DOC = "The URL of the image that represents the category.";
// const CATEGORY_DESTINATIONS_DOC = "";
const CATEGORY_PRODUCTS_DOC = "";

const CATEGORY_ID_EXAMPLE = "697e3ce8-1860-4cbf-80ad-95857df1f640";
const CATEGORY_DEFAULT_EXAMPLE = true;
const CATEGORY_NAME_EXAMPLE = "";
const CATEGORY_TITLE_EXAMPLE = "";
const CATEGORY_SHORT_DESCRIPTION_EXAMPLE = "";
const CATEGORY_BANNER_IMAGE_URL_EXAMPLE = "The URL of the image that represents the category.";
const CATEGORY_COVER_IMAGE_URL_EXAMPLE = "The URL of the image that represents the category.";
// const CATEGORY_DESTINATIONS_EXAMPLE = #[DESTINATION_EXAMPLE];
const CATEGORY_PRODUCTS_EXAMPLE = #["6b903d44-dc24-4ca4-ae71-6bde6c4f4854"];

const CATEGORY_EXAMPLE = #{
  id: CATEGORY_ID_EXAMPLE,
  default: CATEGORY_DEFAULT_EXAMPLE,
  name: CATEGORY_NAME_EXAMPLE,
  title: CATEGORY_TITLE_EXAMPLE,
  shortDescription: CATEGORY_SHORT_DESCRIPTION_EXAMPLE,
  bannerImageUrl: CATEGORY_BANNER_IMAGE_URL_EXAMPLE,
  coverImageUrl: CATEGORY_COVER_IMAGE_URL_EXAMPLE,

  // destinations: CATEGORY_DESTINATIONS_EXAMPLE,
  productIds: CATEGORY_PRODUCTS_EXAMPLE,
};

@example(CATEGORY_EXAMPLE)
model Category {
  @doc(CATEGORY_ID_DOC)
  @example(CATEGORY_ID_EXAMPLE)
  id: string;

  @doc(CATEGORY_DEFAULT_DOC)
  @example(CATEGORY_DEFAULT_EXAMPLE)
  default: boolean;

  @doc(CATEGORY_NAME_DOC)
  @example(CATEGORY_NAME_EXAMPLE)
  name: string | null;

  @doc(CATEGORY_TITLE_DOC)
  @example(CATEGORY_TITLE_EXAMPLE)
  title: string | null;

  @doc(CATEGORY_SHORT_DESCRIPTION_DOC)
  @example(CATEGORY_SHORT_DESCRIPTION_EXAMPLE)
  shortDescription: string | null;

  @doc(CATEGORY_BANNER_IMAGE_URL_DOC)
  @example(CATEGORY_BANNER_IMAGE_URL_EXAMPLE)
  @format("uri")
  bannerImageUrl: url | null;

  @doc(CATEGORY_COVER_IMAGE_URL_DOC)
  @example(CATEGORY_COVER_IMAGE_URL_EXAMPLE)
  @format("uri")
  coverImageUrl: url | null;

  // @doc(CATEGORY_DESTINATIONS_DOC)
  // @example(CATEGORY_DESTINATIONS_EXAMPLE)
  // destinations: Destination[];
  @doc(CATEGORY_PRODUCTS_DOC)
  @example(CATEGORY_PRODUCTS_EXAMPLE)
  productIds: string[];
}
