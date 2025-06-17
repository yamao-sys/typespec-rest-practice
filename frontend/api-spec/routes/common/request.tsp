import "@typespec/http";
import "@typespec/openapi";

using Http;

alias SecuritySchema = ApiKeyAuth<ApiKeyLocation.cookie, "token">;

@format("binary")
scalar Binary extends string;
