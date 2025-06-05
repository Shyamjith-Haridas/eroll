import 'package:eroll/features/home/view/components/shortcut_menu_widget.dart';
import 'package:flutter/cupertino.dart';

class ShortcutMenu extends StatelessWidget {
  const ShortcutMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        ShortcutMenuWidget(
          icon: CupertinoIcons.person_crop_circle_fill_badge_minus,
          text: 'Leaves',
          onTap: () {
            //todo: Navigate to leaves screen
          },
        ),
        ShortcutMenuWidget(
          icon: CupertinoIcons.money_dollar_circle,
          text: 'Payroll',
          onTap: () {
            //todo: Navigate to payroll screen
          },
        ),
        ShortcutMenuWidget(
          icon: CupertinoIcons.person_crop_circle_badge_plus,
          text: 'Add Staff',
          onTap: () {
            //todo: Navigate to add staff screen
          },
        ),
        ShortcutMenuWidget(
          icon: CupertinoIcons.hammer_fill,
          text: 'Create Work',
          onTap: () {
            //todo: Navigate to create work screen
          },
        ),
      ],
    );
  }
}
