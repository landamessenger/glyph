import 'dart:io';

import 'src/tasks/main_task.dart';

main() async {
  await MainTask().run();
  exit(0);
}
