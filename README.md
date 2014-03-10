# NokiaMusic

A simple ruby wrapper around the Nokia Music API

## Installation

Add this line to your application's Gemfile:

    gem 'nokia_music'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install nokia_music

## Usage

Set your client_id:

    NokiaMusic.client_id = ""

Search for music:

    tracks = NokiaMusic.search("Knights of Cydonia", NokiaMusic::Product::TRACK)
    
Get either an artist, album, track, or single from an ID

    product = NokiaMusic.product(tracks.items.first.id)

Get a track sample from an ID:

    preview = NokiaMusic.product_sample(id)

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
