import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shared_shopping_list/data/data_source/prefs_data_source.dart';
import 'package:shared_shopping_list/data/repos/invites_repo.dart';
import 'package:shared_shopping_list/models/user_list.dart';

main() {
  InviteRepos repo;
  setUp(() {
    WidgetsFlutterBinding.ensureInitialized();
    SharedPreferences.setMockInitialValues({});
    final getIt = GetIt.I;

    getIt.registerSingleton<PrefsDataSource>(PrefsDataSource());
    getIt.registerSingleton<InviteRepos>(InviteRepos());

    repo = GetIt.I.get<InviteRepos>();
  });
  group("repo", () {
    test("save", () async {
      await repo.saveInvite("1", "name1");
      await repo.saveInvite("2", "name2");

      UserList result = await repo.first();
      expect(result.id, "1");
      expect(result.name, "name1");
      await repo.remove(result.id);

      result = await repo.first();
      expect(result.id, "2");
      expect(result.name, "name2");
      await repo.remove(result.id);

      result = await repo.first();
      expect(result, isNull);
    });
  });
}
