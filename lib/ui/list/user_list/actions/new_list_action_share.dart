import 'package:async_redux/async_redux.dart';
import 'package:shopping_list/data/entities/user_list.dart';
import 'package:shopping_list/deeplinks/deeplink.dart';
import 'package:shopping_list/state/app_state.dart';
import 'package:share_plus/share_plus.dart';

class UserListActionShare extends ReduxAction<AppState> {
  final UserList item;

  UserListActionShare(this.item);

  @override
  Future<AppState?> reduce() async {
    final link = await Deeplink.createLink(item.id, item.name);
    await Share.share(link.toString());
    return null;
  }
}
