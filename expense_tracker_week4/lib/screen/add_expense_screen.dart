import 'package:flutter/material.dart';
import '../models/expense.dart';
import '../detabase/expense_database.dart';
import '../models/category.dart';
import 'package:intl/intl.dart';
import '../utils/category_utils.dart';

class AddExpenseScreen extends StatefulWidget {
  final Expense? expense;

  const AddExpenseScreen({super.key, this.expense});

  @override
  State<AddExpenseScreen> createState() => _AddExpenseScreenState();
}

class _AddExpenseScreenState extends State<AddExpenseScreen> {
  final _formKey = GlobalKey<FormState>();
  late TextEditingController _titleController;
  late TextEditingController _amountController;
  late TextEditingController _notesController;

  late String _selectedCategory;
  late DateTime _selectedDate;

  @override
  void initState() {
    super.initState();
    _titleController = TextEditingController(text: widget.expense?.title ?? '');
    _amountController = TextEditingController(
      text: widget.expense?.amount.toStringAsFixed(2) ?? '',
    );
    _notesController = TextEditingController(text: widget.expense?.notes ?? '');
    _selectedCategory = widget.expense?.category ?? ExpenseCategory.categories.first;
    _selectedDate = widget.expense?.date ?? DateTime.now();
  }

  Future<void> _selectDate() async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _selectedDate,
      firstDate: DateTime(2020),
      lastDate: DateTime.now(),
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: Theme.of(context).colorScheme.copyWith(
              primary: CategoryUtils.getColor(_selectedCategory),
            ),
          ),
          child: child!,
        );
      },
    );
    if (picked != null && picked != _selectedDate) {
      setState(() {
        _selectedDate = picked;
      });
    }
  }

  Future<void> _saveExpense() async {
    if (_formKey.currentState!.validate()) {
      final expense = Expense(
        id: widget.expense?.id,
        title: _titleController.text,
        amount: double.parse(_amountController.text),
        category: _selectedCategory,
        date: _selectedDate,
        notes: _notesController.text.isNotEmpty ? _notesController.text : null,
      );

      if (widget.expense == null) {
        await ExpenseDatabase.instance.createExpense(expense);
      } else {
        await ExpenseDatabase.instance.updateExpense(expense);
      }

      if (mounted) {
        Navigator.pop(context, true);
      }
    }
  }

  InputDecoration _buildInputDecoration(String label, IconData icon, Color themeColor) {
    return InputDecoration(
      labelText: label,
      prefixIcon: Icon(icon, color: themeColor),
      filled: true,
      fillColor: themeColor.withOpacity(0.05),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(16),
        borderSide: BorderSide.none,
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(16),
        borderSide: BorderSide.none,
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(16),
        borderSide: BorderSide(color: themeColor, width: 2),
      ),
      floatingLabelStyle: TextStyle(color: themeColor, fontWeight: FontWeight.bold),
    );
  }

  @override
  Widget build(BuildContext context) {
    final themeColor = CategoryUtils.getColor(_selectedCategory);

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.expense == null ? 'Add Expense' : 'Edit Expense'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // Amount Input
              TextFormField(
                controller: _amountController,
                style: const TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
                decoration: InputDecoration(
                  hintText: '0.00',
                  prefixText: 'GHS ',
                  border: InputBorder.none,
                  hintStyle: TextStyle(color: Colors.grey[300]),
                ),
                keyboardType: const TextInputType.numberWithOptions(decimal: true),
                validator: (value) {
                  if (value == null || value.isEmpty) return 'Enter amount';
                  if (double.tryParse(value) == null) return 'Invalid amount';
                  return null;
                },
              ),
              const Center(
                child: Text(
                  'Amount',
                  style: TextStyle(color: Colors.grey, fontWeight: FontWeight.w500),
                ),
              ),
              const SizedBox(height: 32),

              // Title Field
              TextFormField(
                controller: _titleController,
                decoration: _buildInputDecoration('What did you spend on?', Icons.edit_note, themeColor),
                validator: (value) => (value == null || value.isEmpty) ? 'Enter title' : null,
              ),
              const SizedBox(height: 20),
              
              // Category Selection
              DropdownButtonFormField<String>(
                initialValue: _selectedCategory,
                decoration: _buildInputDecoration('Category', Icons.grid_view_rounded, themeColor),
                items: ExpenseCategory.categories.map((category) {
                  return DropdownMenuItem(
                    value: category,
                    child: Row(
                      children: [
                        Icon(CategoryUtils.getIcon(category), color: CategoryUtils.getColor(category), size: 20),
                        const SizedBox(width: 12),
                        Text(category),
                      ],
                    ),
                  );
                }).toList(),
                onChanged: (value) => setState(() => _selectedCategory = value!),
              ),
              const SizedBox(height: 20),
              
              // Date Picker
              InkWell(
                onTap: _selectDate,
                borderRadius: BorderRadius.circular(16),
                child: InputDecorator(
                  decoration: _buildInputDecoration('Date', Icons.calendar_today_rounded, themeColor),
                  child: Text(
                    DateFormat('MMMM dd, yyyy').format(_selectedDate),
                    style: const TextStyle(fontSize: 16),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              
              // Notes Field
              TextFormField(
                controller: _notesController,
                decoration: _buildInputDecoration('Notes (Optional)', Icons.notes_rounded, themeColor),
                maxLines: 3,
              ),
              const SizedBox(height: 40),
              
              // Save Button
              ElevatedButton(
                onPressed: _saveExpense,
                style: ElevatedButton.styleFrom(
                  backgroundColor: themeColor,
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(vertical: 18),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  elevation: 0,
                ),
                child: Text(
                  widget.expense == null ? 'Save Expense' : 'Update Expense',
                  style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _titleController.dispose();
    _amountController.dispose();
    _notesController.dispose();
    super.dispose();
  }
}
