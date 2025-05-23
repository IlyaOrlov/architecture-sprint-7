# Список требований для внешних интеграций

## Требования к безопасности
1. Контур, в котором осуществляется обработка ПДн (в т.ч. биометрии), должен быть изолирован от внешних интеграций и от IT-окружения внутри компании с использованием МСЭ (межсетевого экрана, файрвола).
2. Согласно 572-ФЗ хранение биометрических персональных данных разрешено только в Единой биометрической системе (ЕБС). Поэтому для распознавания пользователей по лицу необходима внешняя интеграция с ЕБС через СМЭВ.
3. Все соединения со внешними платформами и сервисами должны использовать шифрование. Соответственно, должны использоваться протоколы HTTPS, WSS (WebSocket SSL) и для передачи видео от домофона к мобильному приложению - RTSP (либо другие протоколы передачи видео с поддержкой шифрования).
4. Соединения с внешней платформой "Умный дом" должны использовать аутентификацию.
5. Вход для пользователей (собственников) необходимо реализовать с использованием MFA (2FA: пароль + OTP).
6. Вход для сотрудников (менеджеров) необходимо реализовать с использованием MFA (2FA: пароль + OTP). В дальнейшем для компании рекомендуется применение SSO.
7. Доступ к данным контура разрещается только авторизованным сотрудникам компании.
8. Доступ технических специалистов и разработчиков необходимо организовывать через терминальный сервер с использованием Balabit. Для удалённого подключения необходимо использовать vpn.
9. Для аудита журналов безопасности и выявления аномалий необходимо интегрировать SIEM-систему Splunk (как минимум, в контуре обработки ПДн).

## Протоколы аутентификации и авторизации
Для аутентификации и авторизации как пользователей, так и внешних интеграций необходимо использовать протокол OAuth 2.0.

## Взаимодействие между системами предприятия и внешней платформой
1. Непосредственное взаимодействие с устройствами (домофоном, шлагбаумом) осуществляется внешней платформой.
2. Для передачи команд устройствам используется REST API внешней платформы.

### Интеллектуальный видеодомофон
1. При звонке по видеодомофону в сервис `device-management-app ` передаётся уведомление о событии, идентификатор устройства и изображение для анализа биометрии.
2. Если устройство зарегистрировано в системе, и для него разрешено распознавание лиц (запрос к `device-auth-app`), выполняется запрос к ЕБС через СМЭВ.
3. Если распознавание выполнено, и пользователь зарегистрирован в системе (запрос к `CRM`), внешней платформе передаётся команда для устройства "открыть дверь".
4. Если распознать объект не удалось, через сервис `tenant-core-app` передаётся уведомление на мобильное приложение собственника о входящем видеозвонке с домофона.
5. Собственник через мобильное приложение может передать команду устройству на организацию видеозвонка (соединение организуется через внешнюю платформу), на отклонение видеозвонка, либо на открытие двери. Команда передаётся через сервис `tenant-core-app` в сервис `device-management-app `: если данное устройство принадлежит данному собственнику (запрос к `device-auth-app`), команда передаётся далее устройству через внешнюю платформу.

### Интеллектуальный шлагбаум
1. Шлагбаум передаёт в сервис `device-management-app ` изображение с номером автомобиля.
2. Если устройство зарегистрировано в системе, выполняется распознавание номера на изображении (OCR) и проверка разрешения на въезд для данного номера (запрос к `CRM`).
3. Если удалось распознать номер и для него есть разрешение, внешней платформе передаётся команда для устройства "открыть шлагбаум".
4. Собственник через мобильное приложение может передать команду устройству на открытие шлагбаума. Команда передаётся через сервис `tenant-core-app` в сервис `device-management-app `: если данное устройство принадлежит данному собственнику (запрос к `device-auth-app`), команда передаётся далее устройству через внешнюю платформу.


