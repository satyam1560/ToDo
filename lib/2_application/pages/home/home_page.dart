import 'package:flutter/material.dart';
import 'package:flutter_adaptive_scaffold/flutter_adaptive_scaffold.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:todo_cleanarch/2_application/core/page_config.dart';
import 'package:todo_cleanarch/2_application/pages/detail/todo_detail_page.dart';
import 'package:todo_cleanarch/2_application/pages/home/bloc/cubit/navigation_todo_cubit.dart';
import 'package:todo_cleanarch/2_application/pages/setting/setting_page.dart';

import '../create_todo_collection/create_todo_collection.dart';
import '../dashboard/dashboard_page.dart';
import '../overview/overview_page.dart';

class HomePageProvider extends StatelessWidget {
  const HomePageProvider({super.key, required this.tab});

  final String tab;

  @override
  Widget build(BuildContext context) {
    return BlocProvider<NavigationTodoCubit>(
      create: (_) => NavigationTodoCubit(),
      child: HomePage(tab: tab),
    );
  }
}

class HomePage extends StatefulWidget {
  HomePage({
    super.key,
    required String tab,
  }) : index = tabs.indexWhere((element) => element.name == tab);

  static const PageConfig pageConfig = PageConfig(
    icon: Icons.home_rounded,
    name: 'home',
  );

  final int index;

  // list of all tabs that should be displayed inside our navigation bar
  static const tabs = [
    DasboardPage.pageConfig,
    OverviewPage.pageConfig,
  ];

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final destinations = HomePage.tabs
      .map(
        (page) =>
            NavigationDestination(icon: Icon(page.icon), label: page.name),
      )
      .toList();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      body: SafeArea(
        child: AdaptiveLayout(
          primaryNavigation: SlotLayout(
            config: <Breakpoint, SlotLayoutConfig>{
              Breakpoints.mediumAndUp: SlotLayout.from(
                key: const Key('primary-navigation-medium'),
                builder: (context) => AdaptiveScaffold.standardNavigationRail(
                  leading: IconButton(
                    onPressed: () {
                      context
                          .pushNamed(CreateToDoCollectionPage.pageConfig.name);
                    },
                    icon: Icon(CreateToDoCollectionPage.pageConfig.icon),
                    tooltip: 'Add Collection',
                  ),
                  trailing: IconButton(
                    onPressed: () =>
                        context.pushNamed(SettingsPage.pageConfig.name),
                    icon: Icon(SettingsPage.pageConfig.icon),
                  ),
                  selectedLabelTextStyle:
                      TextStyle(color: theme.colorScheme.onBackground),
                  selectedIconTheme:
                      IconThemeData(color: theme.colorScheme.onBackground),
                  unselectedIconTheme: IconThemeData(
                      color: theme.colorScheme.onBackground.withOpacity(0.5)),
                  onDestinationSelected: (index) =>
                      _tapOnNavigationDestination(context, index),
                  selectedIndex: widget.index,
                  destinations: destinations
                      .map(
                        (_) => AdaptiveScaffold.toRailDestination(_),
                      )
                      .toList(),
                ),
              ),
            },
          ),
          bottomNavigation: SlotLayout(
            config: <Breakpoint, SlotLayoutConfig>{
              Breakpoints.small: SlotLayout.from(
                key: const Key('bottom-navigation-small'),
                builder: (_) => AdaptiveScaffold.standardBottomNavigationBar(
                  destinations: destinations,
                  currentIndex: widget.index,
                  onDestinationSelected: (value) =>
                      _tapOnNavigationDestination(context, value),
                ),
              ),
            },
          ),
          body: SlotLayout(
            config: <Breakpoint, SlotLayoutConfig>{
              Breakpoints.smallAndUp: SlotLayout.from(
                key: const Key('primary-body-small'),
                builder: (_) => HomePage.tabs[widget.index].child,
              ),
            },
          ),
          secondaryBody: SlotLayout(
            config: <Breakpoint, SlotLayoutConfig>{
              Breakpoints.mediumAndUp: SlotLayout.from(
                key: const Key('secondary-body-medium'),
                builder: widget.index != 1
                    ? null
                    : (_) => BlocBuilder<NavigationTodoCubit,
                            NavigationTodoCubitState>(
                          builder: (context, state) {
                            final selectedId = state.selectedCollectionId;
                            final isSecondBodyDisplayed =
                                Breakpoints.mediumAndUp.isActive(context);

                            context
                                .read<NavigationTodoCubit>()
                                .secondBodyHasChanged(
                                  isSecondBodyDisplayed: isSecondBodyDisplayed,
                                );

                            if (selectedId == null) {
                              return const Placeholder();
                            }
                            return ToDoDetailPageProvider(
                              key: Key(selectedId.value),
                              collectionId: selectedId,
                            );
                          },
                        ),
              ),
            },
          ),
        ),
      ),
    );
  }

  void _tapOnNavigationDestination(BuildContext context, int index) =>
      context.goNamed(
        HomePage.pageConfig.name,
        pathParameters: {
          'tab': HomePage.tabs[index].name,
        },
      );
}
