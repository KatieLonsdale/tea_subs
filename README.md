# Endpoints

### Create new subscription

```http
POST /api/v0/customers/:id/subscriptions
```

<summary>  Details </summary>
<br>

Parameters: <br>

```
title, price, frequency, customer id
```

| Code | Description |
| :--- | :---------- |
| 201  | `Created`   |

Example Value:

```json
{
  "data": {
    "id": 1,
    "type": "user",
    "attributes": {
      "customer_id": 1,
      "title": "basic",
      "price": "$5.99",
      "status": "active",
      "frequency": "monthly"
    }
  }
}
```

| Code | Description |
| :--- | :---------- |
| 400  | `Bad Request` |

Example Value:

```json
{
  "errors": [{ "detail": "Validation failed: {{error details}}" }]
}
```

### Cancel Subscription

```http
DELETE /api/v0/customers/:customer_id/subscriptions/:subscription_id
```

<summary>  Details </summary>
<br>

Parameters: <br>

```
none required
```

| Code | Description |
| :--- | :---------- |
| 204  | `No Content`|

| Code | Description |
| :--- | :---------- |
| 404  | `Not Found` |

Example Value:

```json
{
  "errors": [{ "detail": "User does not exist" }]
}
```
### Get All Customer Subscriptions

```http
GET /api/v0/customers/:customer_id/subscriptions
```

<summary>  Details </summary>
<br>

Parameters: <br>

```
none required
```

| Code | Description |
| :--- | :---------- |
| 200  | `OK`        |

``` json
{
  "data": [{
    "id": "1",
    "type": "subscription",
    "attributes": {
      "customer_id": 1,
      "title": "basic",
      "price": "$5.99",
      "status": "active",
      "frequency": "monthly"
    }
  },
  {
    "id": "2",
    "type": "subscription",
    "attributes": {
      "customer_id": 1,
      "title": "premium",
      "price": "$9.99",
      "status": "cancelled",
      "frequency": "monthly"
    }
  }]
}
```

| Code | Description |
| :--- | :---------- |
| 404  | `Not Found` |

Example Value:

```json
{
  "errors": [{ "detail": "User does not exist" }]
}
```