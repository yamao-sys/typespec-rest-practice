import "../../models/auth.tsp";

model SignUpValidationErrorResponse {
  code: integer;
  errors: SignUpValidationError;
}
