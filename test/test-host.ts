import { createTestHost, createTestWrapper } from "@typespec/compiler/testing";
import { DocsLibTestLibrary } from "../src/testing/index.js";

export async function createDocsLibTestHost() {
  return createTestHost({
    libraries: [DocsLibTestLibrary],
  });
}

export async function createDocsLibTestRunner() {
  const host = await createDocsLibTestHost();

  return createTestWrapper(host, {
    autoUsings: ["DocsLib"],
  });
}
