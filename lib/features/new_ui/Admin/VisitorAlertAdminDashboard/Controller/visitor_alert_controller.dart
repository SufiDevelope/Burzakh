import 'dart:async';
import 'dart:developer';

import 'package:burzakh/Model/AdminModels/VisitorAlertCaseModel/visitor_alert_case_model.dart';
import 'package:burzakh/Repository/AdminRepos/VisitorAlertRepo/visitor_alert_http_repo.dart';
import 'package:burzakh/Repository/AdminRepos/VisitorAlertRepo/visitor_alert_repo.dart';
import 'package:burzakh/features/new_ui/Admin/VisitorAlertAdminDashboard/Widgets/namaz_schedule_widget.dart';
import 'package:get/get.dart';

import '../../../../../data/Response/status.dart';
import 'dua_model.dart';

class VisitorAlertController extends GetxController {
  var currentIndex = 0.obs;
  var isRecited = false.obs;
  Timer? _timer;

  final List<Dua> duas = [
    Dua(
      arabicText:
          'اللهم اجعل قبره روضة من رياض الجنة ولا تجعله حفرة من حفر النار',
      transliteration:
          'Allahumaj\'al qabrahu rawdatan min riyaadil jannati wa la taj\'alhu hufratan min hufarinnaar',
      englishTranslation:
          'O Allah, make their grave a garden from the gardens of Paradise, and do not make it a pit from the pits of the Fire.',
      category: 'Paradise Garden',
      source: 'At-Tirmidhi',
    ),
    Dua(
      arabicText: 'اللهم اغفر له وارحمه وعافه واعف عنه',
      transliteration: 'Allahummaghfir lahu warhamhu wa \'aafihi wa\'fu \'anhu',
      englishTranslation:
          'O Allah, forgive him, have mercy on him, give him strength, and pardon him.',
      category: 'Forgiveness',
      source: 'Muslim',
    ),
    Dua(
      arabicText: 'اللهم آنس وحشته وآمن روعته واغفر خطيئته',
      transliteration:
          'Allahumma aanis wahshatahu wa aamin raw\'atahu waghfir khatee\'atahu',
      englishTranslation:
          'O Allah, comfort his loneliness, secure his fear, and forgive his sins.',
      category: 'Comfort',
      source: 'Ibn Majah',
    ),
    Dua(
      arabicText: 'اللهم أكرم نزله ووسع مدخله واغسله بالماء والثلج والبرد',
      transliteration:
          'Allahumma akrim nuzulahu wa wassi\' mudkhalahu waghsilhu bil maa\'i wath thalji wal barad',
      englishTranslation:
          'O Allah, honor his residence, expand his entrance, and wash him with water, snow, and hail.',
      category: 'Honor',
      source: 'Bukhari',
    ),
    Dua(
      arabicText: 'اللهم أدخله الجنة من غير حساب ولا عذاب',
      transliteration:
          'Allahumma adkhilhul jannata min ghayri hisaabin wa la \'azaab',
      englishTranslation:
          'O Allah, enter him into Paradise without reckoning and without punishment.',
      category: 'Paradise',
      source: 'Ahmad',
    ),
    Dua(
      arabicText: 'اللهم اجعله من الصالحين واجعل قبره نورا',
      transliteration:
          'Allahumma aj\'alhu minas saaliheen waj\'al qabrahu nooran',
      englishTranslation:
          'O Allah, make him among the righteous and make his grave light.',
      category: 'Light',
      source: 'Tirmidhi',
    ),
    Dua(
      arabicText: 'اللهم ارحمه واغفر له وأعطه في الآخرة خيرا من الدنيا',
      transliteration:
          'Allahummarhamhu waghfir lahu wa a\'tihi fil aakhirati khayran mina dunya',
      englishTranslation:
          'O Allah, have mercy on him, forgive him, and give him better in the hereafter than this world.',
      category: 'Mercy',
      source: 'Abu Dawud',
    ),
    Dua(
      arabicText:
          'اللهم اجعل قبره روضة من رياض الجنة ولا تجعله حفرة من حفر النار',
      transliteration:
          'Allahumma thabbithhu \'indas su\'aal wa a\'izhu min \'azaabil qabr',
      englishTranslation:
          'O Allah, make him steadfast during questioning and protect him from the punishment of the grave.',
      category: 'Protection',
      source: 'Nasai',
    ),
    Dua(
      arabicText: 'اللهم اجعل الجنة مثواه والنار مأواه',
      transliteration: 'Allahumaj\'alil jannata mathwaahu wan naara ma\'waahu',
      englishTranslation:
          'O Allah, make Paradise his dwelling and save him from the Fire.',
      category: 'Salvation',
      source: 'Ibn Majah',
    ),
    Dua(
      arabicText:
          'اللهم اجعله في علّيين مع النبيين والصديقين والشهداء والصالحين',
      transliteration:
          'Allahumaj\'alhu fee \'illiyyeena ma\'an nabiyyeena was siddeeqeena wash shuhadaa\'i was saaliheen',
      englishTranslation:
          'O Allah, place him in the highest ranks with the prophets, truthful ones, martyrs, and righteous.',
      category: 'High Ranks',
      source: 'Bukhari',
    ),
  ];

