import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

import 'features/create_staff/provider/create_staff_provider.dart';
import 'features/staffs/provider/view_staff_provider.dart';

class AppProviders {
  static List<SingleChildWidget> buildProviders() {
    return [
      ChangeNotifierProvider(create: (_) => CreateStaffProvider()),
      ChangeNotifierProvider(create: (_) => ViewStaffProvider()),
    ];
  }
}
