import "./../../SupplierContact.tsp";
import "./Category.tsp";

const DESTINATION_ID_DOC = "Unique identifier used in the platform to represent the destination.";
const DESTINATION_DEFAULT_DOC = "TRUE` identifies the destination as default, and should therefore rendered and selected first";
const DESTINATION_NAME_DOC = "The name of the destination";
const DESTINATION_COUNTRY_DOC = "The country the destination is in";
const DESTINATION_CONTACT_DOC = "";
// const DESTINATION_CITY_DOC = "";
const DESTINATION_LATITUDE_DOC = "The latitude of the destination.";
const DESTINATION_LONGITUDE_DOC = "The longitude of the destination.";
const DESTINATION_GOOGLE_PLACE_ID_DOC = "";
const DESTINATION_BANNER_IMAGE_URL_DOC = "The URL of the image that represents the destination.";
const DESTINATION_COVER_IMAGE_URL_DOC = "The URL of the image that represents the DESTINATION.";
const DESTINATION_VIDEO_URL_DOC = "";
const DESTINATION_FACEBOOK_URL_DOC = "";
const DESTINATION_GOOGLE_URL_DOC = "";
const DESTINATION_TRIPADVISOR_URL_DOC = "";
const DESTINATION_TWITTER_URL_DOC = "";
const DESTINATION_YOUTUBE_URL_DOC = "";
const DESTINATION_INSTAGRAM_URL_DOC = "";
const DESTINATION_CATEGORIES_DOC = "";

const DESTINATION_ID_EXAMPLE = "697e3ce8-1860-4cbf-80ad-95857df1f640";
const DESTINATION_DEFAULT_EXAMPLE = true;
const DESTINATION_NAME_EXAMPLE = "";
const DESTINATION_COUNTRY_EXAMPLE = "";
const DESTINATION_CONTACT_EXAMPLE = SUPPLIER_CONTACT_EXAMPLE;
// const DESTINATION_CITY_EXAMPLE = "";
const DESTINATION_LATITUDE_EXAMPLE = 55.9533;
const DESTINATION_LONGITUDE_EXAMPLE = -3.1883;
const DESTINATION_GOOGLE_PLACE_ID_EXAMPLE = "";
const DESTINATION_BANNER_IMAGE_URL_EXAMPLE = "The URL of the image that represents the destination.";
const DESTINATION_COVER_IMAGE_URL_EXAMPLE = "The URL of the image that represents the destination.";
const DESTINATION_VIDEO_URL_EXAMPLE = "";
const DESTINATION_FACEBOOK_URL_EXAMPLE = "";
const DESTINATION_GOOGLE_URL_EXAMPLE = "";
const DESTINATION_TRIPADVISOR_URL_EXAMPLE = "";
const DESTINATION_TWITTER_URL_EXAMPLE = "";
const DESTINATION_YOUTUBE_URL_EXAMPLE = "";
const DESTINATION_INSTAGRAM_URL_EXAMPLE = "";
const DESTINATION_CATEGORIES_EXAMPLE = #[CATEGORY_EXAMPLE];

const DESTINATION_EXAMPLE = #{
  id: DESTINATION_ID_EXAMPLE,
  default: DESTINATION_DEFAULT_EXAMPLE,
  name: DESTINATION_NAME_EXAMPLE,
  country: DESTINATION_COUNTRY_EXAMPLE,
  contact: DESTINATION_CONTACT_EXAMPLE,

  // city: DESTINATION_CITY_EXAMPLE,
  latitude: DESTINATION_LATITUDE_EXAMPLE,

  longitude: DESTINATION_LONGITUDE_EXAMPLE,
  googlePlaceId: DESTINATION_GOOGLE_PLACE_ID_EXAMPLE,
  bannerImageUrl: DESTINATION_BANNER_IMAGE_URL_EXAMPLE,
  coverImageUrl: DESTINATION_COVER_IMAGE_URL_EXAMPLE,
  videoUrl: DESTINATION_VIDEO_URL_EXAMPLE,
  facebookUrl: DESTINATION_FACEBOOK_URL_EXAMPLE,
  googleUrl: DESTINATION_GOOGLE_URL_EXAMPLE,
  tripadvisorUrl: DESTINATION_TRIPADVISOR_URL_EXAMPLE,
  twitterUrl: DESTINATION_TWITTER_URL_EXAMPLE,
  youtubeUrl: DESTINATION_YOUTUBE_URL_EXAMPLE,
  instagramUrl: DESTINATION_INSTAGRAM_URL_EXAMPLE,
  categories: DESTINATION_CATEGORIES_EXAMPLE,
};

