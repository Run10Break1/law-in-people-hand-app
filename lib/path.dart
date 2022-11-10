// ignore_for_file: annotate_overrides
import 'package:flutter/material.dart';


typedef WrapBuilder = Widget Function(BuildContext context, Widget widget);

class PathManagerWidget extends StatefulWidget {
  final String title;
  final List<PathRoute> root;
  final String homeName;
  final ThemeData? theme;
  late final ThemeData? Function() themeBuilder;
  final WrapBuilder? homeWrapBuilder;
  final WrapBuilder? pathWrapBuilder;
  late final WrapBuilder materialAppWrapBuilder;
  final GlobalKey<NavigatorState>? navigatorKey;

  PathManagerWidget({Key? key, this.navigatorKey, this.theme, ThemeData? Function()? themeBuilder, required this.root, required this.homeName, required this.title, this.homeWrapBuilder, this.pathWrapBuilder, WrapBuilder? materialAppWrapBuilder}) : super(key: key) {
    this.materialAppWrapBuilder = materialAppWrapBuilder ?? (context, materialApp) => materialApp;
    this.themeBuilder = themeBuilder ?? () => null;
  }

  @override
  State<PathManagerWidget> createState() => _PathManagerWidgetState();
}

class _PathManagerWidgetState extends State<PathManagerWidget> {
  late final PathManager _pathManager;

  void initState() {
    super.initState();
    _pathManager = PathManager._(homeName: widget.homeName, root: widget.root, homeWrapBuilder: widget.homeWrapBuilder, pathWrapBuilder: widget.pathWrapBuilder);
  }

  @override
  Widget build(BuildContext context) {
    return widget.materialAppWrapBuilder(
      context,
      Builder(
        builder: (BuildContext context) {
          return MaterialApp(
            title: widget.title,
            navigatorKey: widget.navigatorKey,
            debugShowCheckedModeBanner: false,
            onGenerateRoute: _pathManager._generateRoute,
            onUnknownRoute: _unknownRoute,
            initialRoute: widget.homeName,
            onGenerateInitialRoutes: (String initialRoute) {
              return [_pathManager._home];
            },
            theme: widget.theme ?? widget.themeBuilder(),
          );
        },
      ),
    );
  }

  Route _unknownRoute(RouteSettings settings) {
    throw UnimplementedError();
  }
}


class PathManager {
  static late final PathManager instance;

  final List<PathRoute> root;
  final Map<String, PathRoute> _map;
  late final Route _home;

  final WrapBuilder? pathWrapBuilder;

  PathManager._({required this.root, required String homeName, required WrapBuilder? homeWrapBuilder, this.pathWrapBuilder}) : _map = {} {
    _recursiveMapping("", root);
    _home = _map[homeName]!.createRoute(isHome: true, homeWrapBuilder: homeWrapBuilder, pathWrapBuilder: pathWrapBuilder);

    instance = this;
  }

  Route _generateRoute(RouteSettings settings) {
    String name = settings.name!;
    Object? arguments = settings.arguments;

    return _map[name]!.createRoute(arguments: arguments, pathWrapBuilder: pathWrapBuilder);
  }

  void _recursiveMapping(String parentPathName, List<PathRoute> children) {
    for(var pathRoute in children) {
      String currentPathName = "$parentPathName/${pathRoute.name}";
      _map[currentPathName] = pathRoute..name = currentPathName;

      _recursiveMapping(currentPathName, pathRoute.children);
    }
  }

  Future<void> pushCanonicalNamed(BuildContext context, String canonicalName, {Object? arguments}) {
    return _pushNamed(context, canonicalName, arguments);
  }

  Future<void> pushUniqueNamed(BuildContext context, String uniqueName, {Object? arguments}) {
    String canonicalName = uniqueToCanonical(uniqueName);

    return _pushNamed(context, canonicalName, arguments);
  }

  void pop(BuildContext context) {
    Navigator.pop(context);
  }

  void popUntil(BuildContext context, RoutePredicate predicate) {
    Navigator.popUntil(context, predicate);
  }

  void popUntilUnique(BuildContext context, String uniqueName) {
    String canonicalName = uniqueToCanonical(uniqueName);
    print("canonicalName : $canonicalName");

    bool predicate(Route route) {
      return route.settings.name == canonicalName;
    }

    return popUntil(context, predicate);
  }

