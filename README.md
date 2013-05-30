# AbTests

AbTests is a simple gem for creating and deploying new a/b tests with only a simple addition of some ruby code in a view.

For serious applications, I would recommend reading the source code of this gem and rolling your own version for easy customization.

## Installation

Add this line to your application's Gemfile:

    gem 'ab_tests'

And then execute:

    $ bundle
    $ bundle exec rails g ab_tests:install
    $ bundle exec rake db:migrate

Or install it yourself as:

    $ gem install ab_tests

## Usage

To create an a/b test merely define the following.

    <%= ab_test "example test", ["variation one", "variation two"], nil do |variation| %>
      <% if variation == "variation one" %>
        <p>
          Variation one
        </p>
      <% end %>
      <% if variation == "variation one" %>
        <p>
          Variation two
        </p>
      <% end %>
    <% end %>


The ab_test helper takes the following arguements: test_name, an array of variation names, and a unique user idenitfier (optional).

The results of the tests are stored in the variations table.


Currently, AbTests does not support variation percentages.  To date I've only had to run 50/50s and other evenly proportioned tests and I merely removed the variations when I have picked a winner. 




## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Added some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
