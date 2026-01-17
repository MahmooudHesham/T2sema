import 'package:get_it/get_it.dart';
import 'package:t2sema/features/players/data/repos/players_repo.dart';
import 'package:t2sema/features/players/data/repos/players_repo_impl.dart';

final getIt = GetIt.instance;
void setupServiceLocator() {
  getIt.registerSingleton<PlayersRepo>(PlayersRepoImpl());
}
