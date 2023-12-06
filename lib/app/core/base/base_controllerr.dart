import 'dart:async';
import 'dart:io' show Platform;

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';

import '../enum/page_state.dart';
import '../utils/snackbar.dart';

abstract class BaseController extends GetxController {
  // AppThemeData get theme => AppTheme.of(Get.context!);

  Logger get logger => Get.find<Logger>();

  //Controls module state
  PageState _state = PageState.DEFAULT;

  PageState get pageState => _state;

  updatePageState(PageState state) {
    _state = state;
    update();
  }

  resetPageState() => updatePageState(PageState.DEFAULT);

  showLoading() => updatePageState(PageState.LOADING);

  hideLoading() => resetPageState();

  Future<T?> callDataService<T>(
    Future<T> Function() future, {
    bool loading = true,
    Function(T response)? onSuccess,
    Function(DioError e)? onDioError,
    Function(dynamic e)? onError,
    Function()? onDone,
  }) async {
    try {
      if (loading) showLoading();

      final T response = await future();

      if (onSuccess != null) onSuccess(response);

      return response;
    } on DioError catch (e) {
      if (onDioError != null) {
        onDioError(e);
      } else {
        SnackbarHelper.error(
          key: const ValueKey('data_service_dio_error_snack_bar'),
          dioError: e,
        );
      }
    } catch (e) {
      if (!Platform.environment.containsKey('FLUTTER_TEST')) logger.e(e);
      if (onError != null) {
        onError(e);
      } else {
        SnackbarHelper.error(
          key: const ValueKey('data_service_error_snack_bar'),
        );
      }
    } finally {
      if (loading) hideLoading();
      if (onDone != null) onDone();
    }
    return null;
  }
}
