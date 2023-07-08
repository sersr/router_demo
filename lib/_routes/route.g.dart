// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'route.dart';

// **************************************************************************
// RouterGenerator
// **************************************************************************

// ignore_for_file: prefer_const_constructors

class Routes {
  Routes._();

  static Routes? _instance;

  static Routes init({
    bool newInstance = false,
    Map<String, dynamic> params = const {},
    Map<String, dynamic>? extra,
    Object? groupId,
    List<NavigatorObserver> observers = const [],
  }) {
    if (!newInstance && _instance != null) {
      return _instance!;
    }
    final instance = _instance = Routes._();
    instance._init(params, extra, groupId, observers);
    return instance;
  }

  void _init(
    Map<String, dynamic> params,
    Map<String, dynamic>? extra,
    Object? groupId,
    List<NavigatorObserver> observers,
  ) {
    _detail01Build = NPage(
      useGroupId: true,
      path: 'detail01Build/:newKey',
      redirectBuilder: redirect,
      pageBuilder: (entry) {
        var message = entry.queryParams['message'];
        var newKey = entry.params['newKey'];
        if (newKey is! int?) {
          newKey = jsonDecodeCustom(newKey);
        }
        var data = entry.queryParams['data'];
        if (data is! Data?) {
          data = Data.fromJson2(data);
        }
        return MaterialIgnorePage(
          key: entry.pageKey,
          entry: entry,
          child: Nop.page(
            groupList: const [DetailProvider],
            builders: const [_Routes.detailWidgetBuild],
            group: entry.groupId,
            child:
                Detail01Page.build(message: message, hhh: newKey, data: data),
          ),
        );
      },
    );

    _detail02 = NPage(
      useGroupId: true,
      path: 'detail02',
      redirectBuilder: redirect,
      pageBuilder: (entry) {
        var message = entry.queryParams['message'];
        return MaterialIgnorePage(
          key: entry.pageKey,
          entry: entry,
          child: Nop.page(
            groupList: const [DetailProvider],
            group: entry.groupId,
            child: Detail02Page(message: message),
          ),
        );
      },
    );

    _fffNewPage = NPage(
      useGroupId: true,
      path: 'fffNewPage',
      redirectBuilder: redirect,
      pageBuilder: (entry) {
        var hhh = entry.queryParams['hhh'];
        var m = entry.queryParams['m'];
        return MaterialIgnorePage(
          key: entry.pageKey,
          entry: entry,
          child: Nop.page(
            groupList: const [DetailProvider],
            group: entry.groupId,
            child: fffPage(hhh, m),
          ),
        );
      },
    );

    _detail = NPage(
      useGroupId: true,
      pages: [_detail01Build, _detail02, _fffNewPage],
      path: 'detail',
      redirectBuilder: redirect,
      pageBuilder: (entry) {
        var message = entry.queryParams['message'];
        return _Routes.detailBuilder(
          entry,
          Nop.page(
            groupList: const [DetailProvider],
            group: entry.groupId,
            child: DetailPage(message: message),
          ),
        );
      },
    );

    _live = NPage(
      path: 'live',
      pageBuilder: (entry) {
        return MaterialIgnorePage(
          key: entry.pageKey,
          entry: entry,
          child: const Nop.page(
            child: LivePage(),
          ),
        );
      },
    );

    _home = NPageMain(
      errorPageBuilder: errorBuild,
      pages: [_detail, _live],
      path: '/',
      pageBuilder: (entry) {
        return MaterialIgnorePage(
          key: entry.pageKey,
          entry: entry,
          child: const Nop.page(
            child: HomePage(),
          ),
        );
      },
    );

    _router = NRouter(
      rootPage: _home,
      restorationId: 'hello',
      params: params,
      extra: extra,
      groupId: groupId,
      observers: observers,
    );
  }

  late final NRouter _router;
  static NRouter get router => _instance!._router;
  late final NPage _detail01Build;
  static NPage get detail01Build => _instance!._detail01Build;
  late final NPage _detail02;
  static NPage get detail02 => _instance!._detail02;
  late final NPage _fffNewPage;
  static NPage get fffNewPage => _instance!._fffNewPage;
  late final NPage _detail;
  static NPage get detail => _instance!._detail;
  late final NPage _live;
  static NPage get live => _instance!._live;
  late final NPageMain _home;
  static NPageMain get home => _instance!._home;
}

class NavRoutes {
  NavRoutes._();

  /// [groupId]
  /// see: [NPage.newGroupKey] and [NPage.resolveGroupId]
  static RouterAction detail01Build(
      {required String message,
      int? newKey = 0,
      Data? data = const Data('hhhhh'),
      required groupId}) {
    return RouterAction(Routes.detail01Build, Routes.router,
        params: {'newKey': newKey},
        extra: {'message': message, 'data': data},
        groupId: groupId);
  }

  /// [groupId]
  /// see: [NPage.newGroupKey] and [NPage.resolveGroupId]
  static RouterAction detail02({required String message, required groupId}) {
    return RouterAction(Routes.detail02, Routes.router,
        extra: {'message': message}, groupId: groupId);
  }

  /// [groupId]
  /// see: [NPage.newGroupKey] and [NPage.resolveGroupId]
  static RouterAction fffNewPage(
      {required String hhh, String m = '', required groupId}) {
    return RouterAction(Routes.fffNewPage, Routes.router,
        extra: {'hhh': hhh, 'm': m}, groupId: groupId);
  }

  /// [groupId]
  /// see: [NPage.newGroupKey] and [NPage.resolveGroupId]
  static RouterAction detail({required String message, required groupId}) {
    return RouterAction(Routes.detail, Routes.router,
        extra: {'message': message}, groupId: groupId);
  }

  static RouterAction live() {
    return RouterAction(Routes.live, Routes.router);
  }

  static RouterAction home() {
    return RouterAction(Routes.home, Routes.router);
  }
}
