import 'package:flutter/material.dart';
import 'package:sportbudies/export.dart';

class BottomNav extends StatelessWidget {
  const BottomNav({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AppTheme theme = context.watch();
    List<Map<String, dynamic>> items = Mock.navItems;
    return Consumer<MainProvider>(
      builder: (context, store, child) {
        return Container(
          height: 65,
          width: double.infinity,
          padding: const EdgeInsets.only(bottom: 3),
          margin: const EdgeInsets.only(bottom: 0.5),
          decoration: BoxDecoration(
              color: theme.background,
              boxShadow: Shadows.universal,
              borderRadius: const BorderRadius.only(
                  topRight: Radius.circular(12), topLeft: Radius.circular(12))),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              ...List.generate(
                items.length,
                (index) => _NavItem(
                  icon: items[index]['icon'],
                  title: items[index]['label'],
                  isSelected: store.navIndex == index,
                  onPressed: () => store.navIndex = index,
                ),
              )
            ],
          ),
        );
      },
    );
  }
}

class _NavItem extends StatelessWidget {
  const _NavItem(
      {Key? key,
      required this.icon,
      required this.title,
      required this.isSelected,
      this.onPressed})
      : super(key: key);
  final String icon;
  final String title;
  final bool isSelected;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    AppTheme theme = context.watch();
    return GestureDetector(
      onTap: onPressed,
      child: Material(
        // color: Colors.red,
        child: Padding(
          padding: const EdgeInsets.all(5.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(
                  height: 24,
                  width: 24,
                  child: SvgPicture.asset(
                    icon,
                    color:
                        isSelected ? theme.primary : theme.grey.withOpacity(.4),
                  )),
              const VSpace(5),
              Text(
                title,
                style: TextStyles.body3
                    .txtColor(
                        isSelected ? theme.primary : theme.grey.withOpacity(.4))
                    .semiBold,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
