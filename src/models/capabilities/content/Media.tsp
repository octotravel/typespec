import "./MediaType.tsp";
import "./MediaRel.tsp";

namespace Octo;

const MEDIA_SRC_DOC = "The URL of the media file. The URL must be stable and publicly accessible.";
const MEDIA_TYPE_DOC = """
  Specifies the type of the media file, which indicates its format and intended usage. Recommended types include: image/jpeg: High-quality compressed images, ideal for general use. Suggested dimensions: 1920x1080 or higher.
  image/png: Images with transparency or higher visual fidelity, recommended for logos. Suggested dimensions: At least 1000x1000 pixels.
  video/mp4: Universal video format for high-quality playback. Suggested resolution: 1080p or higher.
  video/avi: A less common video format; MP4 is generally preferred for compatibility.
  external/youtube: URL links to YouTube videos for dynamic content. Use a shareable URL format.
  external/vimeo: URL links to Vimeo-hosted videos for high-quality or private video content.
  """;
const MEDIA_REL_DOC = """
  Defines the relationship of the media file to the supplier's content. Common values include: LOGO: For branding assets like supplier logos.
  COVER: For primary visual elements representing the supplier.
  GALLERY: For additional images or videos.
  """;
const MEDIA_TITLE_DOC = "The title or name of the media, providing a brief description or identifier for the media file. This helps in organizing and identifying media files (e.g., \"Main Attraction Image,\" \"Promotional Video\"). This field can be null if no title is provided.";
const MEDIA_CAPTION_DOC = "A caption providing additional context or information about what is depicted in the media. Captions should be customer-facing and provide insights such as \"Overview of the city skyline at sunset\" or \"Guests enjoying the guided tour.\" This field can be null if no caption is provided.";
const MEDIA_COPYRIGHT_DOC = "Information about the copyright status or usage restrictions of the media. This may include details about ownership, licensing terms, or attribution requirements (e.g., \"© 2024 Example Corp, All Rights Reserved\"). If null, it is assumed there are no copyright restrictions or attribution requirements.";

const MEDIA_SRC_EXAMPLE = "";
const MEDIA_TYPE_EXAMPLE = MediaType.JPEG;
const MEDIA_REL_EXAMPLE = MediaRel.LOGO;
const MEDIA_TITLE_EXAMPLE = "";
const MEDIA_CAPTION_EXAMPLE = "";
const MEDIA_COPYRIGHT_EXAMPLE = "";

const MEDIA_EXAMPLE = #{
  src: MEDIA_SRC_EXAMPLE,
  type: MEDIA_TYPE_EXAMPLE,
  rel: MEDIA_REL_EXAMPLE,
  title: MEDIA_TITLE_EXAMPLE,
  caption: MEDIA_CAPTION_EXAMPLE,
  copyright: MEDIA_COPYRIGHT_EXAMPLE,
};

@example(MEDIA_EXAMPLE)
model Media {
  @doc(MEDIA_SRC_DOC)
  @example(MEDIA_SRC_EXAMPLE)
  @format("uri")
  src: url;

  @doc(MEDIA_TYPE_DOC)
  @example(MEDIA_TYPE_EXAMPLE)
  type: MediaType;

  @doc(MEDIA_REL_DOC)
  @example(MEDIA_REL_EXAMPLE)
  rel: MediaRel;

  @doc(MEDIA_TITLE_DOC)
  @example(MEDIA_TITLE_EXAMPLE)
  title: string | null;

  @doc(MEDIA_CAPTION_DOC)
  @example(MEDIA_CAPTION_EXAMPLE)
  caption: string | null;

  @doc(MEDIA_COPYRIGHT_DOC)
  @example(MEDIA_COPYRIGHT_EXAMPLE)
  copyright: string | null;
}
