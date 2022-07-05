const listSpot = [
  {
    'img':
        'https://s3-alpha-sig.figma.com/img/b4e2/f648/aad0d867023f5e294ac5862683d16fc0?Expires=1657497600&Signature=DlS0aMlEIOjPDCEL66z5m~zKNqoydl~CyWnaR~BJq2PeNnL4uzwX1sGS63oWyj1ELNhnZNPUImfXwmYLhVRc1ex7btW5~LOczqhg5O~0Rwxw8OyNNwWB2aLRwH-85snakhsBVSsAJd-oygy0uv2~lPZOitrHIghhny6gF19YxtUlcrIvVPhjkz5Xz-MQ8eNY2bAojXhV6DpCEsfBaNGSaon6AP9YqzmlmYDXBc9PfUTfe~rf49b38NdyRYIOysGbiwhcFxkk~GpRHDvsMX34KmliC7bbxQLfaCHKcAz5sFDZgl-6rFbraLuk9u3Ir5fOO3NGPtUiqgKUBUp6edXv1A__&Key-Pair-Id=APKAINTVSUGEWH5XD5UA',
    'title': '沖縄県 - 本島中部',
    'content':
        '中心部の国際通りや、沖縄の食文化を体験できる公設市場など、お土産やうまいもの探しに非常に便利。沖縄に来たら一度は訪れたい街で、市内には沖縄で唯一の鉄道であるモノレール「ゆいレール」が走っています。ゆいレールは那覇空港からお隣の浦添市まで通っており、眺めも良く非常に人気があります。'
  },
  {
    'img':
        'https://s3-alpha-sig.figma.com/img/26c7/cd80/6a6795f889ab388e6af13b0b7d0e7188?Expires=1657497600&Signature=Xv85-0tjZfkC92mbbhU62h5aO4Ke6aepLljOEIipbRDf6QumcZ2ayLeP9Hplt54eKPk~ezELh62pI7oniYkXBJAWwUgWbgVd5uwArcBSc6P4oWvkPJiWojdIjv6bNLOrQ3HC8PX5EPVQFtj8gaQt5ihBZsW3T8wKS4gqVK0MD9q~qKKhJgChwZgxVUh9bs34-EngkOBND4n54UV2x7V~yuQvybHCqf~I9A~8PP~XHhoXUn~iLYUeFBJUZC1D-wIspRPFCmDJhAPoSC8PDFCgnt~BexcB6cLKtsO0RFOGTciePcFCsmucLjsvxF9QpFgrrDA1SW0GC0j-bZcsV5uF2g__&Key-Pair-Id=APKAINTVSUGEWH5XD5UA',
    'title': '沖縄県 - 石垣島',
    'content':
        '八重山諸島の玄関口である石垣島からは、竹富島や西表島、波照間島などへフェリーで渡れます。飲食店、土産物店、ホテルが充実している石垣島を拠点にして、昔ながらの風景が残る竹富島、マングローブ林が広がり多彩なアクティビティが楽しめる西表島へ日帰りで渡るのもおすすめ。ゆったりした時間を過ごせます。'
  },
  {
    'title': '沖縄県 - 石垣島',
    'content':
        '八重山諸島の玄関口である石垣島からは、竹富島や西表島、波照間島などへフェリーで渡れます。飲食店、土産物店、ホテルが充実している石垣島を拠点にして、昔ながらの風景が残る竹富島、マングローブ林が広がり多彩なアクティビティが楽しめる西表島へ日帰りで渡るのもおすすめ。ゆったりした時間を過ごせます。'
  }
];

const listSkill = [
  {'title': '旅行業務取扱管理者（国内）'},
  {'title': 'TOEIC', 'level': '800点'},
  {'title': '旅行地理検定', 'level': '中級'}
];

