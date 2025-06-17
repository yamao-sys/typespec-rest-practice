import "@typespec/http";
import "@typespec/openapi";
import "@typespec/openapi3";

import "./request-body.tsp";
import "./response.tsp";

import "../common";

using Http;
using OpenAPI;

@tag("auth")
@route("/auth")
namespace SampleService.Auth {
  interface ValidateSignUp {
    @route("/validate-sign-up")
    @operationId("post-auth-validate-sign-up")
    @summary("Validate Sign Up")
    @post
    post(
      @multipartBody body: SignUpInput,
    ): SuccessResponse<SignUpValidationErrorResponse>
    | BadRequestErrorResponse<SignUpValidationErrorResponse>
    | InternalServerErrorResponse;
  }

  interface SignUp {
    @route("/sign-up")
    @operationId("post-auth-sign-up")
    @summary("Sign Up")
    @post
    post(
      @multipartBody body: SignUpInput,
    ): SuccessResponse<SignUpValidationErrorResponse>
    | BadRequestErrorResponse<SignUpValidationErrorResponse>
    | InternalServerErrorResponse;
  }

  interface SignIn {
    @route("/sign-in")
    @operationId("post-auth-sign-in")
    @summary("Sign In")
    @post
    post(
      @body body: SignInInput,
    ): {
      @header("Set-Cookie") SetCookie?: string;
      @body body: {};
    } | {
      @statusCode statusCode: 400;
      @body body: {
        errors: string[];
      };
    } | {
      @statusCode statusCode: 500;
      @body body: {
        code: integer;
        message: string;
      };
    };
  }
}
