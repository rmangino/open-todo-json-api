## README

Interacting with the json api via curl:

### Authenticate:

```curl -i -X POST -H "Content-Type:application/json" -d '{ "user": { "email": "admin@example.com", "password": "password" } }' http://localhost:3000/sessions```

  yields auth_token: ```{"user_email":"admin@example.com","auth_token":"xxx"}```

### Get all Lists

```curl -i -X GET -H "Content-Type:application/json" -H "X-User-Email:admin@example.com" -H "X-Auth-Token:xxx" http://localhost:3000/lists```

  yields: ```[{"id":9,"title":"List Title 1","created_at":"2015-08-28T16:52:03.522Z","updated_at":"2015-08-28T16:52:03.522Z"}, ...]```

### Get List

```curl -i -X GET -H "Content-Type:application/json" -H "X-User-Email:admin@example.com" -H "X-Auth-Token:xxx" http://localhost:3000/lists/1```

### Create a new List

```curl -i -X POST -H "Content-Type:application/json" -H "X-User-Email:admin@example.com" -H "X-Auth-Token:xxx" -d '{ "list": { "title": "another new list title"} }' http://localhost:3000/lists```

### Update an existing List

```curl -i -X PUT -H "Content-Type:application/json" -H "X-User-Email:admin@example.com" -H "X-Auth-Token:xxx" -d '{ "list": { "title": "updated list title"} }' http://localhost:3000/lists/1```

### Delete a List

```curl -i -X DELETE -H "Content-Type:application/json" -H "X-User-Email:admin@example.com" -H "X-Auth-Token:xxx" http://localhost:3000/lists/1```

----

### Get all Items for a given List

```curl -i -X GET -H "Content-Type:application/json" -H "X-User-Email:admin@example.com" -H "X-Auth-Token:xxx" http://localhost:3000/lists/1/items```

### Get one Item from a given List

```curl -i -X GET -H "Content-Type:application/json" -H "X-User-Email:admin@example.com" -H "X-Auth-Token:xxx" http://localhost:3000/lists/1/items/1```

### Create a new Item in an existing List

```curl -i -X POST -H "Content-Type:application/json" -H "X-User-Email:admin@example.com" -H "X-Auth-Token:xxx" -d '{ "item": { "title": "a new item", "complete": "false"} }' http://localhost:3000/lists/5/items```

### Update an existing Item in a given List

```curl -i -X PUT -H "Content-Type:application/json" -H "X-User-Email:admin@example.com" -H "X-Auth-Token:xxx" -d '{ "item": { "title": "an updated item title"} }' http://localhost:3000/lists/1/items/1```

### Delete an Item from a List

```curl -i -X DELETE -H "Content-Type:application/json" -H "X-User-Email:admin@example.com" -H "X-Auth-Token:xxx" http://localhost:3000/lists/1/items/1```