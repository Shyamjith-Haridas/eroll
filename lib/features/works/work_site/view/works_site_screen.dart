import 'package:eroll/core/constants/app_colors.dart';
import 'package:eroll/core/constants/app_texts.dart';
import 'package:eroll/core/constants/data_constants.dart';
import 'package:eroll/core/routes/app_route_names.dart';
import 'package:eroll/features/works/work_site/view/components/works_list_tile_widget.dart';
import 'package:flutter/material.dart';

class WorksSiteScreen extends StatefulWidget {
  const WorksSiteScreen({super.key, this.activeIndex = 0});

  final int activeIndex;

  @override
  State<WorksSiteScreen> createState() => _WorksSiteScreenState();
}

class _WorksSiteScreenState extends State<WorksSiteScreen>
    with SingleTickerProviderStateMixin {
  late TabController tabController;

  @override
  void initState() {
    super.initState();
    tabController = TabController(
      initialIndex: widget.activeIndex,
      length: DataConstants.workSiteTabNameList.length,
      vsync: this,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          AppTexts.workSiteText,
          style: TextStyle(fontFamily: 'cabinBold'),
        ),
        actionsPadding: EdgeInsets.only(right: 10),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pushNamed(context, AppRouteNames.createWorkScreen);
            },
            icon: Icon(Icons.add),
          ),
        ],
      ),
      body: SafeArea(
        child: Column(
          children: [
            Container(
              color: AppColors.white,
              child: TabBar(
                controller: tabController,
                indicatorColor: AppColors.primaryColor,
                labelColor: AppColors.primaryColor,
                unselectedLabelColor: AppColors.grey,
                indicatorSize: TabBarIndicatorSize.tab,
                tabs: [
                  Tab(
                    child: Text(
                      DataConstants.workSiteTabNameList[0],
                      style: TextStyle(fontFamily: 'cabinBold', fontSize: 16),
                    ),
                  ),
                  Tab(
                    child: Text(
                      DataConstants.workSiteTabNameList[1],
                      style: TextStyle(fontFamily: 'cabinBold', fontSize: 16),
                    ),
                  ),
                  Tab(
                    child: Text(
                      DataConstants.workSiteTabNameList[2],
                      style: TextStyle(fontFamily: 'cabinBold', fontSize: 16),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: TabBarView(
                controller: tabController,
                children: [
                  WorksListTileWidget(tabIndex: 0),
                  WorksListTileWidget(tabIndex: 1),
                  WorksListTileWidget(tabIndex: 2),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
