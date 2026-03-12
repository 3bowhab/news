import 'package:flutter/material.dart';
import 'package:news/core/constants/app_routes.dart';
import 'package:news/core/extensions/responsive_sized_box_extension.dart';
import 'package:news/ui/app_bar/custom_drop_down_button.dart';
import 'package:news/ui/home/widgets/list_tile_row.dart';

class CustomListTile extends StatefulWidget {
  final List<String> list;
  final String title;
  final IconData icon;
  final String initialValue;
  final Function(String) onChanged;

  const CustomListTile({
    super.key,
    required this.list,
    required this.title,
    required this.icon,
    required this.initialValue,
    required this.onChanged,
  });

  @override
  State<CustomListTile> createState() => _CustomListTileState();
}

class _CustomListTileState extends State<CustomListTile> {
  late String dropdownValue;

  @override
  void initState() {
    super.initState();
    dropdownValue = widget.initialValue;
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Column(
        children: [
          ListTileRow(
            icon: widget.icon,
            title: widget.title,
          ),
          8.verticalSizedBox,
          CustomDropDownButton(
            value: dropdownValue,
            list: widget.list,
            onChanged: (value) {
              setState(() {
                dropdownValue = value;
              });
              widget.onChanged(value);
            },
          ),
        ],
      ),
      onTap: () {
        Navigator.pushReplacementNamed(context, AppRoutes.homeView);
      },
    );
  }
}


