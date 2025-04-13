# Проектная работа спринта 7

PropDevelopment — это крупная строительная компания. Она входит в топ-3  застройщиков в стране и продолжает активно развиваться.

PropDevelopment предоставляет клиентам услуги, которые связаны с покупкой недвижимости и обслуживанием жилых комплексов. В основном компания работает с частными клиентами. Их можно разделить на две категории:
   - Потенциальные покупатели жилья. Их мы будем называть «клиенты».
   - Собственники, которые приобрели жильё у компании. Их так и будем называть — «собственники».

Клиентам компания предлагает такие IT-продукты:
   - Онлайн-витрина для подбора и бронирования недвижимости из фонда PropDevelopment.
   - Онлайн-тур — приложение, которое позволяет клиентам осмотреть жильё без посещения объекта недвижимости.
   - Онлайн-сделка — приложение, которое позволяет проводить сделки по покупке недвижимости онлайн.

Для собственников компания разработала мобильное приложение, которое упрощает взаимодействия с управляющей компанией. В приложении можно:
   - Оплачивать услуги ЖКХ.
   - Получать информацию от управляющей компании.
   - Следить за текущим и капитальным ремонтом. Собственники могут просматривать актуальные данные о запланированных работах и изучать историю проведённых работ.
   - Управлять «Умным домом». Например, можно управлять автоматикой в жилом помещении и на этажах, а ещё контролировать устройство, которое запирает квартиру.

Глобально у компании две проблемы:

   **1. Нарушен контроль данных.** Есть несколько точек регистрации нового клиента, координации между этими точками нет. Внутренние потоки данных между IT-продуктами контролируются не системно. Ограничения по передаваемым данным в основном обусловлены бизнес-процессами между взаимодействующими IT-продуктами. Со стороны систем обработки данных нет ограничений на доступ к данным.
   **2. Есть проблемы с API партнёров.** Партнёры — это системы управляющих компаний, которые позволяют собственникам оплачивать ЖКУ и следить за информацией о доме. Системы PropDevelopment используют API управляющих компаний без единых политик по безопасности и без системного контроля за передаваемыми данными. В ходе интеграций команды разработки не раз замечали, что:
      - Контракты API содержат категории данных, которые явно предоставляют персональные данные.
      - Некоторые контракты позволяют внешним пользователям выполнять действия и получать данные, к которым у них не должно быть доступа. Например, партнёр из одной управляющей компании может увидеть или изменить данные клиентов и жилищных комплексов, которые относятся к другой компании.

При этом компания собирается активно развивать сервисы для покупателей и жильцов. В том числе — за счёт партнёрских сервисов.

В итоге PropDevelopment собирается провести комплексный аудит безопасности. Сейчас компания готовится к этому мероприятию. Аудит безопасности поможет решить описанные проблемы и закрыть потребности бизнеса: 
   - **Повысить уровень удовлетворённости клиентов.** Компания столкнулась с жалобами клиентов: они видят в приложении ошибки, когда заходят в личный кабинет. Там иногда могут отображаться данные другого клиента — например, другое Ф. И. О. Аудит безопасности позволит найти источник проблемы и устранить её.
   - **Компания не может расширять направление обработки данных.** Компания активно накапливает данные, которые можно «заставить работать», — извлечь из данных знания и реализовать новые сервисы. PropDevelopment планирует реализовать новые сервисы на базе BI-, ML- и AI-технологий. Сейчас проблема управления и хранения потоков данных блокирует реализацию новых продуктов, основанных на данных.
   - **Отреагировать на инциденты и рыночные изменения.** Недавно у конкурента произошла утечка данных, которая активно обсуждалась в СМИ. Руководство PropDevelopment обеспокоено. Аудит безопасности должен помочь компании предотвратить подобные инциденты.
   - **Проверить соответствие требованиям законодательства.** IT-ландшафт PropDevelopment активно развивался: появлялись новые интеграции с поставщиками услуг для продажи недвижимости и новые услуги для жильцов. Сейчас нет уверенности в том, что все текущие бизнес-процессы компании соответствуют законодательным нормам. Аудит позволит проверить, выполняет ли компания требования законодательства РФ, и предотвратить возможные штрафы.

**Необходимо:**
1. Разработать проверочный лист по безопасности данных.
2. Разработать и заполнить проверочный лист для бизнес-систем.
3. Определить внешние интеграции и сформировать список требований, которым они должны удовлетворять.
4. Обеспечить защиту доступа к кластеру Kubernetes.
5. Организовать управление трафиком внутри кластера Kubertnetes.