const listActivity = [
  {
    'time': '2021年12月15日',
    'title': '西表・由布・竹富島めぐり日帰りツアーログ',
    'content':
        '西表島では仲間川マングローブクルーズにご乗船。水牛車で由布島に渡り、亜熱帯特有の動植物を観察できる由布島植物園にて自由時間をお楽しみいただきました。',
    // 'list_img': [],
  },
  {
    'time': '2021年12月12日',
    'title': 'マンタとウミガメシュノーケリング+幻の島上陸ツアーログ',
    'content': '西表島の大自然を満喫する凝縮ツアー！SUP（またはカヌー）で“幸運の滝”クーラの滝へ！滝遊びと鍾乳洞探検をしました。',
  },
  {
    'time': '2021年12月10日',
    'title': 'マングローブSUP&バラス島上陸ツアーログ',
    'content':
        '西表島の魅力を1日で満喫できる凝縮ツアー！SUP or カヌーとトレッキングで”幸運の滝”と呼ばれるクーラの滝を目指します。滝遊びを楽しんだ後は、“奇跡の島”バラス島へ上陸！',
  }
];
const listImgActivity = [
  {},
  {
    'list_img': [
      'https://s3-alpha-sig.figma.com/img/45e7/408f/78ba027f586dcdc8121635083fb20d80?Expires=1657497600&Signature=E2Rq1ILS-CEoW9OcPUTDy7CYEGM6R7Kplyt4yOvA0~r1nTAw82HMj8rLx5i9bO4RoTUanDNb1o4PX~a7xjpUU8iPp~PF2dWXENgX-uCQ2JLxlOevTZTwlLGjAd3byqHrfrrQkc5uSyCuOfhj0RE5jvybFwHQXyVSO~uB-x6WwkXBgDSwvrdYH~twPx5yjcYhMQ~howA93v9UPoeoEbCNzGGubVMr4VibAyxGzY5wR28OfoDRLmpLwemL8uQ6ENKFo3f-nD1pIO4VuXHvH736CNKxCrbD5VPOCRZHe7GKO3671Y77GkjcXA2Dpvt2WBiDpeVoypT1l3vIbAbf7D1Ggg__&Key-Pair-Id=APKAINTVSUGEWH5XD5UA',
      'https://s3-alpha-sig.figma.com/img/ac02/7f90/35edb78401a1d8fc0cf925327abee7d9?Expires=1657497600&Signature=O1J1jbSsZedu2D8WFdC9RsQUH5lv0POPu5s2yM6O11fwpuCT6XqQDNVymZJm8lo9xlfcjJaMw0Vot2~oNKUJ~n5VOoL4~fTRehpBSF7-i9dTlrmma55ptO9IVBN12emxBR20XQX9ZbJILvCHlL9FAd9p9ptn8vV5qqVWiLpVrwAHVvci1Au8dTVauOyl0ICFULzW3~JsWXcHcqH81u4lGzzzbmBcXn7INoXa9Y08PDuLtpA6PWqemZN~XXURi6aYBefER5Ih57AEv8m1p2MmJHgZSR3i8pi6ucrbzP7ZavVFovcEbjX~Kbc2cC4Q00Vgp2nhhkNpD1nLL8xPIOKHSg__&Key-Pair-Id=APKAINTVSUGEWH5XD5UA',
    ],
  },
  {
    'list_img': [
      'https://s3-alpha-sig.figma.com/img/74f5/6da2/8813fd54e04192bbbeeb01445bc38c1d?Expires=1657497600&Signature=EAZWBWaZZAr7kF27zRMV1UANWNlnDRrzcNnwxmQwPWzr7DJuZ-tq0Kn7l7lvOkrH-clX9HKlBsH0sc1kPnWB~V3lq4H-Ui5NtxJ1wVYNY71FDmCCAk1l0zbWmrG7i1oOz-KBtJi-WkSrzSJE~cqDrDUKsbcSIyyUPciYxTqMu8gx5neIizM9BcrnjM2dcMjkH7gW7wUOGMlLQRfJ7Z-DlvCnX~9oP8DeBjwDNrcbq9xzlo3GSh6uKHcU25Z57J0SkBRpoQtC21ISTnJKSlVcEqNr-9YZ96LKsYi0CJbToP-oh-DpRuNCU0e78gPdG5y~2BzVWywzDHCgSZh7Kb8UKg__&Key-Pair-Id=APKAINTVSUGEWH5XD5UA'
    ],
  }
];

