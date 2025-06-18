import "@typespec/rest";
import "@typespec/openapi";

namespace TodoService;

using Http;
using Rest;
using Rest.Resource;

@error
model TodoError {
  code: int32;
  message: string;
}

@resource("todos")
model Todo {
  @key("todoId")
  id: int32;

  title: string;
  description?: string;

  completed: boolean;

  userId: int32;
}

@resource("sub-tasks")
@parentResource(Todo)
model SubTask {
  @key("subTaskId")
  id: int32;

  content: string;

  completed: boolean;
}

// SubTaskの一括更新用のモデル
model SubTaskBulkUpdateRequest {
  subTaskIds: int32[];
  completed: boolean;
}

// Todosリソースの基本CRUD + 追加アクション
@useAuth([SecuritySchema])
interface Todos extends ResourceOperations<Todo, TodoError> {
  @post
  @route("/todos/bulk-register")
  bulkRegister(@body todos: Todo[]): Todo[] | TodoError;
}

// Todosのサブリソース SubTasksリソースの基本CRUD + 一括更新アクション
@useAuth([SecuritySchema])
interface SubTasks extends ResourceOperations<SubTask, TodoError> {
  @patch(#{implicitOptionality: true})
  @route("/todos/{todoId}/sub-tasks")
  bulkUpdate(@path todoId: int32, @body update: SubTaskBulkUpdateRequest): SubTask[] | TodoError;
}
