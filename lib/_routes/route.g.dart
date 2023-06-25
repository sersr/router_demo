// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'route.dart';

// **************************************************************************
// RouterGenerator
// **************************************************************************

// ignore_for_file: prefer_const_constructors

class Routes {
  Routes._();

  static Routes? _instance;

  factory Routes({
    bool newInstance = false,
    Map<String, dynamic> params = const {},
    Map<String, dynamic>? extra,
    Object? groupId,
  }) {
    if (!newInstance && _instance != null) {
      return _instance!;
    }
    return _instance = Routes._().._init(params, extra, groupId);
  }

  void _init(
    Map<String, dynamic> params,
    Map<String, dynamic>? extra,
    Object? groupId,
  ) {
    _detail01Build = NPage(
      groupOwner: () => detail,
      path: 'detail01Build/:newKey',
      pageBuilder: (entry) => MaterialIgnorePage(
          key: entry.pageKey,
          child: Nop.page(
            groupList: const [DetailProvider],
            builders: const [_Routes.detailWidgetBuild],
            group: entry.groupId,
            child: Detail01Page.build(
                message: entry.queryParams['message'],
                hhh: entry.params['newKey']),
          )),
    );

    _detail02 = NPage(
      groupOwner: () => detail,
      path: 'detail02',
      pageBuilder: (entry) => MaterialIgnorePage(
          key: entry.pageKey,
          child: Nop.page(
            groupList: const [DetailProvider],
            group: entry.groupId,
            child: Detail02Page(message: entry.queryParams['message']),
          )),
    );

    _fffNewPage = NPage(
      groupOwner: () => detail,
      path: 'fffNewPage',
      pageBuilder: (entry) => MaterialIgnorePage(
          key: entry.pageKey,
          child: Nop.page(
            groupList: const [DetailProvider],
            group: entry.groupId,
            child: fffPage(entry.queryParams['hhh'], entry.queryParams['m']),
          )),
    );

    _detail = NPage(
      groupOwner: true,
      pages: [_detail01Build, _detail02, _fffNewPage],
      path: 'detail',
      pageBuilder: (entry) => _Routes.detailBuilder(
          entry,
          Nop.page(
            groupList: const [DetailProvider],
            group: entry.groupId,
            child: DetailPage(message: entry.queryParams['message']),
          )),
    );

    _live = NPage(
      path: 'live',
      pageBuilder: (entry) => MaterialIgnorePage(
          key: entry.pageKey,
          child: const Nop.page(
            child: LivePage(),
          )),
    );

    _home = NPageMain(
      pages: [_detail, _live],
      path: '/',
      redirectBuilder: redirect,
      pageBuilder: (entry) => MaterialIgnorePage(
          key: entry.pageKey,
          child: const Nop.page(
            child: HomePage(),
          )),
    );

    _router = NRouter(
      rootPage: _home,
      restorationId: 'hello',
      params: params,
      extra: extra,
      groupId: groupId,
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
      {required String message, String newKey = '', required groupId}) {
    return RouterAction(Routes.detail01Build, Routes.router,
        params: {'newKey': newKey},
        extra: {'message': message},
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
