import 'package:get_it/get_it.dart';
import 'package:shared_shopping_list/data/db_items_store.dart';
import 'package:shared_shopping_list/data/repos/user_lists_repo.dart';

import 'data/data_source/prefs_data_source.dart';
import 'data/data_source/user_prefs_data_source.dart';
import 'data/db_list_store.dart';
import 'data/repos/auth_repo.dart';
import 'data/repos/invites_repo.dart';
import 'data/repos/lists_repo.dart';

Future setUpDependencies() async {
  final getIt = GetIt.I;

  getIt.registerSingleton<PrefsDataSource>(PrefsDataSource());
  getIt.registerSingleton<UserPrefsDataSource>(UserPrefsDataSource());

  //getIt.registerSingleton<Db>(await Db.create());
  getIt.registerSingleton<DbListStore>(DbListStore());
  getIt.registerSingleton<DbItemsStore>(DbItemsStore());

  getIt.registerSingleton<AuthRepo>(AuthRepo());
  getIt.registerSingleton<ListsRepo>(ListsRepo());
  getIt.registerSingleton<ItemsListRepo>(ItemsListRepo());
  getIt.registerSingleton<InviteRepos>(InviteRepos());
}
