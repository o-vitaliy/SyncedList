import 'package:material_ui/material_ui.dart';
import 'package:shopping_list/localization.dart';
import 'package:shopping_list/ui/widgets/widgets.dart';

class ListItemEmpty extends StatelessWidget {
  const ListItemEmpty({super.key});

  @override
  Widget build(BuildContext context) {
    final l = AppLocalizations.of(context);
    return EmptyState(
      icon: Icons.shopping_basket_outlined,
      title: l.emptyItemsListInfo1,
      body: l.emptyItemsBody,
    );
  }
}
