# README

Work with API via `CURL`

* Register user
```
curl -v -H "Accept: application/json" -H "Content-type: application/json" POST -d '{"user": {"login": "530_kiv", "password":"kek" }}' http://localhost:3000/api/users
```

* Get token
```
curl -v -H "Accept: application/json" -H "Content-type: application/json" POST -d '{"login": "530_piy", "password":"lol" }' http://localhost:3000/api/auth
```

* Get all tasks
```
curl -v -H "Accept: application/json" -H "Content-type: application/json" http://localhost:3000/api/tasks
```

* Create task
```
curl -v -H "Accept: application/json" -H "Content-type: application/json" POST -d '' http://localhost:3000/api/tasks
```

* Send task
```
curl -v -H "Accept: application/json" -H "Content-type: application/json" -H 'Authorization: #{token}' -X PATCH -d ' {"task":{"encode":"YOUR_ANSWER"}}' http://localhost:3000/api/tasks/#{relative_reference}
```
