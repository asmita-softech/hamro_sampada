import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FilterDialogScreen extends StatefulWidget {
  const FilterDialogScreen({super.key});

  @override
  State<FilterDialogScreen> createState() => _FilterDialogScreenState();
}

class _FilterDialogScreenState extends State<FilterDialogScreen> {
  String sortBy = 'Distance';
  String orderBy = 'Ascending';
  int selectedRating = 5;
  double selectedDistance = 5000;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16.r),
      ),
      child: Padding(
        padding:  EdgeInsets.symmetric(horizontal: 16.w,vertical: 16.h),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Filters',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                IconButton(
                  icon: const Icon(Icons.close),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
              ],
            ),
            const SizedBox(height: 16),
            const Text('Sort by'),
            Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      setState(() => sortBy = 'Distance');
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor:
                      sortBy == 'Distance' ? Colors.green : Colors.grey[200],
                      foregroundColor:
                      sortBy == 'Distance' ? Colors.white : Colors.black,
                    ),
                    child: const Text('Distance'),
                  ),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      setState(() => sortBy = 'Rating');
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor:
                      sortBy == 'Rating' ? Colors.green : Colors.grey[200],
                      foregroundColor:
                      sortBy == 'Rating' ? Colors.white : Colors.black,
                    ),
                    child: const Text('Rating'),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            const Text('Order by'),
            Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      setState(() => orderBy = 'Ascending');
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: orderBy == 'Ascending'
                          ? Colors.green
                          : Colors.grey[200],
                      foregroundColor:
                      orderBy == 'Ascending' ? Colors.white : Colors.black,
                    ),
                    child: const Text('Ascending'),
                  ),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      setState(() => orderBy = 'Descending');
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: orderBy == 'Descending'
                          ? Colors.green
                          : Colors.grey[200],
                      foregroundColor:
                      orderBy == 'Descending' ? Colors.white : Colors.black,
                    ),
                    child: const Text('Descending'),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            const Text('Rating'),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: List.generate(5, (index) {
                int rating = index + 1;
                return GestureDetector(
                  onTap: () {
                    setState(() => selectedRating = rating);
                  },
                  child: Container(
                    padding: const EdgeInsets.all(8.0),
                    decoration: BoxDecoration(
                      border: Border.all(
                          color: selectedRating == rating
                              ? Colors.green
                              : Colors.grey),
                      borderRadius: BorderRadius.circular(8.0),
                      color: selectedRating == rating
                          ? Colors.green
                          : Colors.transparent,
                    ),
                    child: Text(
                      '$rating ★',
                      style: TextStyle(
                        color: selectedRating == rating
                            ? Colors.white
                            : Colors.black,
                      ),
                    ),
                  ),
                );
              }),
            ),
            const SizedBox(height: 16),
            const Text('Distance'),
            Slider(
              value: selectedDistance,
              min: 0,
              max: 10000,
              divisions: 10,
              label: '${(selectedDistance / 1000).toStringAsFixed(1)}K',
              onChanged: (value) {
                setState(() => selectedDistance = value);
              },
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                Expanded(
                  child: OutlinedButton(
                    onPressed: () {
                      setState(() {
                        sortBy = 'Distance';
                        orderBy = 'Ascending';
                        selectedRating = 5;
                        selectedDistance = 5000;
                      });
                    },
                    child: const Text('Reset'),
                  ),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: const Text('Apply Filters'),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
