# Intranet der Bürgerwerke

## Requirements

* Ruby-Version: __2.5.1__
* Rails: __>=5.2.0__
* Production ENV is set to use _Phusion Passenger_ as App-Server and _Mini-Racer_ as JS-Runtime.

## Installation

([Tutorial in German](https://github.com/morris-frank/buergerwerke-intranet/wiki/Deployment))

```bash
git clone https://github.com/morris-frank/buergerwerke-intranet.git .
bundle install
rails db:create
rails db:migrate
(rails db:seed)
rails assets:precompile
```

You will have to Create a Admin Account by Hand:

```bash
rails c
```

and run for example:

```ruby
Admin.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password')
```

If your working in _development_ Mode you can also just add the Seeds (including the above Admin account):

```bash
rails db:seed
```

Then run server:

```bash
rails s
```

and have Member section under [localhost:3000](http://localhost:3000) and the admin section under [localhost:3000/admin](http://localhost:3000/admin).
