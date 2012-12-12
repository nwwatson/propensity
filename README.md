Propensity
==========

Note: This gem is still under development, but is usable, and I have used it in production systems. Ensure that you follow the instructions in their entirety.

Propensity provides an easy way to manage settings within a Rails application. These settings are persisted in a database and loaded on initialization of Rails. This gem is simple, and does not contain any administrative UI.

Usage
-------

To install propensity, add the following to your Gemfile

```
gem 'propensity', git: "https://github.com/entropillc/propensity.git"
```

Note that I use Ruby 1.9.x syntax above, because it rocks, and the code uses 1.9.3 conventions. Once your Gemfile is updated make sure you install your new bundle

```
bundle install
```

After bundling, you're ready to run the installation generator

```
  rails g propensity:install
```

Running the installer will copy the migrations in to your db/migrations folder and add an app_configuration.rb file to your models folder. Within app_configuration.rb you will specify your preferences.

There is one piece of magic that isn't completed yet that will require you to initialize Propensity on application startup. To do this, add the following code in your application.rb file:

```
# Initializing MyApplications Application Settings
initializer "application.environment", :before => :load_config_initializers do |app|
  config.my_application = Propensity::Environment.new
  MyApplication::Config = config.my_application.preferences
end
```