import "@typespec/http";
import "@typespec/openapi";
import "@typespec/openapi3";

using Http;

@service
@doc("A sample service")
@OpenAPI.info(#{
  version: "1.0",
})
@server("https://localhost:8080")
namespace SampleService {};
