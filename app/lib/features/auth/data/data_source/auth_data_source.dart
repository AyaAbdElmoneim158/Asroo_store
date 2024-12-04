// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:app/features/auth/data/models/login_request_body.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import '../../../../core/utils/services/graphql/api_service.dart';
import '../../../../core/utils/services/graphql/queries/auth_queries.dart';
import '../models/login_response.dart';
import '../models/user_role_response.dart';

class AuthDataSource {
  ApiService apiService;
  AuthDataSource(this.apiService);

  Future<LoginResponse> login(LoginRequestBody body) async {
    final response = await apiService.login(AuthQueries().loginMapQuery(body: body));
    return response;
  }

  Future<UserRoleResponse> userRole(String token) async {
    final dio = Dio();
    dio.options.headers['Authorization'] = 'Bearer $token';
    final client = ApiService(dio);
    final response = await client.userRole();
    debugPrint('User Role => ${response.userRole}');
    return response;
  }
}
