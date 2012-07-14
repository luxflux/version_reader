# version_reader

Small Gem to read your version file.

## Usage

Assuming you have a file ~/CoolApp/VERSION with the content of ```0.4.2\n```.

```ruby
    require 'version_reader'

    version_reader = VersionReader.new('~/CoolApp/VERSION')
    version_reader.normal # 0.4.2
```