@example(DESTINATION_EXAMPLE)
model Destination {
  @doc(DESTINATION_ID_DOC)
  @example(DESTINATION_ID_EXAMPLE)
  id: string;

  @doc(DESTINATION_DEFAULT_DOC)
  @example(DESTINATION_DEFAULT_EXAMPLE)
  default: boolean;

  @doc(DESTINATION_NAME_DOC)
  @example(DESTINATION_NAME_EXAMPLE)
  name: string | null;

  @doc(DESTINATION_NAME_DOC)
  @example(DESTINATION_COUNTRY_EXAMPLE)
  country: string | null;

  @doc(DESTINATION_CONTACT_DOC)
  @example(DESTINATION_CONTACT_EXAMPLE)
  contact: SupplierContact;

  // @doc(DESTINATION_NAME_DOC)
  // @example(DESTINATION_CITY_EXAMPLE)
  // city: string | null;
  @doc(DESTINATION_NAME_DOC)
  @example(DESTINATION_LATITUDE_EXAMPLE)
  latitude: float | null;

  @doc(DESTINATION_NAME_DOC)
  @example(DESTINATION_LONGITUDE_EXAMPLE)
  longitude: float | null;

  @doc(DESTINATION_GOOGLE_PLACE_ID_DOC)
  @example(DESTINATION_GOOGLE_PLACE_ID_EXAMPLE)
  googlePlaceId: string | null;

  @doc(DESTINATION_BANNER_IMAGE_URL_DOC)
  @example(DESTINATION_BANNER_IMAGE_URL_EXAMPLE)
  @format("uri")
  bannerImageUrl: string | null;

  @doc(DESTINATION_COVER_IMAGE_URL_DOC)
  @example(DESTINATION_COVER_IMAGE_URL_EXAMPLE)
  @format("uri")
  coverImageUrl: string | null;

  @doc(DESTINATION_VIDEO_URL_DOC)
  @example(DESTINATION_VIDEO_URL_EXAMPLE)
  @format("uri")
  videoUrl: string | null;

  @doc(DESTINATION_FACEBOOK_URL_DOC)
  @example(DESTINATION_FACEBOOK_URL_EXAMPLE)
  @format("uri")
  facebookUrl: string | null;

  @doc(DESTINATION_GOOGLE_URL_DOC)
  @example(DESTINATION_GOOGLE_URL_EXAMPLE)
  @format("uri")
  googleUrl: string | null;

  @doc(DESTINATION_TRIPADVISOR_URL_DOC)
  @example(DESTINATION_TRIPADVISOR_URL_EXAMPLE)
  @format("uri")
  tripadvisorUrl: string | null;

  @doc(DESTINATION_TWITTER_URL_DOC)
  @example(DESTINATION_TWITTER_URL_EXAMPLE)
  @format("uri")
  twitterUrl: string | null;

  @doc(DESTINATION_YOUTUBE_URL_EXAMPLE)
  @example(DESTINATION_YOUTUBE_URL_EXAMPLE)
  @format("uri")
  youtubeUrl: string | null;

  @doc(DESTINATION_INSTAGRAM_URL_DOC)
  @example(DESTINATION_INSTAGRAM_URL_EXAMPLE)
  @format("uri")
  instagramUrl: string | null;

  @doc(DESTINATION_CATEGORIES_DOC)
  @example(DESTINATION_CATEGORIES_EXAMPLE)
  categories: Category[];
}
