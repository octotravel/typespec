import "@typespec/openapi";

namespace Octo;

const POSTAL_ADDRESS_STREET_ADDRESS_DOC = "The primary address line, such as a street address, P.O. box, or company name. Null if not provided.";
const POSTAL_ADDRESS_ADDRESS_LOCALITY_DOC = "The city or locality associated with the address.";
const POSTAL_ADDRESS_ADDRESS_REGION_DOC = "The state, province, or region associated with the address.";
const POSTAL_ADDRESS_POSTAL_CODE_DOC = "The postal code or ZIP code for the address.";
const POSTAL_ADDRESS_ADDRESS_COUNTRY_DOC = "The two-letter country code for the address.";
const POSTAL_ADDRESS_POST_OFFICE_BOX_NUMBER_DOC = "The post office box number associated with the address, if applicable.";

const POSTAL_ADDRESS_STREET_ADDRESS_EXAMPLE = "";
const POSTAL_ADDRESS_ADDRESS_LOCALITY_EXAMPLE = "";
const POSTAL_ADDRESS_ADDRESS_REGION_EXAMPLE = "";
const POSTAL_ADDRESS_POSTAL_CODE_EXAMPLE = "";
const POSTAL_ADDRESS_ADDRESS_COUNTRY_EXAMPLE = "";
const POSTAL_ADDRESS_POST_OFFICE_BOX_NUMBER_EXAMPLE = "";

const POSTAL_ADDRESS_EXAMPLE = #{
  streetAddress: POSTAL_ADDRESS_STREET_ADDRESS_EXAMPLE,
  addressLocality: POSTAL_ADDRESS_ADDRESS_LOCALITY_EXAMPLE,
  addressRegion: POSTAL_ADDRESS_ADDRESS_REGION_EXAMPLE,
  postalCode: POSTAL_ADDRESS_POSTAL_CODE_EXAMPLE,
  addressCountry: POSTAL_ADDRESS_ADDRESS_COUNTRY_EXAMPLE,
  postOfficeBoxNumber: POSTAL_ADDRESS_POST_OFFICE_BOX_NUMBER_EXAMPLE,
};

@example(POSTAL_ADDRESS_EXAMPLE)
model PostalAddress {
  @doc(POSTAL_ADDRESS_STREET_ADDRESS_DOC)
  @example(POSTAL_ADDRESS_STREET_ADDRESS_EXAMPLE)
  streetAddress: string | null;

  @doc(POSTAL_ADDRESS_ADDRESS_LOCALITY_DOC)
  @example(POSTAL_ADDRESS_ADDRESS_LOCALITY_EXAMPLE)
  addressLocality: string | null;

  @doc(POSTAL_ADDRESS_ADDRESS_REGION_DOC)
  @example(POSTAL_ADDRESS_ADDRESS_REGION_EXAMPLE)
  addressRegion: string | null;

  @doc(POSTAL_ADDRESS_POSTAL_CODE_DOC)
  @example(POSTAL_ADDRESS_POSTAL_CODE_EXAMPLE)
  postalCode: string | null;

  @doc(POSTAL_ADDRESS_POSTAL_CODE_DOC)
  @example(POSTAL_ADDRESS_POSTAL_CODE_EXAMPLE)
  addressCountry: string | null;

  @doc(POSTAL_ADDRESS_POST_OFFICE_BOX_NUMBER_DOC)
  @example(POSTAL_ADDRESS_POSTAL_CODE_EXAMPLE)
  postOfficeBoxNumber: string | null;
}
