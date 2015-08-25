# Gcommerce

Ecommerce built with [Phoenix](http://www.phoenixframework.org/)

## Setup

  1. Install dependencies with `mix deps.get`
  2. Create and migrate your database with `mix ecto.create && mix ecto.migrate`
  3. Start Phoenix endpoint with `mix phoenix.server`
  4. Visit [`localhost:4000`](http://localhost:4000) from your browser

## TODO / ROADMAP FOR CORE
This TODO is organized in _topics_ just to be easier to split the work. Some of
them depend on others, so they got a bit of sorting based on priorities.

### Products
- [x] Product basic info
- [x] Variants (the product variant)
  - [x] OptionTypes (variant options. eg: shirt-size, bag-color, ...)
  - [x] OptionValues (variant option values. eg: red, black, small, ...)
- [ ] Properties (product properties. eg: brand, material, gender, ...)
- [ ] Taxonomies (nested categories)

### Orders
- [ ] Order basic info
- [ ] LineItems (product and quantity for an order)

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
