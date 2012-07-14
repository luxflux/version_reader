# version_reader

Small Gem to read your version file.

## Usage

Assuming you have a file ~/CoolApp/VERSION with the content of ```0.4.2\n```.

```ruby
require 'version_reader'

version_reader = VersionReader.new('~/CoolApp/VERSION')
version_reader.normal # 0.4.2
```

## Rails integration

If you add this gem to your Gemfile of a Rails application it will
automatically define ```CoolApp::Application.version``` and fill in a VersionReader instance.

It will also load some Rails flavor.

## Flavors

Flavors are an easy way to extend a VersionReader object with additional informations.

### Rails

The Rails flavor adds some additional methods which also show some information about the current Rails-Environment.

#### rails_env

Always adds the current Rails-Environment to the version. Maybe useful to see whether this is staging or not :)

```ruby
ruby CoolApp::Application.version.rails_env
```
Output would be ```0.4.2-development```.


#### rails_env_without

Adds the current Rails-Environment if it does not match one of the given environments.

```ruby
CoolApp::Application.version.rails_env_without(:production,:staging)
```
 
Output would be ```0.4.2-development``` or ```0.4.2``` for staging and production.
 