import "@typespec/http";
import "@typespec/openapi";

import "./models/Supplier.tsp";

import "./requests/GetSupplierRequest.tsp";
import "./responses/GetSupplierResponse.tsp";

import "./models/Product.tsp";

import "./requests/GetProductRequest.tsp";
import "./responses/GetProductResponse.tsp";

import "./requests/GetProductsRequest.tsp";
import "./responses/GetProductsResponse.tsp";

using TypeSpec.Http;
using TypeSpec.OpenAPI;
using Ventrata;

@useAuth(BearerAuth)
@server("https://api.ventrata.com/octo")
@service({
  title: "Ventrata OCTO API",
})
namespace VentrataApi;

@tag("Supplier")
@route("/supplier")
interface Suppliers {
  @route("/")
  @summary("Get Supplier")
  @doc("Returns the supplier and associated contact details.")
  @opExample(
    #{
      returnType: #{
        octoCapabilities: "",
        statusCode: 200,
        body: GET_SUPPLIER_RESPONSE,
      },
    },
    #{ title: "Supplier example", description: "Supplier example" }
  )
  @opExample(
    #{
      returnType: #{
        statusCode: 400,
        body: GET_SUPPLIER_UNAUTHORIZED_RESPONSE_EXAMPLE,
      },
    },
    #{ title: "Unauthorized Response", description: "Unauthorized Response" }
  )
  @opExample(
    #{
      returnType: #{
        statusCode: 400,
        body: GET_SUPPLIER_INTERNAL_SERVER_ERROR_RESPONSE_EXAMPLE,
      },
    },
    #{
      title: "Internal Server Error Response",
      description: "Internal Server Error Response",
    }
  )
  @opExample(
    #{
      returnType: #{
        statusCode: 400,
        body: GET_SUPPLIER_FORBIDDEN_RESPONSE_EXAMPLE,
      },
    },
    #{ title: "Forbidden Response", description: "Forbidden Response" }
  )
  get(
    ...GetSupplierRequest,
  ): GetSupplierSuccessResponse | GetSupplierErrorResponse;
}

@tag("Products")
@route("/products")
interface Products {
  @route("/")
  @summary("Get Products")
  @doc("Fetch the list of products.")
  @opExample(
    #{
      returnType: #{
        octoCapabilities: "",
        statusCode: 200,
        body: GET_PRODUCTS_RESPONSE,
      },
    },
    #{ title: "Products example", description: "Products example" }
  )
  @opExample(
    #{
      returnType: #{
        statusCode: 400,
        body: GET_PRODUCTS_UNAUTHORIZED_RESPONSE_EXAMPLE,
      },
    },
    #{ title: "Unauthorized Response", description: "Unauthorized Response" }
  )
  @opExample(
    #{
      returnType: #{
        statusCode: 400,
        body: GET_PRODUCTS_INTERNAL_SERVER_ERROR_RESPONSE_EXAMPLE,
      },
    },
    #{
      title: "Internal Server Error Response",
      description: "Internal Server Error Response",
    }
  )
  @opExample(
    #{
      returnType: #{
        statusCode: 400,
        body: GET_PRODUCTS_FORBIDDEN_RESPONSE_EXAMPLE,
      },
    },
    #{ title: "Forbidden Response", description: "Forbidden Response" }
  )
  GetProducts(
    ...GetProductsRequest,
  ): GetProductsSuccessResponse | GetProductsErrorResponse;

  @route("/{id}")
  @summary("Get Product")
  @doc("Fetch the product for the given id.")
  @opExample(
    #{
      returnType: #{
        octoCapabilities: "",
        statusCode: 200,
        body: GET_PRODUCT_RESPONSE,
      },
    },
    #{ title: "Product example", description: "Product example" }
  )
  @opExample(
    #{
      returnType: #{
        statusCode: 400,
        body: GET_PRODUCT_INVALID_PRODUCT_ID_RESPONSE_EXAMPLE,
      },
    },
    #{
      title: "Invalid Product Id Response",
      description: "Invalid Product Id Response",
    }
  )
  @opExample(
    #{
      returnType: #{
        statusCode: 400,
        body: GET_PRODUCT_UNAUTHORIZED_RESPONSE_EXAMPLE,
      },
    },
    #{ title: "Unauthorized Response", description: "Unauthorized Response" }
  )
  @opExample(
    #{
      returnType: #{
        statusCode: 400,
        body: GET_PRODUCT_INTERNAL_SERVER_ERROR_RESPONSE_EXAMPLE,
      },
    },
    #{
      title: "Internal Server Error Response",
      description: "Internal Server Error Response",
    }
  )
  @opExample(
    #{
      returnType: #{
        statusCode: 400,
        body: GET_PRODUCT_FORBIDDEN_RESPONSE_EXAMPLE,
      },
    },
    #{ title: "Forbidden Response", description: "Forbidden Response" }
  )
  GetProduct(
    ...GetProductRequest,
  ): GetProductSuccessResponse | GetProductErrorResponse;
}
