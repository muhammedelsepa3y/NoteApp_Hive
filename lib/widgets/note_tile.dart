import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


Widget noteTile(context,
    {
      id,
      title,
      date,
      description,
      isFavorite,
      isImportant,
      onFavoriteTap,
      onDeleteTap}) {
  return Stack(
    children: [
      InkWell(
        onTap: () {

        },
        child: Card(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: 25.h,
                  child: Text(
                    title,
                    style: Theme.of(context).textTheme.titleSmall,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                SizedBox(
                  height: 20.h,
                  child: Text(
                    date.toString().substring(0, 10),
                    style: Theme.of(context).textTheme.bodyMedium,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                SizedBox(
                  height: 8.h,
                  width: 200.w,
                ),
                SizedBox(
                  height: 50.h,
                  child: Text(
                    description,
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      Positioned(
        top: 5.h,
        right: 10.h,
        child: DropdownButton(
          icon: const Icon(
            Icons.more_vert,
            color: Colors.grey,
          ),
          borderRadius: BorderRadius.circular(10),
          menuMaxHeight: 50.h,
          underline: Container(),
          items: [
            DropdownMenuItem(
              value: 'delete',
              child: Text(
                'Delete',
                style: Theme.of(context).textTheme.labelSmall,
              ),
            ),
          ],
          onChanged: (value) {
            if (value == 'delete') {
              onDeleteTap();
              // Navigator.of(context).pushNamed(AddNoteScreen.routeName);
            }
          },
        ),
      ),
      Positioned(
        bottom: 5.h,
        right: 5.h,
        child: IconButton(
          icon: Icon(
            isFavorite ? Icons.favorite : Icons.favorite_border,
            color:
            isFavorite ? Theme.of(context).colorScheme.error : Colors.grey,
          ),
          onPressed: onFavoriteTap,
        ),
      ),
    ],
  );
}
