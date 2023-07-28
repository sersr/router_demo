import 'package:demo/_routes/route.dart';
import 'package:demo/modules/widgets/page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_nop/router.dart';
import 'package:nop/nop.dart';

class ReplacementPage extends StatefulWidget {
  const ReplacementPage({super.key});

  @override
  State<ReplacementPage> createState() => _ReplacementPageState();
}

class _ReplacementPageState extends State<ReplacementPage> {
  @override
  void initState() {
    super.initState();
    timeDilation = 5;
  }

  @override
  void dispose() {
    timeDilation = 1;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BasePage(
      title: 'replacement',
      children: [
        button(
          text: 'framework: bottom sheet',
          onTap: () {
            showModalBottomSheet(
              context: context,
              builder: (context) {
                return const RepalcementBottomSheetPage();
              },
            ).then(log('framework'));
          },
        ),
        button(
          text: 'new instance: bottom sheet',
          onTap: () {
            modalSheetPage(context: context);
          },
        ),
        button(
          text: 'router: bottom sheet',
          onTap: () {
            NavRoutes.repalcementBottomSheet()
                .go()
                .popped
                .then(log('router pageBased'));
          },
        ),
      ],
    );
  }
}

void Function(dynamic) log(String label) {
  return (value) {
    Log.w('$label: $value');
  };
}

void modalSheetPage({
  required BuildContext context,
  Color? backgroundColor,
  double? elevation,
  ShapeBorder? shape,
  Clip? clipBehavior,
  BoxConstraints? constraints,
  Color? barrierColor,
  bool isScrollControlled = false,
  bool useRootNavigator = false,
  bool isDismissible = true,
  bool enableDrag = true,
  bool? showDragHandle,
  bool useSafeArea = false,
  RouteSettings? routeSettings,
  AnimationController? transitionAnimationController,
  Offset? anchorPoint,
}) {
  assert(debugCheckHasMediaQuery(context));
  assert(debugCheckHasMaterialLocalizations(context));

  final NavigatorState navigator =
      Navigator.of(context, rootNavigator: useRootNavigator);
  final MaterialLocalizations localizations = MaterialLocalizations.of(context);

  final nPage = NPage(pageBuilder: (entry) {
    return BottomSheetPage(
        entry: entry,
        builder: (settings) {
          return ModalBottomSheetRoute(
            builder: (context) {
              return const RepalcementBottomSheetPage();
            },
            capturedThemes:
                InheritedTheme.capture(from: context, to: navigator.context),
            isScrollControlled: isScrollControlled,
            barrierLabel: localizations.scrimLabel,
            barrierOnTapHint:
                localizations.scrimOnTapHint(localizations.bottomSheetLabel),
            backgroundColor: backgroundColor,
            elevation: elevation,
            shape: shape,
            clipBehavior: clipBehavior,
            constraints: constraints,
            isDismissible: isDismissible,
            modalBarrierColor: barrierColor ??
                Theme.of(context).bottomSheetTheme.modalBarrierColor,
            enableDrag: enableDrag,
            showDragHandle: showDragHandle,
            settings: settings,
            transitionAnimationController: transitionAnimationController,
            anchorPoint: anchorPoint,
            useSafeArea: useSafeArea,
          );
        });
  });

  router.goPage(nPage).popped.then(log('router new instance'));
}

class BottomSheetPage<T> extends Page<T> with RouteQueueEntryPage {
  BottomSheetPage({required this.entry, required this.builder});

  @override
  final RouteQueueEntry entry;
  final Route<T> Function(Page settings) builder;
  @override
  Route<T> createRoute(BuildContext context) {
    return builder(this);
  }
}

class RepalcementBottomSheetPage extends StatefulWidget {
  const RepalcementBottomSheetPage({super.key});

  @override
  State<RepalcementBottomSheetPage> createState() =>
      _ReplacementBottomSheetPageState();
}

class _ReplacementBottomSheetPageState
    extends State<RepalcementBottomSheetPage> {
  @override
  Widget build(BuildContext context) {
    return BasePage(title: 'bottom sheet', children: [
      button(
        text: 'goReplacement newPage',
        onTap: () {
          NavRoutes.repalcementNew().goReplacement(result: 'replace.');
        },
      ),
    ]);
  }
}
