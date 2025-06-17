import "@typespec/http";
import "@typespec/openapi";
import "@typespec/openapi3";

import "./request-body.tsp";
import "./response.tsp";

import "../common";

using Http;
using OpenAPI;

@tag("todos")
@route("/todos")
@useAuth([SecuritySchema])
namespace SampleService.Todo {
  @route("/")
  interface Root {
    @operationId("get-todos")
    @summary("Fetch Todos")
    @get
    get(): SuccessResponse<FetchTodosResponse>
      | BadRequestErrorResponse<FetchTodosResponse>
      | InternalServerErrorResponse;

    @operationId("post-todos")
    @summary("Create Todo Schema")
    @post
    post(
      @body body: StoreTodoInput,
    ): SuccessResponse<StoreTodoResponse>
      | BadRequestErrorResponse<StoreTodoResponse>
      | InternalServerErrorResponse;
  }

  @route("/{id}")
  interface Id {
    @operationId("get-todo")
    @summary("Show Todo")
    @get
    get(
      @path id: string,
    ): SuccessResponse<ShowTodoResponse>
      | NotFoundErrorResponse
      | InternalServerErrorResponse;

    @operationId("put-todo")
    @summary("Update Todo")
    @put
    put(
      @path id: string,
      @body body: StoreTodoInput,
    ): SuccessResponse<StoreTodoResponse>
      | BadRequestErrorResponse<StoreTodoResponse>
      | NotFoundErrorResponse
      | InternalServerErrorResponse;

    @operationId("delete-todo")
    @summary("Delete Todo")
    @delete
    delete(
      @path id: string,
    ): SuccessResponse<DeleteTodoResponse>
      | NotFoundErrorResponse
      | InternalServerErrorResponse;
  }
}
