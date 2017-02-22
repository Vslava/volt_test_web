# Как пользоваться

## Формат ошибок

Если после запроса возникла ошибка на сервере, то ответ будет возвращенн в виде JSON
в cледующем формате:

{ errors: [{ code: ...., message: .... },...] }

где:
* code - это символьный код ошибки
* message - пояснение к ошибке

а также соответствующего HTTP статуса ответа

## Формат времени

Для кодирование даты и времени используем стандарт ISO8601. Если не указана
временная зона, то предполагается что это UTC.

## Авторизация

Интерфейса для создания пользвателя нет, поэтому перед авторизацией необходимо создать пользователя вручную в базе.
Для облегчения создания тестового пользователя можно запустить

  $ bin/rails db:seed

Будет созданы 2 пользователя с параметрами:
* nickname: NickName
* email: nick@example.ru
* password: 123123123

* nickname: Angel
* email: angel@example.ru
* password: 231231231

### Запрос

GET: /authenticate.json

Параметры
* email - email пользователя
* password - пароль

### Ответ

в результате получаем JSON c полем
* auth_token - авторизационный токен.

Данный токен необходимо добавлять к любому запросу как допольнительный параметр auth_token.
Если токен будет пропущен при запросе, то в результате придет ошибка с кодом missing_token.
Если токен будет неправильный или невалидный, то придет ошибка с кодом invalid_token.

### Ошибки

* invalid_credentials - возникает если логин или пароль неправильные или отсутствуют

## Создание записи в блоге

### Запрос

POST: /api/v1/posts.json

Параметры
* title - заголовок записи (не более 200 символов)
* body - текст записи (не более 10000 символов)
* published_at - дата/время публикации (если не указана, то берется текущая дата/время)

### Ответ

В ответ получаем JSON-запись с полями
* id - идентификатор записи в базе
* title - заголовок созданной записи
* body - текст записи
* published_at - дата/время публикации
* author_nickname - nickname пользователя создавшего данную запись

### Ошибки

* post_create_failed - проблема при создании записи. Таких ошибок может быть несколько.


## Запрос записи в блоге

### Запрос

GET: /api/v1/posts/:id.json
где id - это идентификатор записи в базе

### Ответ

Аналогичен ответу при создании записи в блоге

### Ошибки

* not_found - если запись не найдена в базе


## Запрос списка записей из блога

### Запрос

GET: /api/v1/posts.json

Параметры
* page - номер страницы
* per_pagee - кол-во записей на страницу

### Ответ

В ответ получаем JSON-запись со списком записей отсортированных по полю published_at по убыванию.
Каждая запись в формате аналогичном ответу при создании записи в блоге.
Дополнительно в HTTP-заголовке ответа передаются поля
* Full-Page-Count - общее количество страниц
* Full-Record-Count - общее количество записей в блоге
