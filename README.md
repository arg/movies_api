# Movies API

## Endpoinsts

### User's profile

`GET v1/users/:id`

Params:

* `id` - user's id

### User's purchases

#### List

`GET v1/users/:id/purchases`

#### Add

`POST v1/users/:id/purchases`

Params:

* `item_id` - movie/season id
* `option` - purchase option (price/quality_hd/quality_sd)

### Library

#### All items

`GET v1/library/all`

#### Movies only

`GET v1/library/movies`

#### Seasons only (+ episodes)

`GET v1/library/seasons`
