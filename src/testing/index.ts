import { resolvePath } from "@typespec/compiler";
import { createTestLibrary, TypeSpecTestLibrary } from "@typespec/compiler/testing";
import { fileURLToPath } from "url";

export const DocsLibTestLibrary: TypeSpecTestLibrary = createTestLibrary({
  name: "docs-lib",
  packageRoot: resolvePath(fileURLToPath(import.meta.url), "../../../../"),
});
