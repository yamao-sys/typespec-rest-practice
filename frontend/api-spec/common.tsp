import "@typespec/rest";
import "@typespec/openapi";

namespace TodoService;

using Http;

@format("binary")
scalar Binary extends string;

alias SecuritySchema = ApiKeyAuth<ApiKeyLocation.cookie, "token">;
