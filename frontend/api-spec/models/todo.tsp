import "@typespec/http";

@summary("Todo Object")
model Todo {
  id: integer;
  title: string;
  content: string;
}

@summary("Store Todo Validation Error")
model StoreTodoValidationError {
  title?: string[];
  content?: string[];
}
