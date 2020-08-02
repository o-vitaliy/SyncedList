import 'package:async_redux/async_redux.dart';
import 'package:share/share.dart';
import 'package:shared_shopping_list/app/app_state.dart';
import 'package:shared_shopping_list/data/deeplinks/deeplink.dart';
import 'package:shared_shopping_list/models/user_list.dart';

class UserListActionShare extends ReduxAction<AppState> {
  final UserList item;

  UserListActionShare(this.item);
  @override
  Future<AppState> reduce() async {
    final link = await Deeplink.createLink(item.id, item.name);
    Share.share(link.toString());
    return null;
  }
}
