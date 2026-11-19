import 'package:material_ui/material_ui.dart';
import 'package:shopping_list/localization.dart';

class ListItemEmpty extends StatelessWidget {
  const ListItemEmpty({super.key});

  @override
  Widget build(BuildContext context) {
    const breakLine = TextSpan(text: "\n");
    final l = AppLocalizations.of(context);
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: RichText(
          text: TextSpan(
            style: const TextStyle(color: Colors.black, fontSize: 16),
            children: [
              TextSpan(
                text: l.emptyItemsListInfo1,
                style: const TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 18,
                ),
              ),
              breakLine,
              breakLine,
              TextSpan(text: l.emptyListInfoClick),
              const WidgetSpan(
                child: Icon(Icons.add),
                alignment: PlaceholderAlignment.middle,
              ),
              TextSpan(text: l.emptyItemsListInfoClickToCreate),
              breakLine,
              TextSpan(text: l.emptyListInfoClick),
              const WidgetSpan(
                child: Icon(Icons.share),
                alignment: PlaceholderAlignment.middle,
              ),
              TextSpan(text: l.emptyItemsListInfoClickToShare),
              breakLine,
              breakLine,
              TextSpan(text: l.emptyListEnjoySharing),
            ],
          ),
        ),
      ),
    );
  }
}
