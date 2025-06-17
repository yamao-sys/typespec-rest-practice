import "@typespec/http";

import "../common/request.tsp";

using Http;

@summary("Sign Up Input")
model SignUpInput {
  firstName: HttpPart<string>;
  lastName: HttpPart<string>;
  email: HttpPart<string>;
  password: HttpPart<string>;
  birthday?: HttpPart<plainDate>;
  frontIdentification?: HttpPart<Binary>;
  backIdentification?: HttpPart<Binary>;
}

@summary("Sign In Input")
model SignInInput {
  email: string;
  password: string;
}
