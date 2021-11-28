# PunditQL

PunditQL adds infers the action based on the class name so Pundit can be used for application where the GraphQL naming conventions applies.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'pundit_ql'
```

And then execute:

    $ bundle install

Or install it yourself as:

    $ gem install pundit_ql

## Usage

### Resolver
```ruby
class Something < GraphQL::Schema::Resolver
  include PunditQL::Resolver
  
        ...
  
  def resolve(id:)
    scope = ::Something.find_by(id: id)
    
    authorize something # this is where the magic happens

        ...

  rescue Pundit::NotAuthorizedError => error
    # deal with it
  end
end
```
In the above example the police used will be `SomethingPolicy#show?`.

#### Collections
If the resolver has a plurazide name, then the police method will be `#index?`

```ruby
class Somethings < GraphQL::Schema::Resolver
  include PunditQL::Resolver
  
        ...
  
  def resolve(id:)
    scope = ::Something.find_by(id: id)
    
    authorize something # this is where the magic happens

        ...

  rescue Pundit::NotAuthorizedError => error
    # deal with it
  end
end

```
In the above example the police used will be `SomethingPolicy#index?`.

### Mutation
```ruby
class CreateSomething < GraphQL::Schema::Mutation
  include PunditQL::Mutation

        ...

  def resolve(...)
    something = Something.new(...)

    authorize something # this is where the magic happens

        ...

  rescue Pundit::NotAuthorizedError => error
    # deal with it
  end
end
```

Mutations named `CreateSomething` are going to look for the `create?` action by default.

Mutations named `UpdateSomething` are going to look for the `update?` action by default.

Mutations named `DeleteSomething` are going to look for the `destroy?` action by default.


### Custom Action

For both resolvers and mutations a custom action can be set.

```ruby
class Something < GraphQL::Schema::Resolver
  include PunditQL::Resolver
  
  define_action_name :custom_action_name
      
        ...

end

class SomeActionOnSomething < GraphQL::Schema::Mutation
  include PunditQL::Mutation
  
  define_action_name :custom_action_name
      
        ...

end
```
In the above examples the policy method used will be `custom_action_name?` will be called.


## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and the created tag, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
