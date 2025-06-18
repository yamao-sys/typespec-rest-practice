import "@typespec/rest";
import "@typespec/openapi";

import "./common.tsp";

namespace TodoService;

using Http;
using Rest;
using Rest.Resource;

// サインアップリクエスト
model SignUpRequest {
  username: HttpPart<string>;
  password: HttpPart<string>;
  email: HttpPart<string>;
  profileImage?: HttpPart<Binary>;
}

// サインインリクエスト
model SignInRequest {
  username: string;
  password: string;
}

// 認証レスポンス
model AuthResponse {
  token: string;
  refreshToken?: string;
}

// エラー
@error
model AuthError {
  code: int32;
  message: string;
}

// 認証インターフェース
interface Auth {
  @post
  @route("/auth/sign-up")
  signUp(@multipartBody input: SignUpRequest): AuthResponse | AuthError;

  @post
  @route("/auth/sign-in")
  signIn(@body input: SignInRequest): AuthResponse | AuthError;
}
