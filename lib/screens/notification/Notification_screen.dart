// lib/screens/Setting/notifications_screen.dart
import 'package:flutter/material.dart';
import 'package:intl/intl.dart'; // Import for date formatting

class NotificationsPage extends StatelessWidget {
  const NotificationsPage({super.key});

  @override
  Widget build(BuildContext context) {
    // Dummy notification data for now
    final List<NotificationItem> notifications = [
      NotificationItem(
        title: 'Payment Reminder',
        message: 'Your contribution to "Test Committee 1" is due on 1st Dec.',
        time: DateTime.now().subtract(const Duration(hours: 1)),
      ),
      NotificationItem(
        title: 'New Committee Created',
        message: '"Holiday Fund" committee has been created successfully.',
        time: DateTime.now().subtract(const Duration(days: 2)),
      ),
      NotificationItem(
        title: 'Payment Received',
        message: 'Payment of PKR 5000 received for "Test Committee 1".',
        time: DateTime.now().subtract(const Duration(days: 7, hours: 6)),
      ),
      NotificationItem(
        title: 'Committee Buddy Welcome',
        message: 'Welcome to Committee Buddy! Get started by creating a new committee.',
        time: DateTime.now().subtract(const Duration(days: 30)),
      ),
      // Add more dummy notifications here
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Notifications'),
        backgroundColor: Colors.orange, // Consistent app color
      ),
      body: notifications.isEmpty
          ? const Center(
              child: Text('No notifications yet.'),
            )
          : ListView.builder(
              itemCount: notifications.length,
              itemBuilder: (context, index) {
                final notification = notifications[index];
                return NotificationTile(notification: notification);
              },
            ),
    );
  }
}

class NotificationItem {
  final String title;
  final String message;
  final DateTime time;

  NotificationItem({
    required this.title,
    required this.message,
    required this.time,
  });
}

class NotificationTile extends StatelessWidget {
  final NotificationItem notification;

  const NotificationTile({super.key, required this.notification});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.only(right: 12.0),
              child: Icon(Icons.notifications_active, color: Colors.orange), // Notification icon
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    notification.title,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    notification.message,
                    style: TextStyle(color: Colors.grey[700]),
                  ),
                ],
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  _formatTimeAgo(notification.time), // Function to format time
                  style: TextStyle(fontSize: 12, color: Colors.grey[500]),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  String _formatTimeAgo(DateTime time) {
    final now = DateTime.now();
    final difference = now.difference(time);

    if (difference.inMinutes < 1) {
      return 'Just now';
    } else if (difference.inMinutes < 60) {
      return '${difference.inMinutes} minutes ago';
    } else if (difference.inHours < 24) {
      return '${difference.inHours} hours ago';
    } else if (difference.inDays == 1) {
      return 'Yesterday';
    } else if (difference.inDays < 7) {
      return '${difference.inDays} days ago';
    } else {
      final formatter = DateFormat('MMM d'); // e.g., "Dec 1"
      return formatter.format(time);
    }
  }
}