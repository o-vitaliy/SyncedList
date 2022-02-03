import 'package:flutter/material.dart';
import 'package:give_a_ride/localization.dart';

class UserListEmptyWidget extends StatelessWidget {
  final _lineBreak = const TextSpan(text: "\n");
  
  const UserListEmptyWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final l = Localizations.of(context, AppLocalizationsData);
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: RichText(
          text: TextSpan(
            style: const TextStyle(color: Colors.black, fontSize: 16),
            children: [
              TextSpan(
                  text: l.emptyListInfo1,
                  style: const TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 18,
                  )),
              _lineBreak ,
            _lineBreak,
              TextSpan(text: l.emptyListInfoClick),
              const WidgetSpan(
                  child: Icon(Icons.add),
                  alignment: PlaceholderAlignment.middle),
              TextSpan(text: l.emptyListInfoClickToCreate),
            _lineBreak,
              TextSpan(text: l.emptyListInfoClick),
              const WidgetSpan(
                  child: Icon(Icons.share),
                  alignment: PlaceholderAlignment.middle),
              TextSpan(text: l.emptyListInfoClickToShare),
              _lineBreak,
              _lineBreak,
              TextSpan(text: l.emptyListEnjoySharing),
            ],
          ),
        ),
      ),
    );
  }
}
