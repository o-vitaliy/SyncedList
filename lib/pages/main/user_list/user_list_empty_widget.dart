import 'package:flutter/material.dart';
import 'package:shared_shopping_list/localizations.dart';

class UserListEmptyWidget extends StatelessWidget {
  const UserListEmptyWidget({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final l = L.of(context);
    return Container(
      child: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: RichText(
            text: TextSpan(
              style: TextStyle(color: Colors.black, fontSize: 16),
              children: [
                TextSpan(
                    text: l.emptyListInfo1,
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 18,
                    )),
                TextSpan(text: "\n"),
                TextSpan(text: "\n"),
                TextSpan(text: l.emptyListInfoClick),
                WidgetSpan(
                    child: Icon(Icons.add),
                    alignment: PlaceholderAlignment.middle),
                TextSpan(text: l.emptyListInfoClickToCreate),
                TextSpan(text: "\n"),
                TextSpan(text: l.emptyListInfoClick),
                WidgetSpan(
                    child: Icon(Icons.share),
                    alignment: PlaceholderAlignment.middle),
                TextSpan(text: l.emptyListInfoClickToShare),
                TextSpan(text: "\n"),
                TextSpan(text: "\n"),
                TextSpan(text: l.emptyListEnjoySharing),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
