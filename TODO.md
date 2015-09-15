## TODO / CURRENT STATUS
This TODO is a sort of work in progress organized in _topics_ just to make it easier
to split the work across collaborators. Some of them depend on others, so they
got a bit of sorting based on priorities.

### Products
#### Models
- [x] Product basic info
- [x] Variants (the product variant)
  - [x] OptionTypes (variant options. eg: shirt-size, bag-color, ...)
  - [x] OptionValues (variant option values. eg: red, black, small, ...)
- [x] Properties (product properties. eg: brand, material, gender, ...)
- [ ] Taxonomies (nested categories)

#### Commands and Queries
- [x] CRUD Product
  - [ ] CRUD OptionType
  - [x] CRUD Variant
    - [ ] CRUD OptionValue
  - [x] CRUD Property

### Orders
#### Models
- [x] Order basic info
- [x] LineItems (product and quantity for an order)

#### Commands and Queries
- [x] CRUD Order
  - [x] CRUD LineItem
  - [x] Calculate Order total

### Users
- [ ] User basic info (email, password)
- [ ] Roles (admin, ...)

### Payments
- [ ] Payment gateways for CCs
- [ ] Pay by check

### Checkout
- [ ] Checkout basic info
- [ ] Guest
- [ ] Shipping & Billing
- [ ] ShipmentTypes
- [ ] Payment
