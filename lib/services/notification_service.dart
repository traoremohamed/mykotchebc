import '../core.dart';

class NotificationService {
  List<NotificationMessage> getMessageList() {
    return <NotificationMessage>[
      /*NotificationMessage(
        title: "Progress",
        content: "Please finish tour guide, how to book car!",
        progress: 70,
        date: DateTime.now(),
        isRead: false,
      ),*/
      /*NotificationMessage(
        title: "Updates",
        content: "We have some of the newest features in this version",
        iconURL: "assets/images/notifications/news.png",
        date: DateTime.now(),
        isRead: false,
      ),*/
      NotificationMessage(
        title: "Alerte",
        content: "Votre visite expire dans pas longtemps.",
        iconURL: "assets/images/notifications/analytics.png",
        date: DateTime.now(),
        isRead: true,
      ),
      NotificationMessage(
        title: "Informations",
        content: "Veuillez toujours verifier votre niveau d'huile.",
        iconURL: "assets/images/notifications/verification.png",
        date: DateTime.now().subtract(const Duration(days: 1)),
        isRead: true,
      ),
      NotificationMessage(
        title: "Services",
        content:
            "Le garage Chez Bossia vous offre une crique pour chaque revision et 20% de reduction sur votre vidange.",
        iconURL: "assets/images/notifications/info-sharing.png",
        date: DateTime.now().subtract(const Duration(days: 1)),
        isRead: true,
        isDirect: false,
      ),
    ];
  }

  List<DateTime> getMessageDateList() {
    List<DateTime> list =
        getMessageList().map((message) => message.date).toList();

    list.sort((b, a) => a.compareTo(b));
    list = list
        .map((date) => ConverterHelper.dateFormatYmdOnly(date))
        .toSet()
        .toList();

    return list;
  }
}
