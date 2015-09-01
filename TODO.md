## TODO / ROADMAP FOR CORE
This TODO is organized in _topics_ just to be easier to split the work. Some of
them depend on others, so they got a bit of sorting based on priorities.

### Products
#### Models
- [x] Product basic info
- [x] Variants (the product variant)
  - [x] OptionTypes (variant options. eg: shirt-size, bag-color, ...)
  - [x] OptionValues (variant option values. eg: red, black, small, ...)
- [x] Properties (product properties. eg: brand, material, gender, ...)
- [ ] Taxonomies (nested categories)

#### Integrations
- [ ] Create Product
  - [ ] Create OptionType
  - [ ] Create Variant
    - [ ] Create OptionValue
  - [ ] Create Property

### Orders
#### Models
- [x] Order basic info
- [x] LineItems (product and quantity for an order)
#### Integrations
- [ ] Create Order
  - [ ] Create LineItem
  - [ ] Calculate Order total


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
