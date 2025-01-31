import "@typespec/openapi3";

import "../../src/models/Supplier.tsp";
import "./capabilities/ventrata-content/SupplierContent.tsp";

namespace Ventrata;

const SUPPLIER_EXAMPLE = Octo.SUPPLIER_EXAMPLE;

@example(SUPPLIER_EXAMPLE)
model Supplier extends Octo.Supplier {
  ...SupplierContent;
}
