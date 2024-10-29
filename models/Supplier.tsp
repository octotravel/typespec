import "@typespec/openapi3";

import "./capabilities/Capability.tsp";
import "./capabilities/content/SupplierContent.tsp";
import "./SupplierContact.tsp";


const SUPPLIER_ID_DOC = "Unique identifier used in the platform to represent the supplier.";
const SUPPLIER_NAME_DOC = "Name the supplier uses to identify itsel. Usually what the end customer will know the supplier as.";
const SUPPLIER_ENDPOINT_DOC = "This is the base URL that will be prepended to ALL other paths. The value SHOULD NOT contain a trailing /.";
const SUPPLIER_CONTACT_DOC = "";
const SUPPLIER_CAPABILITIES_DOC = "An array of capabilities that the supplier has. Possible values are:`octo/content` The supplier can provide pricing information";

const SUPPLIER_ID_EXAMPLE = "697e3ce8-1860-4cbf-80ad-95857df1f640";
const SUPPLIER_NAME_EXAMPLE = "Edin Explore";
const SUPPLIER_ENDPOINT_EXAMPLE = "https://api.ventrata.com/api-octo";
const SUPPLIER_CAPABILITIES_EXAMPLE = #[Capability.CONTENT];

const SUPPLIER_EXAMPLE = #{
  id: SUPPLIER_ID_EXAMPLE,
  name: SUPPLIER_NAME_EXAMPLE,
  endpoint: SUPPLIER_ENDPOINT_EXAMPLE,
  contact: SUPPLIER_CONTACT_EXAMPLE,
  capabilities: SUPPLIER_CAPABILITIES_EXAMPLE

};

@example(SUPPLIER_EXAMPLE)
model Supplier {
  @doc(SUPPLIER_ID_DOC)
  @example(SUPPLIER_ID_EXAMPLE)
  id: string;

  @doc(SUPPLIER_NAME_DOC)
  @example(SUPPLIER_NAME_EXAMPLE)
  name: string;

  @doc(SUPPLIER_ENDPOINT_DOC)
  @example(SUPPLIER_ENDPOINT_EXAMPLE)
  @format("uri")
  endpoint: string;

  @doc(SUPPLIER_CONTACT_DOC)
  @example(SUPPLIER_CONTACT_EXAMPLE)
  contact: SupplierContact;

  @doc(SUPPLIER_CAPABILITIES_DOC)
  @example(SUPPLIER_CAPABILITIES_EXAMPLE)
  @TypeSpec.OpenAPI.extension("x-go-name", "capabilities")
  @TypeSpec.OpenAPI.extension("x-go-json-ignore", true)
  @TypeSpec.OpenAPI.extension("x-oapi-codegen-only-honour-go-name", true)
  capabilities: Capability[];

  ...SupplierContent;
}