import 'package:foodsub/ui/views/screens/notification/notification_tile.dart';
import 'package:foodsub/ui/views/shared/Widgets/images.dart';

final List<NotificationTile> notification = <NotificationTile>[
  const NotificationTile(
    imgPath: foodsub,
    notification: 'Jason! Hart just grabbed your order. He’s winging '
        'his way to you this very moment. Track your order.',
    time: '1 minutes ago',
    view: false,
  ),
  const NotificationTile(
    imgPath: foodsub,
    notification: 'It’s like Christmas in July! Enjoy 20% off and more '
        'with the latest rewards waiting for you.',
    time: '2 hours ago',
    view: false,
  ),
  const NotificationTile(
      imgPath: foodsub,
      notification: 'Early access to the NEW Ewa agoyin begins today! '
          'Click to order now!',
      time: '3 hours ago',
      view: false),
  const NotificationTile(
      imgPath: foodsub,
      notification: 'Long weekends mean more time for sweet sips, '
          'enjoy Food Sub’s famous coffee!',
      time: '3 hours ago',
      view: false),
];

final List<NotificationTile> yesterdayNoti = <NotificationTile>[
  const NotificationTile(
      imgPath: foodsub,
      notification: 'Hi Marie, Enjoying your weekly suscription? Let '
          'other users know by leaving a review. Your opinion '
          'matters!',
      time: '22 hours ago',
      view: false),
  const NotificationTile(
      imgPath: foodsub,
      notification: 'You haven’t completed your suscription. Would '
          'you like to do it now?',
      time: '1 days ago',
      view: true),
  const NotificationTile(
      imgPath: foodsub,
      notification: 'Happy birthday Marie! Instead of cake, how about '
          '20% discount off your next suscription? Claim '
          'now, you deserve it!',
      time: '1 days ago',
      view: true),
];
