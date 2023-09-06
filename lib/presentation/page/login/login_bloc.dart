import 'package:demo_notification/core/utils/index.dart';
import 'package:demo_notification/presentation/base/index.dart';
import 'package:demo_notification/presentation/utils/index.dart';
import 'package:logger/logger.dart';

import 'index.dart';

class LoginBloc extends BaseBloc<BaseEvent, LoginState> with Validators {
  LoginBloc(
    this.pushHandler,
  ) : super(initState: LoginState());

  final PushNotificationHandler pushHandler;

  @override
  void onPageInitStateEvent(PageInitStateEvent event) {
    PushNotificationHandler.shared.setupPushNotification();

    _registerNotificationToken();
  }

  _registerNotificationToken() async {
    final token = await pushHandler.getNotifyToken();
    Logger().d('_registerNotificationToken token : $token');
  }

  @override
  dispose() {}
}
