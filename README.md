# version_reader

Small Gem to read your version file.

## Usage

Assuming you have a file ~/CoolApp/VERSION with the content of ```0.4.2\n```.

```ruby
require 'version_reader'

version_reader = VersionReader.new('~/CoolApp/VERSION')
version_reader.normal # 0.4.2
```

### Rails integration

If you add this gem to your Gemfile of a Rails application it will
automatically define ```CoolApp::Application.version``` and fill in a VersionReader instance.

It will also load some Rails specific version format.

#### Rails Env
<table>
  <tr>
    <th></th>
    <th>Test</th>
    <th>Development</th>
    <th>Production</th>
    <th>$OtherEnvironment (e.g. staging)</th>
  </tr>
  <tr>
    <td>
      ```ruby CoolApp::Application.version.rails_env```
    </td>
    <td>0.4.2-test</td>
    <td>0.4.2-development</td>
    <td>0.4.2-production</td>
    <td>0.4.2-staging</td>
  </tr>
  <tr>
    <td>
      ```ruby CoolApp::Application.version.rails_env_without(:production)```
    </td>
    <td>0.4.2-test</td>
    <td>0.4.2-development</td>
    <td>0.4.2</td>
    <td>0.4.2-staging</td>
  </tr>
  <tr>
    <td>
      ```ruby CoolApp::Application.version.rails_env_without(:production,:staging)```
    </td>
    <td>0.4.2-test</td>
    <td>0.4.2-development</td>
    <td>0.4.2</td>
    <td>0.4.2</td>
  </tr>
</table>
