
import 'package:flutter/material.dart';

import '../../generated/app_localizations.dart';
import '../backwards_view.dart';

class DefaultScaffold extends StatelessWidget {
  final OnBackPressed onBackPressed;
  final Widget body;
  final String? tabTitle, appbarTitle;
  final bool onlyBackButton, hideAllActions;
  final void Function()? onAppbarTitlePressed;

  const DefaultScaffold({super.key, required this.onBackPressed, this.tabTitle, this.appbarTitle, this.onAppbarTitlePressed, required this.body, this.onlyBackButton = false, this.hideAllActions = false});

  @override
  Widget build(BuildContext context) {
    return BackwardsView(onBackPressed: onBackPressed, child: Title(title: tabTitle ?? InsightOfYouAppLocalizations.of(context)!.app_title, color: Colors.black,
    child:  Scaffold(drawer: onlyBackButton || hideAllActions ? null : Drawer(
      child: ListView(
        children: [
          /*ListTile(
            leading: const Icon(Icons.home),
            title: Text(InsightOfYouAppLocalizations.of(context)!.appbar_home),
            onTap: () => _onHomePressed(context),
          ),
          ListTile(
            leading: const Icon(Icons.search),
            title: Text(InsightOfYouAppLocalizations.of(context)!.appbar_search),
            onTap: () => _onSearchPressed(context),
          ),
          ListTile(
            leading: const Icon(Icons.login),
            title: Text(InsightOfYouAppLocalizations.of(context)!.appbar_sign_in_or_up),
            onTap: () => _onSignInOrUpPressed(context),
          ),
          ListTile(
            leading: const Icon(Icons.group),
            title: Text(InsightOfYouAppLocalizations.of(context)!.appbar_about_us),
            onTap: () => _onAboutUsPressed(context),
          ),
          ListTile(
            leading: const Icon(Icons.accessibility),
            title: Text(EFarmerAppLocalizations.of(context)!.appbar_future),
            onTap: () => _onFuturePressed(context),
          ),*/
        ],
      ),
    ),
      appBar: AppBar(
        leading: onlyBackButton && !hideAllActions ? IconButton(onPressed: () => onBackPressed(context), icon: const Icon(Icons.arrow_back)) : null,
          titleSpacing: 0,
          title: Row(crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                //TextButton(onPressed: () => onAppbarTitlePressed ?? (onlyBackButton || hideAllActions ? 1 : _onHomePressed(context)), child: Text(appbarTitle ?? EFarmerAppLocalizations.of(context)!.app_title, style: Theme.of(context).textTheme.titleLarge!)),//.copyWith(color: Theme.of(context).colorScheme.onPrimary))),
                if(!onlyBackButton && !hideAllActions) Expanded(child: LayoutBuilder(builder: (context, constraints) => constraints.maxWidth <= 650 ? Container() : Wrap(crossAxisAlignment: WrapCrossAlignment.center,
                  runAlignment: WrapAlignment.center,
                  spacing: 5,
                  children: [
                    //TextButton(onPressed: () => _onSearchPressed(context), child: Text(InsightOfYouAppLocalizations.of(context)!.appbar_search, style: Theme.of(context).textTheme.labelLarge!)),//.copyWith(color: Theme.of(context).colorScheme.onPrimary))),
                    //TextButton(onPressed: () => _onSignInOrUpPressed(context), child: Text(InsightOfYouAppLocalizations.of(context)!.appbar_sign_in_or_up, style: Theme.of(context).textTheme.labelLarge!)),//.copyWith(color: Theme.of(context).colorScheme.onPrimary))),
                    //TextButton(onPressed: () => _onAboutUsPressed(context), child: Text(InsightOfYouAppLocalizations.of(context)!.appbar_about_us, style: Theme.of(context).textTheme.labelLarge!)),//.copyWith(color: Theme.of(context).colorScheme.onPrimary))),
                    //TextButton(onPressed: () => _onFuturePressed(context), child: Text(InsightOfYouAppLocalizations.of(context)!.appbar_future, style: Theme.of(context).textTheme.labelLarge!)),//.copyWith(color: Theme.of(context).colorScheme.onPrimary))),
                  ],
                ),),),])

    ),
      body: body,
    )));
  }

  //void _onHomePressed(BuildContext context) => context.goNamed(routeNewConfig);

  void _onSearchPressed(BuildContext context) {

  }

  void _onSignInOrUpPressed(BuildContext context) {

  }

  void _onAboutUsPressed(BuildContext context) {

  }

  void _onFuturePressed(BuildContext context) {

  }
}