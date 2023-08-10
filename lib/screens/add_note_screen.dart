import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../providers/notes.dart';

class AddNoteScreen extends StatelessWidget {

    TextEditingController _titleController = TextEditingController();
    TextEditingController _descriptionController = TextEditingController();
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Add Note',
          style: TextStyle(fontSize: 40.sp, fontFamily: 'AlexBrush-Regular'),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            TextField(
              controller: _titleController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Title',
              ),
              onEditingComplete: () {
                FocusScope.of(context).nextFocus();
              },
            ),
            const SizedBox(height: 5),
            TextField(
              controller: _descriptionController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'description',
              ),
              maxLines: 20,
            ),
            const SizedBox(height: 10),
            TextButton(
              child: const Text('Add'),
              onPressed: () {
                Provider.of<Notes>(context, listen: false).addNote(
                  title: _titleController.text,
                  description: _descriptionController.text,
                );
                Provider.of<Notes>(context, listen: false).fetchNotes();
                Navigator.of(context).pop();
              },
            ),
          ],
        ),
      ),
    );
  }
}
