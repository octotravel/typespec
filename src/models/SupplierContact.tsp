namespace Octo;

const SUPPLIER_CONTACT_WEBSITE_DOC = "The supplier's official website URL. This should link directly to the supplier's primary website or a dedicated page about the supplier within a supplier system. The URL should not reference a general supplier system but a specific, identifiable supplier presence. This field can be null if no website is available.";
const SUPPLIER_CONTACT_EMAIL_DOC = "The email address for customer service inquiries, primarily for end customers. This should be a direct and monitored email address for resolving queries and providing support. The field may be null if email support is not offered or the email address is unavailable or not provided in supplier system.";
const SUPPLIER_CONTACT_TELEPHONE_DOC = "The customer service telephone number for end customers, formatted according to the E.164 standard. This format includes the country code followed by the national number, with no spaces, dashes, or special characters. This field can be null if telephone support is unavailable or not provided in supplier system.";
const SUPPLIER_CONTACT_ADDRESS_DOC = "The full mailing address of the location as a single string. It includes street address, city, state, postal code, and country. If no address is provided, this field can be null. For structured details, use the additional address-related fields";

const SUPPLIER_CONTACT_WEBSITE_EXAMPLE = null;
const SUPPLIER_CONTACT_EMAIL_EXAMPLE = "support@ventrata.com";
const SUPPLIER_CONTACT_TELEPHONE_EXAMPLE = null;
const SUPPLIER_CONTACT_ADDRESS_EXAMPLE = "Marble Arch, London, W1H 7EJ, United Kingdom";

const SUPPLIER_CONTACT_EXAMPLE = #{
  website: SUPPLIER_CONTACT_WEBSITE_EXAMPLE,
  email: SUPPLIER_CONTACT_EMAIL_EXAMPLE,
  telephone: SUPPLIER_CONTACT_TELEPHONE_EXAMPLE,
  address: SUPPLIER_CONTACT_ADDRESS_EXAMPLE,
};

@example(SUPPLIER_CONTACT_EXAMPLE)
model SupplierContact {
  @doc(SUPPLIER_CONTACT_WEBSITE_DOC)
  @example(null)
  website: string | null;

  @doc(SUPPLIER_CONTACT_EMAIL_DOC)
  @example(SUPPLIER_CONTACT_EMAIL_EXAMPLE)
  @format("email")
  email: string | null;

  @doc(SUPPLIER_CONTACT_TELEPHONE_DOC)
  @example(SUPPLIER_CONTACT_TELEPHONE_EXAMPLE)
  telephone: string | null;

  @doc(SUPPLIER_CONTACT_ADDRESS_DOC)
  @example(SUPPLIER_CONTACT_ADDRESS_EXAMPLE)
  address: string | null;
}
