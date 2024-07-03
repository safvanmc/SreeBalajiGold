import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:sree_balagi_gold/general/core/di/injection.config.dart';

final sl = GetIt.instance;

@InjectableInit(
  initializerName: 'init',
  asExtension: false,
)
Future<void> configureDependancy() async {
  await init(
    sl,
    environment: Environment.prod,
  );
}
