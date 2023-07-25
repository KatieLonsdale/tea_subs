# Endpoints

### Create new subscription

```http
POST /api/v0/customers/:id/subscription
```

<summary>  Details </summary>
<br>

Parameters: <br>

```
title, price, frequency
```

| Code | Description |
| :--- | :---------- |
| 201  | `Created`        |

Example Value:

```json
{
  "data": {
    "id": 1,
    "type": "user",
    "attributes": {
      "customer_id": 1,
      "title": "monthly",
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
  "errors": [{ "detail": "Validation failed." }]
}
```