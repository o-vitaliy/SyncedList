import 'package:async_redux/async_redux.dart';
import 'package:give_a_ride/data/entities/user_list.dart';
import 'package:give_a_ride/deeplinks/deeplink.dart';
import 'package:give_a_ride/state/app_state.dart';
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