  void pushNamedAndRemoveUntil(BuildContext context, String name, RoutePredicate predicate, {bool isCanonical = true, Object? arguments}) {
    String canonicalName = isCanonical ? name : uniqueToCanonical(name);

    Navigator.pushNamedAndRemoveUntil(context, canonicalName, predicate, arguments: arguments);
  }

  Future<void> _pushNamed(BuildContext context, String name, [Object? arguments]) {
    return Navigator.pushNamed(context, name, arguments: arguments);
  }

  String uniqueToCanonical(String uniqueName) {
    for(String key in _map.keys) {
      if(key.endsWith(uniqueName)) {
        return key;
      }
    }

    throw Exception("canonical is null");
  }
}


typedef Constructor<T> = T Function(PathRouteEventRecorder recorder, {Object? arguments});
typedef TraceableConstructor<T, D extends Trace> = T Function(PathRouteEventRecorder recorder, D trace, {Object? arguments});

class PathRoute {
  final Constructor<Widget>? constructor;
  String name;
  final List<PathRoute> children;

  PathRoute({required this.name, this.constructor, this.children = const []});


  Route createRoute({Object? arguments, bool isHome = false, WrapBuilder? homeWrapBuilder, WrapBuilder? pathWrapBuilder}) {
    final PathRouteEventRecorder recorder = PathRouteEventRecorder._(name);

    recorder._start();
    return _PageRouteBuilder(
      recorder: recorder,
      settings: RouteSettings(name: name),
      pageBuilder: (BuildContext context, Animation<double> animation, Animation<double> secondaryAnimation) {
        Widget child = widget(recorder, arguments);

        if(isHome && homeWrapBuilder != null) {
          child = homeWrapBuilder(context, child);
        }

        if(pathWrapBuilder != null) {
          child = pathWrapBuilder(context, child);
        }

        return child;
      },
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        return child;
      },
    );
  }

  Widget widget(PathRouteEventRecorder recorder, Object? arguments) {
    if(constructor != null) {
      return constructor!(recorder, arguments: arguments);
    } else {
      throw Exception("constructor is null");
    }
  }
}

class TraceablePathRoute<D extends Trace> extends PathRoute {
  final TraceableConstructor<Widget, D>? traceableConstructor;
  final D trace;

  TraceablePathRoute({required String name, this.traceableConstructor, required this.trace, List<PathRoute> children = const []})
      : super(name: name, children: children);

  Widget widget(PathRouteEventRecorder recorder, Object? arguments) {
    if(traceableConstructor != null) {
      return traceableConstructor!(recorder, trace, arguments: arguments);
    } else {
      throw Exception("traceableConstructor is null");
    }
  }
}

abstract class Trace {
  void dispose();
}

class TraceMock extends Trace {
  void dispose() {

  }
}

class _PageRouteBuilder extends PageRouteBuilder {
  final PathRouteEventRecorder recorder;

  _PageRouteBuilder({
    required this.recorder,
    required RoutePageBuilder pageBuilder,
    RouteSettings? settings,
    required Widget Function(BuildContext, Animation , Animation , Widget) transitionsBuilder
  }) : super(pageBuilder: pageBuilder, settings: settings, transitionsBuilder: transitionsBuilder);

  void dispose() {
    debugPrint("${settings.name}을 나갔습니다.");
    recorder._stop();

    super.dispose();
  }

}


class PathRouteEventRecorder {
  final String pathRouteName;
  VoidCallback? onFinal;

  final List<PathRouteEvent> _events = [];

  PathRouteEventRecorder._(this.pathRouteName);

  void _start() {
    _events.add(PathRouteEvent("enter"));
  }

  void _stop() {
    _events.add(PathRouteEvent("exit"));

    if(onFinal != null) onFinal!();
  }

  void addEvent(PathRouteEvent event) {
    _events.add(event);
  }

  String toString() {
    String? duration;

    if(_events.length >= 2) {
      duration = _events.last.time.difference(_events.first.time).toString().split(".")[0];
    }

    return '''{
      "name"     : "$pathRouteName",
      "duration" : "$duration",
      "history"  : [${_events.map((e) => e.toString()).join(",")}]
    }''';
  }
}

class PathRouteEvent {
  final DateTime time;
  final String message;

  PathRouteEvent(this.message) : time = DateTime.now();

}

