import "@typespec/openapi";
import "./CommentaryFormat.tsp";

const COMMENTARY_FORMAT_DOC = """
  Specifies the format in which commentary is provided. Possible values are:
  IN_PERSON: Live commentary delivered by a guide or host during the activity. Examples include a tour guide providing real-time explanations about historical landmarks or itinerary highlights.
  RECORDED_AUDIO: Pre-recorded audio commentary accessible during the activity. Delivered via headphones, mobile apps, or speaker systems, covering key details in multiple languages.
  WRITTEN: Commentary provided as written material, such as printed brochures, guidebooks, or on-site informational displays at points of interest.
  OTHER: Commentary formats not explicitly listed, such as augmented reality experiences or interactive digital guides.
  """;

const COMMENTARY_LANGUAGE_DOC = "Specifies the language in which the commentary is offered, adhering to IETF BCP 47 language tags for compatibility.";

const COMMENTARY_FORMAT_EXAMPLE = CommentaryFormat.IN_PERSON;
const COMMENTARY_LANGUAGE_EXAMPLE = "";

const COMMENTARY_EXAMPLE = #{
  format: COMMENTARY_FORMAT_EXAMPLE,
  language: COMMENTARY_LANGUAGE_EXAMPLE,
};

@example(COMMENTARY_EXAMPLE)
model Commentary {
  @doc(COMMENTARY_FORMAT_DOC)
  @example(COMMENTARY_FORMAT_EXAMPLE)
  @TypeSpec.OpenAPI.extension(
    "x-capability-data",
    {
      capability: "octo/content",
      required: true,
    }
  )
  format: CommentaryFormat;

  @doc(COMMENTARY_LANGUAGE_DOC)
  @example(COMMENTARY_LANGUAGE_EXAMPLE)
  @TypeSpec.OpenAPI.extension(
    "x-capability-data",
    {
      capability: "octo/content",
      required: true,
    }
  )
  language: string;
}
