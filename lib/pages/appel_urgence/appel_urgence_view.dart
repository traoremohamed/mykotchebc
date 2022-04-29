import 'package:mykotche/services/services_service.dart';
import 'package:mykotche/shared/widgets/service_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:line_icons/line_icons.dart';
import '../../core.dart';
import 'appel_urgence_controller.dart';

class AppelUregnceView extends GetView<AppelUregnceController> {
  final filters = FilterService().getFilterList();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: SafeArea(
        child: Container(
          width: double.infinity,
          padding: EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AppBarWidget(

                title: "Numéro d'urgence",
              ),
              SizedBox(height: 18),
              Expanded(
                child: Obx(()=>GridView.count(
                  physics: BouncingScrollPhysics(),
                  childAspectRatio: 1 / 1.6,
                  crossAxisCount: 2,
                  crossAxisSpacing: 14,
                  mainAxisSpacing: 14,

                  children: controller.myContacts.map((item) {
                    return buildUrgencyContact(item);
                  }).toList(),
                )),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Container(
        height: 70,
        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 0),
        decoration: BoxDecoration(color: Colors.white),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            //buildFilterIcon(),
            //buildFilters(),
          ],
        ),
      ),
    );

  }

  Widget buildFilterIcon() {
    return Container(
      width: 50,
      height: 50,
      margin: EdgeInsets.only(left: 14),
      decoration: BoxDecoration(
        color: kPrimaryColor,
        borderRadius: BorderRadius.all(
          Radius.circular(15),
        ),
      ),
      child: Center(
        child: Icon(
          LineIcons.filter,
          color: Colors.white,
          size: 24,
        ),
      ),
    );
  }

  Widget buildFilters() {
    return ValueBuilder<Filter>(
      initialValue: filters[0],
      builder: (value, updateFn) => Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: filters
            .map((filter) => buildFilter(value, filter, updateFn))
            .toList(),
      ),
    );
  }

  Widget buildFilter(Filter value, Filter filter, Function(Filter) updateFn) {
    return GestureDetector(
      onTap: () => updateFn(filter),
      child: Padding(
        padding: EdgeInsets.only(right: 17),
        child: Text(
          filter.name,
          style: TextStyle(
            color: value.name == filter.name ? kPrimaryColor : Colors.grey[500],
            fontSize: 16,
            fontWeight:
                value.name == filter.name ? FontWeight.bold : FontWeight.normal,
          ),
        ),
      ),
    );
  }
}
