# Poject Name
Beers API

# Description

The following are the endpoints that are supported
- get a beer for a given ID
- get ALL beers (no pagination is explicitly required)
- search all beers for a given name
- add a beer
- get a random beer

# System Architecture

- A background worker that will run periodically, fetch the beers from API and save them in our database.
- Consumer can fetch data by using our API's

Advantages:
- Faster API's
- Less dependency with punk API
- consistence results

Drawbacks:
- Eventual consistency

# Other Approachs

- Base on request from user, we fetch beers from API and after reconciliation between beers data and api, we can merge two results and send result back to user

Advantages:
- Latest data

Drawbacks:
- Result inconsistencies
- slow API's
- if punk API goes down our service won't be able to serve beers

# Stack

* [Ruby](https://www.ruby-lang.org/en/)
* [Ruby on Rails](https://rubyonrails.org/)
* [PostgreSQL](https://www.postgresql.org/)
* [RSpec](https://github.com/rspec/rspec-rails)
* [sidekiq-scheduler](https://github.com/sidekiq-scheduler/sidekiq-scheduler)

------------

## Getting Started

To get a local copy up and running follow these simple steps.

### Prerequisites

* `ruby 2.6.5`
* `rails 6.1.5`

### Installation

1. Extract the repo
2. Install the gems
`bundle install`
3. Start the server
`rails s`
4. Run test suits
`rspec`
5- Run the worker
`sidekiq -q high -q default`

