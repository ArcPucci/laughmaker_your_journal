import 'package:go_router/go_router.dart';
import 'package:laughmaker_your_journal/screens/screens.dart';
import 'package:laughmaker_your_journal/widgets/widgets.dart';

class RouterController {
  final router = GoRouter(
    initialLocation: "/library/levels/congrats",
    routes: [
      ShellRoute(
        pageBuilder: (context, state, child) {
          return buildPageWithDefaultTransition(
            context: context,
            state: state,
            child: NavigationScreen(
              path: state.fullPath!,
              child: child,
            ),
          );
        },
        routes: [
          GoRoute(
            path: '/',
            pageBuilder: (context, state) {
              return buildPageWithDefaultTransition(
                context: context,
                state: state,
                child: const MyJokesScreen(),
              );
            },
            routes: [
              GoRoute(
                path: 'add',
                pageBuilder: (context, state) {
                  return buildPageWithDefaultTransition(
                    context: context,
                    state: state,
                    child: const AddJokeScreen(),
                  );
                },
              ),
              GoRoute(
                path: 'edit',
                pageBuilder: (context, state) {
                  return buildPageWithDefaultTransition(
                    context: context,
                    state: state,
                    child: const AddJokeScreen(edit: true),
                  );
                },
              ),
            ],
          ),
          GoRoute(
            path: '/guides',
            pageBuilder: (context, state) {
              return buildPageWithDefaultTransition(
                context: context,
                state: state,
                child: const GuidesScreen(),
              );
            },
            routes: [
              GoRoute(
                path: 'guide',
                pageBuilder: (context, state) {
                  return buildPageWithDefaultTransition(
                    context: context,
                    state: state,
                    child: const GuideScreen(),
                  );
                },
              ),
            ],
          ),
          GoRoute(
            path: '/library',
            pageBuilder: (context, state) {
              return buildPageWithDefaultTransition(
                context: context,
                state: state,
                child: const LibraryScreen(),
              );
            },
            routes: [
              GoRoute(
                path: 'quotes',
                pageBuilder: (context, state) {
                  return buildPageWithDefaultTransition(
                    context: context,
                    state: state,
                    child: const QuotesAndJokesScreen(),
                  );
                },
              ),
              GoRoute(
                path: 'levels',
                pageBuilder: (context, state) {
                  return buildPageWithDefaultTransition(
                    context: context,
                    state: state,
                    child: const LevelsScreen(),
                  );
                },
                routes: [
                  GoRoute(
                    path: 'quiz',
                    pageBuilder: (context, state) {
                      return buildPageWithDefaultTransition(
                        context: context,
                        state: state,
                        child: const QuizScreen(),
                      );
                    },
                  ),
                  GoRoute(
                    path: 'congrats',
                    pageBuilder: (context, state) {
                      return buildPageWithDefaultTransition(
                        context: context,
                        state: state,
                        child: const CongratsScreen(),
                      );
                    },
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    ],
  );
}
