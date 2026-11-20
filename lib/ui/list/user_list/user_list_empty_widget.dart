import 'package:material_ui/material_ui.dart';
import 'package:shopping_list/localization.dart';
import 'package:shopping_list/ui/widgets/widgets.dart';

class UserListEmptyWidget extends StatelessWidget {
  const UserListEmptyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final l = AppLocalizations.of(context);
    return EmptyState(
      icon: Icons.checklist_rounded,
      title: l.emptyListInfo1,
      body: l.emptyListsBody,
    );
  }
}
