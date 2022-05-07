import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:working_on_technics/modules/module5/assets_ref.dart';

class Module6Screen extends StatelessWidget {
  const Module6Screen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          buildSliverAppBar(context),
          SliverFillRemaining(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                buildLeftPanel(context),
                Expanded(
                  child: buildCenterPanel(),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  Container buildCenterPanel() {
    return Container(
      child: Column(
        children: [
          Stack(
            children: [
              Image.asset(
                brick_image,
                fit: BoxFit.cover,
                width: double.infinity,
                height: 150,
              ),
              Positioned(
                left: 20,
                bottom: 0,
                top: 0,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Text(
                      "Dashboard",
                      style: TextStyle(
                          fontSize: 22,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      "Welcome to Smirltech Dashboard",
                      style: TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
              Positioned(
                top: 0,
                right: 20,
                bottom: 0,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: const [
                    Icon(Icons.home, color: Colors.white),
                    Icon(Icons.chevron_right, color: Colors.white),
                    Text(
                      'Dashboard',
                      style: TextStyle(color: Colors.white, fontSize: 16),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Row(
                  children: [
                    Expanded(
                      child: buildDashboardBlock1(children: [
                        buildDashboardElementCategory1(
                            icon: Icons.person_outline,
                            title: '10K',
                            subtitle: 'Visitors'),
                        buildDashboardElementCategory1(
                            icon: Icons.volume_down,
                            iconColor: Colors.green,
                            title: '100%',
                            subtitle: 'Volume'),
                        buildDashboardElementCategory1(
                            icon: Icons.file_present,
                            iconColor: Colors.red,
                            title: '2000+',
                            subtitle: 'Files'),
                        buildDashboardElementCategory1(
                            icon: Icons.mail_outline,
                            title: '120',
                            subtitle: 'Mails'),
                      ]),
                    ),
                    const SizedBox(width: 20),
                    Expanded(
                      child: buildDashboardBlock1(children: [
                        buildDashboardElementCategory1(
                            icon: Icons.share,
                            title: '1000',
                            subtitle: 'Shares'),
                        buildDashboardElementCategory1(
                            icon: Icons.alt_route,
                            iconColor: Colors.green,
                            title: '600',
                            subtitle: 'Network'),
                        buildDashboardElementCategory1(
                            icon: Icons.signal_cellular_alt,
                            iconColor: Colors.red,
                            title: '350',
                            subtitle: 'Returns'),
                        buildDashboardElementCategory1(
                            icon: Icons.wifi,
                            title: '100%',
                            subtitle: 'Connections'),
                      ]),
                    ),
                    const SizedBox(width: 20),
                    Expanded(
                        child: Column(
                      children: [
                        Card(
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Center(
                                child: Container(
                                    color: Colors.green,
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 20, vertical: 10),
                                    child: const Center(
                                      child:
                                          Icon(Icons.star, color: Colors.white),
                                    )),
                              ),
                              Expanded(
                                child: FittedBox(
                                  child: Container(
                                      color: Colors.green[200],
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 20, vertical: 10),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: const [
                                          Text('4000+',
                                              style: TextStyle(
                                                  color: Colors.white)),
                                          Text('Ratings Received',
                                              style: TextStyle(
                                                  color: Colors.white)),
                                        ],
                                      )),
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 20),
                        Card(
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                  color: Colors.blue,
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 20, vertical: 10),
                                  child: const Icon(Icons.wine_bar_outlined,
                                      color: Colors.white)),
                              Expanded(
                                child: Container(
                                    color: Colors.blue[200],
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 20, vertical: 10),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: const [
                                        Text('17',
                                            style:
                                                TextStyle(color: Colors.white)),
                                        Text('Achievements',
                                            style:
                                                TextStyle(color: Colors.white)),
                                      ],
                                    )),
                              ),
                            ],
                          ),
                        ),
                      ],
                    )),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget buildDashboardBlock1({List<Widget> children = const []}) {
    return GridView.count(
      shrinkWrap: true,
      crossAxisCount: 2,
      crossAxisSpacing: 2,
      mainAxisSpacing: 2,
      childAspectRatio: 2,
      children: children,
    );
  }

  Widget buildDashboardElementCategory1(
      {required IconData icon,
      Color? iconColor = Colors.blue,
      required String title,
      required String subtitle}) {
    return Card(
      color: Colors.white,
      margin: EdgeInsets.zero,
      elevation: 1,
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            FittedBox(
              child: Icon(
                icon,
                color: iconColor,
                size: 50,
              ),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: FittedBox(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(title,
                        style: const TextStyle(
                            fontSize: 24,
                            color: Colors.black,
                            fontWeight: FontWeight.bold)),
                    Text(subtitle,
                        style:
                            const TextStyle(fontSize: 16, color: Colors.grey)),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  SizedBox buildLeftPanel(BuildContext context) {
    return SizedBox(
      width: 250,
      child: Card(
        margin: EdgeInsets.zero,
        elevation: 10,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              // color: Colors.green,
              width: double.infinity,
              height: 150,
              child: Stack(
                children: [
                  ColorFiltered(
                    colorFilter:
                        const ColorFilter.mode(Colors.blue, BlendMode.color),
                    child: Image.asset(
                      ocean_image,
                      fit: BoxFit.cover,
                      width: double.infinity,
                      height: 150,
                    ),
                  ),
                  const Positioned(
                    left: 0,
                    right: 0,
                    bottom: 0,
                    top: 0,
                    child: Center(
                      child: CircleAvatar(
                        backgroundImage: AssetImage(johndoe_profile_image),
                        radius: 50,
                      ),
                    ),
                  ),
                  const Positioned(
                    left: 0,
                    right: 0,
                    bottom: 0,
                    child: Center(
                      child: Text(
                        'John Doe',
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 20),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: ListView(
                children: [
                  const Padding(
                    padding: EdgeInsets.all(4.0),
                    child: CupertinoSearchTextField(
                      placeholder: 'Search Friend',
                    ),
                  ),
                  buildItemBlock(
                      context: context,
                      title: "Navigation",
                      subtitle: "Home",
                      icon: Icons.home,
                      color: Colors.white,
                      background: Colors.blue),
                  buildItemBlock(
                    context: context,
                    title: "UI Element",
                    subtitle: "Basic",
                    icon: Icons.grid_view_sharp,
                    icon2: Icons.chevron_right,
                    color: Colors.black,
                  ),
                  buildItemBlock(
                    context: context,
                    title: "Tables",
                    subtitle: "Table",
                    icon: Icons.table_rows_outlined,
                    color: Colors.black,
                  ),
                  buildItemBlock(
                    context: context,
                    title: "Charts And Maps",
                    subtitle: "Charts",
                    icon: Icons.stacked_bar_chart,
                    color: Colors.black,
                  ),
                  buildItemBlock(
                    context: context,
                    subtitle: "Maps",
                    icon: Icons.map_sharp,
                    color: Colors.black,
                  ),
                  buildItemBlock(
                    context: context,
                    title: "Pages",
                    subtitle: "Pages",
                    icon: Icons.contact_phone_outlined,
                    icon2: Icons.add,
                    color: Colors.black,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildItemBlock({
    required BuildContext context,
    String? title,
    required String subtitle,
    required IconData icon,
    IconData? icon2,
    Color? color,
    Color? background,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (title != null)
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 4.0),
            child: Divider(),
          ),
        if (title != null)
          Padding(
            padding: const EdgeInsets.all(4.0),
            child: Text(
              title,
              style: const TextStyle(color: Colors.blue, fontSize: 16),
            ),
          ),
        Padding(
          padding: const EdgeInsets.all(4.0),
          child: ListTile(
            onTap: () {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text("$title $subtitle"),
                ),
              );
            },
            tileColor: background,
            leading: Icon(icon, color: color),
            trailing: (icon2 != null) ? Icon(icon2, color: color) : null,
            title: Text(subtitle, style: TextStyle(color: color, fontSize: 16)),
          ),
        ),
      ],
    );
  }

  SliverAppBar buildSliverAppBar(BuildContext context) {
    return SliverAppBar(
      leading: IconButton(
          icon: Icon(Icons.downhill_skiing),
          onPressed: () {
            Navigator.pop(context);
          }),
      title: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Expanded(child: Text('Smirltech Dashboard')),
          SizedBox(width: 5),
          IconButton(icon: Icon(Icons.menu), onPressed: () {}),
          IconButton(icon: Icon(Icons.cancel_presentation), onPressed: () {}),
          Spacer(),
        ],
      ),
      actions: [
        IconButton(icon: Icon(Icons.alarm), onPressed: () {}),
        SizedBox(width: 5),
        CircleAvatar(
          backgroundImage: AssetImage(johndoe_profile_image),
        ),
        SizedBox(width: 5),
        TextButton(
          onPressed: () {},
          child: Row(
            children: const [
              Text(
                'John Doe',
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
              SizedBox(width: 5),
              Icon(Icons.keyboard_arrow_down, color: Colors.white),
            ],
          ),
        )
      ],
    );
  }
}
