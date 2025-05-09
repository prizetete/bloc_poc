// Mocks generated by Mockito 5.4.6 from annotations
// in bloc_poc/test/services/user_service_test.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i5;

import 'package:bloc_poc/models/user_model.dart' as _i3;
import 'package:bloc_poc/repository/user_repository.dart' as _i7;
import 'package:bloc_poc/services/user_service.dart' as _i4;
import 'package:dio/dio.dart' as _i2;
import 'package:mockito/mockito.dart' as _i1;
import 'package:mockito/src/dummies.dart' as _i6;

// ignore_for_file: type=lint
// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: deprecated_member_use
// ignore_for_file: deprecated_member_use_from_same_package
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: must_be_immutable
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types
// ignore_for_file: subtype_of_sealed_class

class _FakeDio_0 extends _i1.SmartFake implements _i2.Dio {
  _FakeDio_0(Object parent, Invocation parentInvocation)
    : super(parent, parentInvocation);
}

class _FakeUser_1 extends _i1.SmartFake implements _i3.User {
  _FakeUser_1(Object parent, Invocation parentInvocation)
    : super(parent, parentInvocation);
}

/// A class which mocks [UserService].
///
/// See the documentation for Mockito's code generation for more information.
class MockUserService extends _i1.Mock implements _i4.UserService {
  MockUserService() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i5.Future<String> getUsername() =>
      (super.noSuchMethod(
            Invocation.method(#getUsername, []),
            returnValue: _i5.Future<String>.value(
              _i6.dummyValue<String>(this, Invocation.method(#getUsername, [])),
            ),
          )
          as _i5.Future<String>);
}

/// A class which mocks [UserRepository].
///
/// See the documentation for Mockito's code generation for more information.
class MockUserRepository extends _i1.Mock implements _i7.UserRepository {
  MockUserRepository() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i2.Dio get dio =>
      (super.noSuchMethod(
            Invocation.getter(#dio),
            returnValue: _FakeDio_0(this, Invocation.getter(#dio)),
          )
          as _i2.Dio);

  @override
  _i5.Future<_i3.User> fetchUser() =>
      (super.noSuchMethod(
            Invocation.method(#fetchUser, []),
            returnValue: _i5.Future<_i3.User>.value(
              _FakeUser_1(this, Invocation.method(#fetchUser, [])),
            ),
          )
          as _i5.Future<_i3.User>);
}
