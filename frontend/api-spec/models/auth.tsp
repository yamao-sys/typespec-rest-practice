import "@typespec/http";

@summary("Sign Up Validation Error")
model SignUpValidationError {
  firstName?: string[];
  lastName?: string[];
  email?: string[];
  password?: string[];
  birthday?: string[];
  frontIdentification?: string[];
  backIdentification?: string[];
}
