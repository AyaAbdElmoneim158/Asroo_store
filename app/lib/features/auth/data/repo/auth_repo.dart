import '../../../../core/language/lang_keys.dart';
import '../../../../core/utils/services/graphql/api_result.dart';
import '../data_source/auth_data_source.dart';
import '../models/login_request_body.dart';
import '../models/login_response.dart';
import '../models/user_role_response.dart';

class AuthRepos {
  const AuthRepos(this._dataSource);
  final AuthDataSource _dataSource;

  Future<ApiResult<LoginResponse>> login(LoginRequestBody body) async {
    try {
      final response = await _dataSource.login(body);
      return ApiResult.success(response);
    } catch (error) {
      return const ApiResult.failure(LangKeys.loggedError);
    }
  }

  Future<UserRoleResponse> userRole(String token) async {
    final response = await _dataSource.userRole(token);
    return response;
  }
}
