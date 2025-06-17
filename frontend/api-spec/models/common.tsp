import "@typespec/http";
import "@typespec/openapi";

using TypeSpec.Http;

namespace Models.Common;

model SuccessResponse<T> {
  @statusCode status: 200;
  @body body: T
}

model BadRequestResponse<T> {
  @statusCode status: 400;
  @body body: T
}

model InternalServerErrorResponse {
  @statusCode status: 500;
  @body body: {
    code: integer;
    message: string;
  }
}
