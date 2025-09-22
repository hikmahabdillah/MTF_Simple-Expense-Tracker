import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(const MyApp());
}

// --- BARU: Model untuk data transaksi agar lebih rapi ---
class Transaction {
  final IconData icon;
  final String title;
  final String subtitle;
  final String amount;
  final Color backgroundColor;
  final Color iconColor;

  Transaction({
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.amount,
    required this.backgroundColor,
    required this.iconColor,
  });
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Finance App UI',
      theme: ThemeData(
        primarySwatch: Colors.teal,
      ),
      // --- DIUBAH: Menjadi StatefulWidget ---
      home: const FinanceHomePage(),
    );
  }
}

// --- DIUBAH: Dari StatelessWidget menjadi StatefulWidget ---
class FinanceHomePage extends StatefulWidget {
  const FinanceHomePage({super.key});

  @override
  State<FinanceHomePage> createState() => _FinanceHomePageState();
}

class _FinanceHomePageState extends State<FinanceHomePage> {
  // --- BARU: Variabel state untuk mengontrol tampilan transaksi ---
  bool _showAll = false;

  // --- BARU: Daftar data transaksi ---
  final List<Transaction> _transactions = [
    Transaction(
      icon: Icons.shopping_cart,
      title: 'Groceries',
      subtitle: 'Today 10:00 AM',
      amount: '- \$100',
      backgroundColor: const Color(0xFFE3F2FD),
      iconColor: const Color(0xFF2196F3),
    ),
    Transaction(
      icon: Icons.movie,
      title: 'Entertainment',
      subtitle: 'Today 10:00 AM',
      amount: '- \$100',
      backgroundColor: const Color(0xFFFFF3E0),
      iconColor: const Color(0xFFFF9800),
    ),
    Transaction(
      icon: Icons.directions_car,
      title: 'Transportation',
      subtitle: 'Today 10:00 AM',
      amount: '- \$100',
      backgroundColor: const Color(0xFFE8EAF6),
      iconColor: const Color(0xFF3F51B5),
    ),
    Transaction(
      icon: Icons.shopping_bag,
      title: 'Shopping',
      subtitle: 'Today 10:00 AM',
      amount: '- \$100',
      backgroundColor: const Color(0xFFFCE4EC),
      iconColor: const Color(0xFFE91E63),
    ),
    Transaction(
      icon: Icons.restaurant,
      title: 'Restaurant',
      subtitle: 'Yesterday 07:30 PM',
      amount: '- \$55',
      backgroundColor: const Color(0xFFE0F2F1),
      iconColor: const Color(0xFF009688),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF9F9F9),
      body: SingleChildScrollView(
        child: Column(
          children: [
            _buildHeader(context),
            const SizedBox(height: 30),
            _buildRecentTransactions(),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: const Color(0xFF2C7873),
        child: const Icon(Icons.add_circle, color: Colors.white),
        elevation: 2.0,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        shape: const CircularNotchedRectangle(),
        notchMargin: 8.0,
        child: SizedBox(
          height: 60,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              IconButton(
                icon: const Icon(Icons.home, color: Color(0xFF2C7873)),
                onPressed: () {},
              ),
              const SizedBox(width: 40), // Ruang untuk FAB
              IconButton(
                icon: const Icon(Icons.bar_chart, color: Colors.grey),
                onPressed: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Header saldo (tidak ada perubahan di sini)
  Widget _buildHeader(BuildContext context) {
    // ... (kode header Anda tetap sama)
    return SizedBox(
      height: 280,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Container(
            height: 220,
            width: double.infinity,
            decoration: const BoxDecoration(
              color: Color(0xFF2C7873),
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(15),
                bottomRight: Radius.circular(15),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.only(top: 50.0, left: 20, right: 20),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const CircleAvatar(
                    radius: 25,
                    backgroundImage: NetworkImage(
                        'https://i.pravatar.cc/150?img=32'),
                  ),
                  const SizedBox(width: 15),
                  const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Welcome!',
                          style:
                          TextStyle(color: Colors.white70, fontSize: 14)),
                      Text('Shibab Rahman',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.bold)),
                    ],
                  ),
                  const Spacer(),
                  Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.1),
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(Icons.notifications, color: Colors.white),
                  )
                ],
              ),
            ),
          ),
          Positioned(
            top: 120,
            left: 20,
            right: 20,
            child: Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: const Color(0xFF348D87),
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    blurRadius: 10,
                    offset: const Offset(0, 5),
                  )
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Balance',
                      style: TextStyle(
                          color: Colors.white.withOpacity(0.8), fontSize: 16)),
                  const SizedBox(height: 5),
                  const Text('\$ 2,548.00',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 32,
                          fontWeight: FontWeight.bold)),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      _buildIncomeExpense(
                          'Income', '\$ 15,274.00', Icons.arrow_downward),
                      _buildIncomeExpense(
                          'Expenses', '\$ 2,436.00', Icons.arrow_upward),
                    ],
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildIncomeExpense(String title, String amount, IconData icon) {
    // ... (kode ini tetap sama)
    return Row(
      children: [
        Icon(icon, color: Colors.white, size: 20),
        const SizedBox(width: 8),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title,
                style: TextStyle(
                    color: Colors.white.withOpacity(0.8), fontSize: 14)),
            Text(amount,
                style: const TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w600)),
          ],
        )
      ],
    );
  }

  // --- DIUBAH: Widget ini sekarang membangun list secara dinamis ---
  Widget _buildRecentTransactions() {
    // Menentukan list mana yang akan ditampilkan berdasarkan state _showAll
    final transactionsToShow =
    _showAll ? _transactions : _transactions.sublist(0, 1);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text('Recent Transactions',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
              // --- DIUBAH: Menjadi TextButton ---
              TextButton(
                onPressed: () {
                  // Memanggil setState untuk memberitahu Flutter agar membangun ulang UI
                  setState(() {
                    _showAll = !_showAll; // Toggle nilainya (true -> false, false -> true)
                  });
                },
                child: Text(
                  _showAll ? 'See Less' : 'See All', // Teks berubah sesuai state
                  style: TextStyle(color: Colors.grey[600]),
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          // --- DIUBAH: Membangun item dari list data, bukan hardcode ---
          ...transactionsToShow.map((transaction) {
            return _buildTransactionItem(
              transaction.icon,
              transaction.title,
              transaction.subtitle,
              transaction.amount,
              transaction.backgroundColor,
              transaction.iconColor,
            );
          }).toList(),
        ],
      ),
    );
  }

  // Widget untuk setiap item transaksi (tidak ada perubahan di sini)
  Widget _buildTransactionItem(IconData icon, String title, String subtitle,
      String amount, Color backgroundColor, Color iconColor) {
    // ... (kode ini tetap sama)
    return Container(
      margin: const EdgeInsets.only(bottom: 15),
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.08),
            blurRadius: 10,
            offset: const Offset(0, 4),
          )
        ],
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: backgroundColor,
              shape: BoxShape.circle,
            ),
            child: Icon(icon, color: iconColor),
          ),
          const SizedBox(width: 15),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title,
                    style: const TextStyle(
                        fontSize: 16, fontWeight: FontWeight.bold)),
                Text(subtitle,
                    style: TextStyle(fontSize: 12, color: Colors.grey[600])),
              ],
            ),
          ),
          Text(amount,
              style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.red)),
        ],
      ),
    );
  }
}