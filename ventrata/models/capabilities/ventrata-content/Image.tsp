const IMAGE_URL_DOC = "";
const IMAGE_TITLE_DOC = "";
const IMAGE_CAPTION_DOC = "";

const IMAGE_URL_EXAMPLE = "";
const IMAGE_TITLE_EXAMPLE = "";
const IMAGE_CAPTION_EXAMPLE = "";

const IMAGE_EXAMPLE = #{
  url: IMAGE_URL_EXAMPLE,
  title: IMAGE_TITLE_EXAMPLE,
  caption: IMAGE_CAPTION_EXAMPLE,
};

@example(IMAGE_EXAMPLE)
model Image {
  @doc(IMAGE_URL_DOC)
  @example(IMAGE_URL_EXAMPLE)
  url: url;

  @doc(IMAGE_TITLE_DOC)
  @example(IMAGE_TITLE_EXAMPLE)
  title: string | null;

  @doc(IMAGE_CAPTION_DOC)
  @example(IMAGE_CAPTION_EXAMPLE)
  caption: string | null;
}
