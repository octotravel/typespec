import "@typespec/openapi";

import "../../src/models/Unit.tsp";
import "../../src/models/ContactField.tsp";
import "../../src/models/capabilities/Capability.tsp";
import "./UnitRestrictions.tsp";

import "./OptionRestrictions.tsp";

import "./capabilities/ventrata-content/UnitContent.tsp";
import "./capabilities/pricing/UnitPricing.tsp";
import "./capabilities/questions/UnitQuestions.tsp";

namespace Ventrata;
using OpenAPI;
using Octo;

const UNIT_TAGS_DOC = "This is an array of tags that can be used to filter the units.";
const UNIT_VISIBLE_CONTACT_FIELDS_DOC = "This is the array of the contact information PER ticket that the supplier expects.";

const UNIT_TAGS_EXAMPLE = #[];
const UNIT_VISIBLE_CONTACT_FIELDS_EXAMPLE = #[];

const UNIT_EXAMPLE = #{
  ...Octo.UNIT_EXAMPLE,
  tags: UNIT_TAGS_EXAMPLE,
  visibleContactFields: UNIT_VISIBLE_CONTACT_FIELDS_EXAMPLE,
  restrictions: UNIT_RESTRICTIONS_EXAMPLE,
};

@example(UNIT_EXAMPLE)
model Unit extends Octo.Unit {
  @extension("x-order", 1)
  @extension("x-go-name", "capabilities")
  @extension("x-internal", true)
  @extension("x-go-type-skip-optional-pointer", true)
  @extension("x-oapi-codegen-only-honour-go-name", true)
  capabilities?: Capability[];

  @extension("x-order", 2) id: string;

  @doc(UNIT_TAGS_DOC)
  @example(UNIT_TAGS_EXAMPLE)
  tags: string[];

  @doc(UNIT_VISIBLE_CONTACT_FIELDS_DOC)
  @example(UNIT_VISIBLE_CONTACT_FIELDS_EXAMPLE)
  visibleContactFields: ContactField[];

  restrictions: UnitRestrictions;
  ...UnitContent;
  ...UnitPricing;
  ...UnitQuestions;
}
