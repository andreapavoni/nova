# Nova

[![Build Status](https://travis-ci.org/nebulab/nova.svg)](https://travis-ci.org/nebulab/nova) [![Coverage Status](https://coveralls.io/repos/nebulab/nova/badge.svg?branch=master&service=github)](https://coveralls.io/github/nebulab/nova?branch=master) [![Stories in Ready](https://badge.waffle.io/nebulab/nova.svg?label=ready&title=Ready)](http://waffle.io/nebulab/nova)

An attempt to port/rebuild [Spree](http://spreecommerce.com), an open source e-commerce solution, with [Phoenix](http://www.phoenixframework.org/).


## Vision
Spree is an excellent product however,
for several reasons, it started to show some _limits_:

* being written in Ruby and Rails requires a lot of hosting resources
* it became a big, monolithic piece of software, really hard to customize
* it slowed down the development pace (_perhaps_ because of the point above)

So here's the deal: why not to port/rebuild Spree with Elixir and Phoenix? The main
idea is to take inspiration from the many _Spree's good parts_ and build a new
generation ecommerce for the next years.

## Roadmap, a sort of
See [TODO](TODO.md) for more details, meanwhile, here there are _some intentions_:

### Short term
The first short term goal is to quickly build a bare-bones MVP with the _core models_ (eg: `Product`, `Variant`, `Order`, `LineItem`, ...) and the necessary code to glue them through isolated, well defined _commands_. Then, at a _very high level_:

* get a monolithic app, for now
* as a _Customer_ (say a guest user for the first iteration), I want to purchase products (add to cart -> do checkout)
* as an _Admin_, I want to manage products and orders through an HTTP-JSON API

### Mid term
Once we get an initial, working, very basic product, we can start to split the whole app into components. Very similar to Spree:

* `core`: contains the core models and their basic integrations (queries, commands, ...);
* `api`: all actions should be done from an HTTP-JSON API, so anyone can build its custom frontend (eg: a Single Page App, command line, mobile app, ...), especially for admins;
* `frontend`: uses plain old server-rendered HTML pages;
* `admin`: not a top priority. it's like `frontend`, for admins;
* _extensions_: everything that doesn't strictly fit into the above components, should be done in a dedicated package. After all, some features are very specific to certain needs, we don't want another monolithic piece of software.

### Long term
Don't know right now, _world domination™_? :-)

## Contributing
1. Be nice with others
2. Check [issues](https://github.com/nebulab/nova/issues) or, if your prefer kanban boards, we have [waffle](https://waffle.io/nebulab/nova) too
3. Fork this repo
4. Write code (and tests)
5. Open a PR

## Setup

  1. Copy `.env-example.exs` to `.env.exs`, then edit it to set secret configs
  2. Install dependencies with `mix deps.get`
  3. Create and migrate your database with `mix ecto.create && mix ecto.migrate`
  4. Run tests with `mix test`
  5. Install npm dependencies with `npm install`
  5. Start Phoenix endpoint with `mix phoenix.server`
  6. Visit [`localhost:4000`](http://localhost:4000) from your browser

## Credits
* [Nebulab](http://nebulab.it) for the support.
* [Contributors](https://github.com/nebulab/nova/graphs/contributors).
* [@olistik](https://olisti.co/) because he solved the [issue #1](https://github.com/nebulab/nova/issues/1) :-)
