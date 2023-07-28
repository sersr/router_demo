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
    bool updateLocation = false,
    List<NavigatorObserver> observers = const [],
  }) {
    if (!newInstance && _instance != null) {
      return _instance!;
    }
    final instance = _instance = Routes._();
    instance._init(params, extra, groupId, observers, updateLocation);
    return instance;
  }

  void _init(
    Map<String, dynamic> params,
    Map<String, dynamic>? extra,
    Object? groupId,
    List<NavigatorObserver> observers,
    bool updateLocation,
  ) {
    _detail01Build = NPage(
      useGroupId: true,
      groupList: const [DetailProvider],
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
            child: _Routes.detailWidgetBuild(
                Detail01Page.build(message: message, hhh: newKey, data: data)));
      },
    );

    _detail02 = NPage(
      useGroupId: true,
      groupList: const [DetailProvider],
      path: 'detail02',
      redirectBuilder: redirect,
      pageBuilder: (entry) {
        var message = entry.queryParams['message'];
        return MaterialIgnorePage(
            key: entry.pageKey,
            entry: entry,
            child: Detail02Page(message: message));
      },
    );

    _fffNewPage = NPage(
      useGroupId: true,
      groupList: const [DetailProvider],
      path: 'fffNewPage',
      redirectBuilder: redirect,
      pageBuilder: (entry) {
        var hhh = entry.queryParams['hhh'];
        var m = entry.queryParams['m'];
        return MaterialIgnorePage(
            key: entry.pageKey, entry: entry, child: fffPage(hhh, m));
      },
    );

    _detail = NPage(
      useGroupId: true,
      pages: [_detail01Build, _detail02, _fffNewPage],
      groupList: const [DetailProvider],
      path: 'detail',
      redirectBuilder: redirect,
      pageBuilder: (entry) {
        var message = entry.queryParams['message'];
        return _Routes.detailBuilder(entry, DetailPage(message: message));
      },
    );

    _live = NPage(
      path: 'live',
      pageBuilder: (entry) {
        return MaterialIgnorePage(
            key: entry.pageKey, entry: entry, child: const LivePage());
      },
    );

    _singletonTest = NPage(
      path: 'singletonTest',
      pageBuilder: (entry) {
        return MaterialIgnorePage(
            key: entry.pageKey, entry: entry, child: const SingletonTestPage());
      },
    );

    _repalcementNew = NPage(
      path: 'repalcementNew',
      pageBuilder: (entry) {
        return MaterialIgnorePage(
            key: entry.pageKey,
            entry: entry,
            child: const RepalcementNewPage());
      },
    );

    _repalcementBottomSheet = NPage(
      path: 'repalcementBottomSheet',
      pageBuilder: (entry) {
        return _Routes.replacementBottomSheetPage(
            entry, const RepalcementBottomSheetPage());
      },
    );

    _replacement = NPage(
      pages: [_repalcementNew, _repalcementBottomSheet],
      path: 'replacement',
      pageBuilder: (entry) {
        return MaterialIgnorePage(
            key: entry.pageKey, entry: entry, child: const ReplacementPage());
      },
    );

    _home = NPageMain(
      errorPageBuilder: errorBuild,
      pages: [_detail, _live, _singletonTest, _replacement],
      path: '/',
      pageBuilder: (entry) {
        return MaterialIgnorePage(
            key: entry.pageKey, entry: entry, child: const HomePage());
      },
    );

    _router = NRouter(
      rootPage: _home,
      restorationId: 'hello',
      params: params,
      extra: extra,
      groupId: groupId,
      observers: observers,
      updateLocation: updateLocation,
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
  late final NPage _singletonTest;
  static NPage get singletonTest => _instance!._singletonTest;
  late final NPage _repalcementNew;
  static NPage get repalcementNew => _instance!._repalcementNew;
  late final NPage _repalcementBottomSheet;
  static NPage get repalcementBottomSheet => _instance!._repalcementBottomSheet;
  late final NPage _replacement;
  static NPage get replacement => _instance!._replacement;
  late final NPageMain _home;
  static NPageMain get home => _instance!._home;
}

class NavRoutes {
  NavRoutes._();

  /// [newKey] : [Detail01Page.hhh]
  /// [groupId]
  /// see: [NPage.newGroupKey]
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
  /// see: [NPage.newGroupKey]
  static RouterAction detail02({required String message, required groupId}) {
    return RouterAction(Routes.detail02, Routes.router,
        extra: {'message': message}, groupId: groupId);
  }

  /// [groupId]
  /// see: [NPage.newGroupKey]
  static RouterAction fffNewPage(
      {required String hhh, String m = '', required groupId}) {
    return RouterAction(Routes.fffNewPage, Routes.router,
        extra: {'hhh': hhh, 'm': m}, groupId: groupId);
  }

  /// [groupId]
  /// see: [NPage.newGroupKey]
  static RouterAction detail({required String message, required groupId}) {
    return RouterAction(Routes.detail, Routes.router,
        extra: {'message': message}, groupId: groupId);
  }

  /// [groupId]
  /// see: [NPage.newGroupKey]
  static RouterAction live({groupId}) {
    return RouterAction(Routes.live, Routes.router, groupId: groupId);
  }

  /// [groupId]
  /// see: [NPage.newGroupKey]
  static RouterAction singletonTest({groupId}) {
    return RouterAction(Routes.singletonTest, Routes.router, groupId: groupId);
  }

  /// [groupId]
  /// see: [NPage.newGroupKey]
  static RouterAction repalcementNew({groupId}) {
    return RouterAction(Routes.repalcementNew, Routes.router, groupId: groupId);
  }

  /// [groupId]
  /// see: [NPage.newGroupKey]
  static RouterAction repalcementBottomSheet({groupId}) {
    return RouterAction(Routes.repalcementBottomSheet, Routes.router,
        groupId: groupId);
  }

  /// [groupId]
  /// see: [NPage.newGroupKey]
  static RouterAction replacement({groupId}) {
    return RouterAction(Routes.replacement, Routes.router, groupId: groupId);
  }

  /// [groupId]
  /// see: [NPage.newGroupKey]
  static RouterAction home({groupId}) {
    return RouterAction(Routes.home, Routes.router, groupId: groupId);
  }
}
