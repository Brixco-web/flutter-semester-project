import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:expense_tracker_week4/models/category.dart';
import '../models/expense.dart';
import '../detabase/expense_database.dart';
import 'add_expense_screen.dart';
import 'expense_detail_screen.dart';
import '../utils/category_utils.dart';
import '../widgets/expense_card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Expense> _expenses = [];
  String _selectedCategoryFilter = 'All';
  bool _isLoading = true;
  double _totalAmount = 0;

  @override
  void initState() {
    super.initState();
    _refreshExpenses();
  }

  Future<void> _refreshExpenses() async {
    setState(() => _isLoading = true);
    
    // Get all expenses from database
    final expenses = await ExpenseDatabase.instance.getAllExpenses();
    
    // Calculate total
    double total = 0;
    for (var expense in expenses) {
      total += expense.amount;
    }
    
    setState(() {
      _expenses = expenses;
      _totalAmount = total;
      _isLoading = false;
    });
  }

  Future<void> _deleteExpense(int id) async {
    await ExpenseDatabase.instance.deleteExpense(id);
    _refreshExpenses();
  }

  List<PieChartSectionData> _getChartSections() {
    final Map<String, double> categoryTotals = {};
    for (var expense in _expenses) {
      categoryTotals[expense.category] =
          (categoryTotals[expense.category] ?? 0) + expense.amount;
    }

    return categoryTotals.entries.map((entry) {
      final color = CategoryUtils.getColor(entry.key);
      return PieChartSectionData(
        color: color,
        value: entry.key == 'Income' ? 0 : entry.value, // Usually exclude income from expense chart if exists
        title: '',
        radius: 12,
        showTitle: false,
      );
    }).toList();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Expense Tracker'),
      ),
      body: _isLoading
          ? const Center(child: CircularProgressIndicator())
          : Column(
              children: [
                // Greeting Header
                Padding(
                  padding: const EdgeInsets.fromLTRB(24, 8, 24, 0),
                  child: Row(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Hello,',
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.grey[600],
                            ),
                          ),
                          const Text(
                            'Welcome back!',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      const Spacer(),
                      CircleAvatar(
                        backgroundColor: Theme.of(context).colorScheme.primary.withOpacity(0.1),
                        child: Icon(
                          Icons.person_outline,
                          color: Theme.of(context).colorScheme.primary,
                        ),
                      ),
                    ],
                  ),
                ),

                // Total Amount Card
                Container(
                  margin: const EdgeInsets.all(16),
                  padding: const EdgeInsets.all(24),
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        Theme.of(context).colorScheme.primary,
                        Theme.of(context).colorScheme.primary.withOpacity(0.8),
                      ],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                    borderRadius: BorderRadius.circular(24),
                    boxShadow: [
                      BoxShadow(
                        color: Theme.of(context).colorScheme.primary.withOpacity(0.3),
                        blurRadius: 20,
                        offset: const Offset(0, 10),
                      ),
                    ],
                  ),
                  child: Column(
                    children: [
                      const Text(
                        'Total Balance',
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.white70,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        'GHS ${_totalAmount.toStringAsFixed(2)}',
                        style: const TextStyle(
                          fontSize: 32,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          letterSpacing: 1,
                        ),
                      ),
                    ],
                  ),
                ),
                
                // Charts Section
                if (_expenses.isNotEmpty)
                  Container(
                    height: 180,
                    margin: const EdgeInsets.symmetric(horizontal: 16),
                    child: Row(
                      children: [
                        Expanded(
                          flex: 2,
                          child: Stack(
                            alignment: Alignment.center,
                            children: [
                              PieChart(
                                PieChartData(
                                  sections: _getChartSections(),
                                  centerSpaceRadius: 40,
                                  sectionsSpace: 4,
                                ),
                              ),
                              Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Text(
                                    'Spent',
                                    style: TextStyle(
                                      fontSize: 10,
                                      color: Colors.grey[500],
                                    ),
                                  ),
                                  Text(
                                    _totalAmount >= 1000 
                                      ? '${(_totalAmount/1000).toStringAsFixed(1)}k'
                                      : _totalAmount.toStringAsFixed(0),
                                    style: const TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          flex: 3,
                          child: SingleChildScrollView(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: _expenses
                                  .map((e) => e.category)
                                  .toSet()
                                  .map((cat) {
                                return Padding(
                                  padding: const EdgeInsets.symmetric(vertical: 4),
                                  child: Row(
                                    children: [
                                      Container(
                                        width: 12,
                                        height: 12,
                                        decoration: BoxDecoration(
                                          color: CategoryUtils.getColor(cat),
                                          shape: BoxShape.circle,
                                        ),
                                      ),
                                      const SizedBox(width: 8),
                                      Text(
                                        cat,
                                        style: const TextStyle(
                                          fontSize: 12,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    ],
                                  ),
                                );
                              }).toList(),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),

                // Category Filter
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  child: Row(
                    children: [
                      'All',
                      ...ExpenseCategory.categories,
                    ].map((cat) {
                      final isSelected = _selectedCategoryFilter == cat;
                      return Padding(
                        padding: const EdgeInsets.only(right: 8),
                        child: ChoiceChip(
                          label: Text(cat),
                          selected: isSelected,
                          onSelected: (selected) {
                            setState(() {
                              _selectedCategoryFilter = cat;
                            });
                          },
                          selectedColor: Theme.of(context).colorScheme.primary,
                          labelStyle: TextStyle(
                            color: isSelected ? Colors.white : Colors.black,
                            fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                          ),
                          showCheckmark: false,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                      );
                    }).toList(),
                  ),
                ),

                const Padding(
                  padding: EdgeInsets.fromLTRB(24, 8, 24, 8),
                  child: Row(
                    children: [
                      Text(
                        'Recent Transactions',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
                
                // Expenses List
                Expanded(
                  child: Builder(
                    builder: (context) {
                      final filteredExpenses = _selectedCategoryFilter == 'All'
                          ? _expenses
                          : _expenses.where((e) => e.category == _selectedCategoryFilter).toList();

                      if (_expenses.isEmpty) {
                        return Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.receipt_long,
                                size: 80,
                                color: Colors.grey[400],
                              ),
                              const SizedBox(height: 16),
                              Text(
                                'No expenses yet',
                                style: TextStyle(
                                  fontSize: 18,
                                  color: Colors.grey[600],
                                ),
                              ),
                              const SizedBox(height: 8),
                              Text(
                                'Tap + to add your first expense',
                                style: TextStyle(
                                  color: Colors.grey[500],
                                ),
                              ),
                            ],
                          ),
                        );
                      }

                      if (filteredExpenses.isEmpty) {
                        return Center(
                          child: Text(
                            'No transactions under $_selectedCategoryFilter',
                            style: TextStyle(color: Colors.grey[600]),
                          ),
                        );
                      }

                      return RefreshIndicator(
                        onRefresh: _refreshExpenses,
                        child: ListView.builder(
                          padding: const EdgeInsets.all(8),
                          itemCount: filteredExpenses.length,
                          itemBuilder: (context, index) {
                            final expense = filteredExpenses[index];
                            return Dismissible(
                              key: Key(expense.id.toString()),
                              direction: DismissDirection.endToStart,
                              background: Container(
                                alignment: Alignment.centerRight,
                                padding: const EdgeInsets.only(right: 20),
                                color: Colors.red,
                                child: const Icon(Icons.delete, color: Colors.white),
                              ),
                              onDismissed: (direction) {
                                _deleteExpense(expense.id!);
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text('${expense.title} deleted'),
                                    action: SnackBarAction(
                                      label: 'UNDO',
                                      onPressed: () async {
                                        await ExpenseDatabase.instance.createExpense(expense);
                                        _refreshExpenses();
                                      },
                                    ),
                                  ),
                                );
                              },
                              child: ExpenseCard(
                                expense: expense,
                                onTap: () async {
                                  final result = await Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => ExpenseDetailScreen(
                                        expense: expense,
                                      ),
                                    ),
                                  );
                                  if (result == true) {
                                    _refreshExpenses();
                                  }
                                },
                              ),
                            );
                          },
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          // Navigate to add expense screen
          final result = await Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const AddExpenseScreen(),
            ),
          );
          // If expense was added, refresh list
          if (result == true) {
            _refreshExpenses();
          }
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
