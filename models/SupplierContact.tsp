const SUPPLIER_CONTACT_WEBSITE_DOC = "This SHOULD be the website of the Supplier that is separate from the Booking Platform but MAY be a unique destination within the Booking Platform about the Supplier.";
const SUPPLIER_CONTACT_EMAIL_DOC = "The email support contact for the Supplier.";
const SUPPLIER_CONTACT_TELEPHONE_DOC = "The phone support contact for the Supplier.";
const SUPPLIER_CONTACT_ADDRESS_DOC = "The (snail) mail address support contact for the Supplier.";

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