  @override
  void onInit() {
    super.onInit();
    startAutoRotation();
  }

  void startAutoRotation() {
    _timer = Timer.periodic(Duration(seconds: 10), (timer) {
      nextDua();
    });
  }

  void nextDua() {
    if (currentIndex.value < duas.length - 1) {
      currentIndex.value++;
    } else {
      currentIndex.value = 0;
    }
    isRecited.value = false;
  }

  void previousDua() {
    if (currentIndex.value > 0) {
      currentIndex.value--;
    } else {
      currentIndex.value = duas.length - 1;
    }
    isRecited.value = false;
  }

  void toggleRecited() {
    isRecited.value = !isRecited.value;
  }

  void stopAutoRotation() {
    _timer?.cancel();
  }

  @override
  void onClose() {
    stopAutoRotation();
    super.onClose();
  }

  var selectedDay = 'Today'.obs;

  void setSelectedDay(String day) {
    selectedDay.value = day;
    getAllCasses();
  }

  var currentPrayer = 'Fajr'.obs;
  var currentTime = '5:12'.obs;

  var prayerTimes = <PrayerTime>[
    PrayerTime(name: 'Fajr', time: '5:12'),
    PrayerTime(name: 'Dhuhr', time: '12:24'),
    PrayerTime(name: 'Asr', time: '3:42'),
    PrayerTime(name: 'Maghrib', time: '6:35'),
    PrayerTime(name: 'Isha', time: '8:05'),
  ].obs;

  void updateCurrentPrayer(String name, String time, String arabic) {
    currentPrayer.value = name;
    currentTime.value = time;
    getAllCasses();
  }

  var model = VisitorAlertCaseModel().obs;
  final rxRequestStatusForAllCassesCount = Status.loading.obs;
  final VisitorAlertRepo repo = VisitorAlertHttpRepo();

  // Get the Contact List From Api
  void setRxRequestStatusForGetCassesCount(Status value) =>
      rxRequestStatusForAllCassesCount.value = value;
  void setGetCassesCountApiResponse(VisitorAlertCaseModel data) {
    model.value = data;
  }

  void getAllCasses() async {
    await repo
        .visitorAlertCaseApi(currentPrayer.value.toLowerCase(),
            selectedDay.value.toLowerCase(), selectedCemetery.value)
        .then(
      (value) {
        setRxRequestStatusForGetCassesCount(Status.completed);
        setGetCassesCountApiResponse(value);
      },
    ).onError((error, stacktrace) {
      log(error.toString());
      setRxRequestStatusForGetCassesCount(Status.error);
    });
  }

  RxString selectedCemetery = ''.obs;

  final List<String> cemeteries = [
    '',
    'Al Qusais Cemetery',
    'Al Warqa Cemetery',
    'Jumeirah Cemetery',
    'Dubai Silicon Oasis Cemetery',
    'Other Cemetery'
  ];

  void setSelectedCemetery(String cemetery) {
    selectedCemetery.value = cemetery;
    getAllCasses();
  }

  void resetData() {
    selectedDay.value = "Today";
    currentPrayer.value = 'Fajr';
    currentTime.value = '5:12';
  }
}
