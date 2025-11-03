import '../models/data_layer.dart';
import 'package:flutter/material.dart';

class PlanScreen extends StatefulWidget {
  const PlanScreen({super.key});

  @override
  State<PlanScreen> createState() => _PlanScreenState();
}

class _PlanScreenState extends State<PlanScreen> {
  Plan plan = const Plan();
  late ScrollController scrollController;

  // ✅ Langkah 11: Tambah Scroll Listener
  @override
  void initState() {
    super.initState();
    scrollController = ScrollController()
      ..addListener(() {
        // Menghapus fokus saat di-scroll
        FocusScope.of(context).requestFocus(FocusNode());
      });
  }

  // ✅ Langkah 13: Dispose controller ketika widget dihapus
  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Muhammad Nasih'),
      ),
      body: _buildList(),
      floatingActionButton: _buildAddTaskButton(),
    );
  }

  // ✅ Tombol untuk menambah task baru
  Widget _buildAddTaskButton() {
    return FloatingActionButton(
      onPressed: () {
        setState(() {
          final tasks = List<Task>.from(plan.tasks)..add(const Task());
          plan = Plan(name: plan.name, tasks: tasks);
        });
      },
      tooltip: 'Tambah Tugas',
      child: const Icon(Icons.add),
    );
  }

  // ✅ Langkah 12: Tambah controller dan keyboard behavior
  Widget _buildList() {
    return ListView.builder(
      controller: scrollController,
      keyboardDismissBehavior:
          Theme.of(context).platform == TargetPlatform.iOS
              ? ScrollViewKeyboardDismissBehavior.onDrag
              : ScrollViewKeyboardDismissBehavior.manual,
      itemCount: plan.tasks.length,
      itemBuilder: (context, index) {
        return _buildTaskTile(plan.tasks[index], index);
      },
    );
  }

  // ✅ Widget untuk setiap task
  Widget _buildTaskTile(Task task, int index) {
    return ListTile(
      leading: Checkbox(
        value: task.complete,
        onChanged: (selected) {
          setState(() {
            plan = Plan(
              name: plan.name,
              tasks: List<Task>.from(plan.tasks)
                ..[index] = Task(
                  description: task.description,
                  complete: selected ?? false,
                ),
            );
          });
        },
      ),
      title: TextFormField(
        initialValue: task.description,
        onChanged: (text) {
          setState(() {
            plan = Plan(
              name: plan.name,
              tasks: List<Task>.from(plan.tasks)
                ..[index] = Task(
                  description: text,
                  complete: task.complete,
                ),
            );
          });
        },
      ),
    );
  }
}
