
import 'package:flutter/material.dart';

void main() {
  runApp(const ShamsApp());
}

const Color navy = Color(0xFF07346F);
const Color blue = Color(0xFF1261B5);
const Color background = Color(0xFFF5F7FB);

class ShamsApp extends StatelessWidget {
  const ShamsApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'شمس لتجارة الكارتون',
      theme: ThemeData(
        useMaterial3: true,
        scaffoldBackgroundColor: background,
        colorScheme: ColorScheme.fromSeed(seedColor: navy),
        fontFamily: 'Roboto',
      ),
      locale: const Locale('ar'),
      builder: (context, child) {
        return Directionality(
          textDirection: TextDirection.rtl,
          child: child!,
        );
      },
      home: const HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedIndex = 0;

  final List<Map<String, dynamic>> sections = [
    {'title': 'الكارتات', 'icon': Icons.inventory_2_outlined},
    {'title': 'المشتريات', 'icon': Icons.shopping_cart_outlined},
    {'title': 'المبيعات', 'icon': Icons.trending_up},
    {'title': 'العملاء', 'icon': Icons.people_outline},
    {'title': 'الموردون', 'icon': Icons.local_shipping_outlined},
    {'title': 'الخزائن', 'icon': Icons.account_balance_wallet_outlined},
    {'title': 'التقارير', 'icon': Icons.analytics_outlined},
    {'title': 'الإعدادات', 'icon': Icons.settings_outlined},
    {'title': 'حول البرنامج', 'icon': Icons.info_outline},
  ];

  void openSection(String title) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('قسم $title - سيتم تجهيزه في المرحلة القادمة'),
        behavior: SnackBarBehavior.floating,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        bottom: false,
        child: Column(
          children: [
            _header(),
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(14),
                child: Column(
                  children: [
                    _warehouseBanner(),
                    const SizedBox(height: 18),
                    _sectionGrid(),
                    const SizedBox(height: 18),
                    _statistics(),
                    const SizedBox(height: 18),
                    _recentActivity(),
                    const SizedBox(height: 20),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: _bottomBar(),
    );
  }

  Widget _header() {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 18,
        vertical: 15,
      ),
      decoration: const BoxDecoration(
        color: navy,
        borderRadius: BorderRadius.vertical(
          bottom: Radius.circular(18),
        ),
      ),
      child: Row(
        children: [
          IconButton(
            onPressed: () => openSection('الإعدادات'),
            icon: const Icon(Icons.settings, color: Colors.white),
          ),
          const Expanded(
            child: Text(
              'شمس لتجارة الكارتون',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          IconButton(
            onPressed: () => openSection('الإشعارات'),
            icon: const Icon(
              Icons.notifications_none,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }

  Widget _warehouseBanner() {
    return Container(
      height: 185,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        gradient: const LinearGradient(
          colors: [
            Color(0xFF06336C),
            Color(0xFF1766AE),
          ],
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
        ),
        boxShadow: [
          BoxShadow(
            color: navy.withOpacity(0.15),
            blurRadius: 12,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      clipBehavior: Clip.antiAlias,
      child: Stack(
        children: [
          Positioned(
            left: -25,
            bottom: -35,
            child: Icon(
              Icons.warehouse_outlined,
              size: 190,
              color: Colors.white.withOpacity(0.12),
            ),
          ),
          Positioned(
            right: 18,
            top: 25,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text(
                  'شمس',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 34,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  'لتجارة الكارتون',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 23,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 8),
                Text(
                  'شريكك في النجاح',
                  style: TextStyle(
                    color: Color(0xFFFFD47A),
                    fontSize: 15,
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            left: 20,
            bottom: 12,
            child: Icon(
              Icons.inventory_2,
              color: Colors.white.withOpacity(0.85),
              size: 65,
            ),
          ),
        ],
      ),
    );
  }

  Widget _sectionGrid() {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: sections.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        mainAxisSpacing: 10,
        crossAxisSpacing: 10,
        childAspectRatio: 1.05,
      ),
      itemBuilder: (context, index) {
        final section = sections[index];

        return InkWell(
          borderRadius: BorderRadius.circular(16),
          onTap: () => openSection(section['title']),
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16),
              border: Border.all(color: const Color(0xFFDCE8F8)),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.035),
                  blurRadius: 5,
                  offset: const Offset(0, 3),
                ),
              ],
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  section['icon'],
                  color: blue,
                  size: 34,
                ),
                const SizedBox(height: 9),
                Text(
                  section['title'],
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 13,
                    color: navy,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _statistics() {
    return Row(
      children: [
        Expanded(
          child: _statCard(
            'المبيعات',
            '0.00',
            Icons.trending_up,
            const Color(0xFFE3F5E9),
            Colors.green,
          ),
        ),
        const SizedBox(width: 8),
        Expanded(
          child: _statCard(
            'المشتريات',
            '0.00',
            Icons.shopping_bag_outlined,
            const Color(0xFFE5EEFF),
            blue,
          ),
        ),
        const SizedBox(width: 8),
        Expanded(
          child: _statCard(
            'الخزائن',
            '0.00',
            Icons.account_balance,
            const Color(0xFFFFF0DC),
            const Color(0xFFAD7133),
          ),
        ),
      ],
    );
  }

  Widget _statCard(
    String title,
    String value,
    IconData icon,
    Color color,
    Color iconColor,
  ) {
    return Container(
      padding: const EdgeInsets.symmetric(
        vertical: 14,
        horizontal: 5,
      ),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        children: [
          Icon(icon, color: iconColor, size: 26),
          const SizedBox(height: 8),
          Text(
            value,
            style: TextStyle(
              color: iconColor,
              fontWeight: FontWeight.bold,
              fontSize: 15,
            ),
          ),
          const SizedBox(height: 5),
          Text(
            title,
            style: const TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }

  Widget _recentActivity() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: const Color(0xFFE6EAF1)),
      ),
      child: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(Icons.history, color: blue),
              SizedBox(width: 8),
              Text(
                'أحدث الأنشطة',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                  color: navy,
                ),
              ),
            ],
          ),
          SizedBox(height: 14),
          Text(
            'لا توجد عمليات مسجلة حتى الآن',
            style: TextStyle(
              color: Colors.grey,
              fontSize: 13,
            ),
          ),
        ],
      ),
    );
  }

  Widget _bottomBar() {
    const items = [
      {'label': 'الرئيسية', 'icon': Icons.home_outlined},
      {'label': 'المبيعات', 'icon': Icons.shopping_cart_outlined},
      {'label': 'العملاء', 'icon': Icons.people_outline},
      {'label': 'الخزائن', 'icon': Icons.account_balance_wallet_outlined},
      {'label': 'التقارير', 'icon': Icons.bar_chart},
    ];

    return NavigationBar(
      backgroundColor: navy,
      indicatorColor: const Color(0xFF1766B9),
      selectedIndex: selectedIndex,
      onDestinationSelected: (index) {
        setState(() {
          selectedIndex = index;
        });

        if (index != 0) {
          openSection(items[index]['label'] as String);
        }
      },
      destinations: items.map((item) {
        return NavigationDestination(
          icon: Icon(
            item['icon'] as IconData,
            color: Colors.white70,
          ),
          selectedIcon: Icon(
            item['icon'] as IconData,
            color: Colors.white,
          ),
          label: item['label'] as String,
        );
      }).toList(),
    );
  }
}
