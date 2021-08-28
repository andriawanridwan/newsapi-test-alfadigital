import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class NewsPublisher extends StatelessWidget {
  final DateTime date;
  final String publisher;
  const NewsPublisher({
    Key? key,
    required this.date,
    required this.publisher,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Row(
          children: [
            Icon(Icons.calendar_today, color: Colors.grey, size: 15),
            SizedBox(width: 5),
            Text(
              DateFormat('dd MMM yyyy').format(date),
              style: Theme.of(context)
                  .textTheme
                  .bodyText2!
                  .copyWith(color: Colors.grey),
            ),
          ],
        ),
        SizedBox(width: 10),
        Expanded(
          child: Row(
            children: [
              Icon(Icons.person, color: Colors.grey, size: 15),
              SizedBox(width: 5),
              Expanded(
                child: Text(
                  publisher,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: Theme.of(context)
                      .textTheme
                      .bodyText2!
                      .copyWith(color: Colors.grey),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
