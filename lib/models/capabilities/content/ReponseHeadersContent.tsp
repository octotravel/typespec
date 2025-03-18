namespace Octo;

using TypeSpec.Http;

model ResponseHeadersContent {
  @doc("This response header indicates the language of the content being returned in the response. The OCTO specification allows only one language to be returned per response. This code must conform to the BCP 47 standard, following RFC 5646 and RFC 4647 specifications for language tags. Examples include en-US for American English, fr-FR for French (France), and es-ES for Spanish (Spain).  To obtain content in multiple languages, separate requests must be made for each desired language. This header is defined in the HTTP/1.1 specification (RFC 7231). For more information, see MDN Web Docs: Content-Language - HTTP | MDN. This response header is required when using Content capability.")
  @example("en")
  @TypeSpec.OpenAPI.extension(
    "x-capability-data",
    {
      capability: "octo/content",
      required: true,
    }
  )
  @header({
    name: "Content-Language",
  })
  contentLanguage?: string;

  @doc("This response header is used to inform of the languages in which content is available, helping understand the language options without needing additional requests. This code must conform to the BCP 47 standard, following RFC 5646 and RFC 4647 specifications for language tags. Examples include en-US for American English, fr-FR for French (France), and es-ES for Spanish (Spain).  Although not a standard HTTP header, it is commonly used in APIs to list available languages, such as en-US, fr-CA, es-ES, indicating that content can be requested in U.S. English, Canadian French, or Spanish. This response header is required when using Content capability.")
  @example("en, es")
  @TypeSpec.OpenAPI.extension(
    "x-capability-data",
    {
      capability: "octo/content",
      required: true,
    }
  )
  @header({
    name: "Available-Languages",
  })
  availableLanguages?: string;
}
