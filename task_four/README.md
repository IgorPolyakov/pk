# Практика №4 Радужные таблицы и не только.

По адресу [185.40.31.149](185.40.31.149) доступна API.

Все действия доступны только авторизованным пользователям.

Веб интерфейса - нет, все запросы по HTTP, самое время ознакомиться с [REST](https://ru.wikipedia.org/wiki/REST) API.

Аутентификация по токену ([JWT](https://jwt.io)), время жизни токена ограничено.

Нужна регистрация пользователя. Формат логина: `НомерГруппы_ФамилияИмяОтчество` пример `777_abc`. Буквы в нижнем регистре, на сервере будет присутствовать валидация. Пароль произвольный.

## Задача
Написать программу которая:

* получит задачу от сервера;
* задача заключается в обращении криптографической хеш-функций;
* вам дан - дайджест, тип функции меняется от запроса к запросу, тип вам не известен;
* получить исходное сообщение;
* отправить его серверу;
* получить в ответ `good_job`.

Далее подготовить отчет по проделанной работе.

## Работа с API через `CURL`

* Зарегистрировать пользователя
```
curl -v -H "Accept: application/json" -H "Content-type: application/json" POST -d '{"user": {"login": "530_kiv", "password":"kek" }}' http://185.40.31.149:3000/api/users
```

* Получить токен
```
curl -v -H "Accept: application/json" -H "Content-type: application/json" POST -d '{"login": "530_piy", "password":"lol" }' http://185.40.31.149:3000/api/auth
```

* Посмотреть все задания
```
curl -v -H "Accept: application/json" -H "Content-type: application/json" http://185.40.31.149:3000/api/tasks
```

* Получить задание
```
curl -v -H "Accept: application/json" -H "Content-type: application/json" http://185.40.31.149:3000/api/tasks/#{task_id}
```

* Создать задачу
```
curl -v -H "Accept: application/json" -H "Content-type: application/json" POST -d '' http://185.40.31.149:3000/api/tasks
```

* Отправить решение задачи
```
curl -v -H "Accept: application/json" -H "Content-type: application/json" -H 'Authorization: #{TOKEN}' -X PATCH -d ' {"task":{"decode":"YOUR_ANSWER"}}' http://185.40.31.149:3000/api/tasks/#{task_id}
```
* Посмотреть кто зарегистрировался
```
firefox http://185.40.31.149:3000/api/users
```

## Структура отчета:

* титульный лист;
* задание;
* ход работы;
* заключение;
* приложение - листинг программы.

## Вопросы для защиты

* что такое CRUD/REST?
* что такое jwt и какие альтернативы вы можете назвать?
* какие hash функции были использованы в работе (особенности/различия)?
* что такое радужные таблицы?

## Примечания

* исходные коды сервера лежат на [GitHub](https://github.com/IgorPolyakov/pk/tree/master/task_four)