const listContentPhoto = [
  '西表・由布・竹富島めぐり日帰りツアー',
  'マンタとウミガメシュノーケリング',
  'ウミガメシュノーケリング'
];

final listImgPhoto = [
  List.filled(3,
      'https://s3-alpha-sig.figma.com/img/45e7/408f/78ba027f586dcdc8121635083fb20d80?Expires=1657497600&Signature=E2Rq1ILS-CEoW9OcPUTDy7CYEGM6R7Kplyt4yOvA0~r1nTAw82HMj8rLx5i9bO4RoTUanDNb1o4PX~a7xjpUU8iPp~PF2dWXENgX-uCQ2JLxlOevTZTwlLGjAd3byqHrfrrQkc5uSyCuOfhj0RE5jvybFwHQXyVSO~uB-x6WwkXBgDSwvrdYH~twPx5yjcYhMQ~howA93v9UPoeoEbCNzGGubVMr4VibAyxGzY5wR28OfoDRLmpLwemL8uQ6ENKFo3f-nD1pIO4VuXHvH736CNKxCrbD5VPOCRZHe7GKO3671Y77GkjcXA2Dpvt2WBiDpeVoypT1l3vIbAbf7D1Ggg__&Key-Pair-Id=APKAINTVSUGEWH5XD5UA'),
  List.filled(7,
      'https://s3-alpha-sig.figma.com/img/26c7/cd80/6a6795f889ab388e6af13b0b7d0e7188?Expires=1657497600&Signature=Xv85-0tjZfkC92mbbhU62h5aO4Ke6aepLljOEIipbRDf6QumcZ2ayLeP9Hplt54eKPk~ezELh62pI7oniYkXBJAWwUgWbgVd5uwArcBSc6P4oWvkPJiWojdIjv6bNLOrQ3HC8PX5EPVQFtj8gaQt5ihBZsW3T8wKS4gqVK0MD9q~qKKhJgChwZgxVUh9bs34-EngkOBND4n54UV2x7V~yuQvybHCqf~I9A~8PP~XHhoXUn~iLYUeFBJUZC1D-wIspRPFCmDJhAPoSC8PDFCgnt~BexcB6cLKtsO0RFOGTciePcFCsmucLjsvxF9QpFgrrDA1SW0GC0j-bZcsV5uF2g__&Key-Pair-Id=APKAINTVSUGEWH5XD5UA'),
  List.filled(9,
      'https://s3-alpha-sig.figma.com/img/74f5/6da2/8813fd54e04192bbbeeb01445bc38c1d?Expires=1657497600&Signature=EAZWBWaZZAr7kF27zRMV1UANWNlnDRrzcNnwxmQwPWzr7DJuZ-tq0Kn7l7lvOkrH-clX9HKlBsH0sc1kPnWB~V3lq4H-Ui5NtxJ1wVYNY71FDmCCAk1l0zbWmrG7i1oOz-KBtJi-WkSrzSJE~cqDrDUKsbcSIyyUPciYxTqMu8gx5neIizM9BcrnjM2dcMjkH7gW7wUOGMlLQRfJ7Z-DlvCnX~9oP8DeBjwDNrcbq9xzlo3GSh6uKHcU25Z57J0SkBRpoQtC21ISTnJKSlVcEqNr-9YZ96LKsYi0CJbToP-oh-DpRuNCU0e78gPdG5y~2BzVWywzDHCgSZh7Kb8UKg__&Key-Pair-Id=APKAINTVSUGEWH5XD5UA')
];

final languages = ['English', 'Vietnamese', '日本語'];
