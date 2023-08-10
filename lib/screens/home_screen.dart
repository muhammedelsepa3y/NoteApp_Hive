import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../providers/notes.dart';
import '../widgets/note_tile.dart';
import 'add_note_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final notesData = Provider.of<Notes>(context);
    final notes = Provider.of<Notes>(context).items;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'notes',
          style: TextStyle(fontSize: 40.sp, fontFamily: 'AlexBrush-Regular'),
        ),
        actions: [
          IconButton(onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (context)=>AddNoteScreen()));
          }, icon: Icon(Icons.add)),
          SizedBox(width: 10.w),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GridView.builder(
          itemCount: notes.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            childAspectRatio: 3/4,
          ),
          itemBuilder: (context, index) => noteTile(
            context,
            id: notes[index].id,
            title: notes[index].title,
            date: notes[index].date,
            description: notes[index].description,
            isFavorite: notes[index].isFavorite,
            isImportant: notes[index].isImportant,
            onFavoriteTap: () {
              notesData.toggleIsFavorite(index);
            },
            onDeleteTap: () {
              notesData.deleteNoteById(index);
            },
          ),
        ),
      ),
    );
  }
}
