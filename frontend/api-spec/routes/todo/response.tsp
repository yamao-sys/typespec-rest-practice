import "@typespec/http";
import "../../models/todo.tsp";

@summary("Fetch Todos Response")
model FetchTodosResponse {
  todos: Todo[];
}

@summary("Show Todo Response")
model ShowTodoResponse {
  todo: Todo;
}

@summary("Store Todo Response")
model StoreTodoResponse {
  code: integer;
  errors: StoreTodoValidationError;
}

@summary("Delete Todo Response")
model DeleteTodoResponse {
  code: integer;
  result: boolean;
}
