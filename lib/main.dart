import 'package:movie_app/src/core/infrastructure/common_import.dart';
import 'package:movie_app/src/core/presentation/app_widget.dart';

void main() {
  runApp(
    const ProviderScope(
      child: AppWidget(),
    ),
  );
}
