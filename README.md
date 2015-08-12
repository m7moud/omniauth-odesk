# omniauth-upwork
Upwork Developer API OAuth 1.0 Strategy for OmniAuth.

Supports the OAuth 1.0 server-side and client-side flows. Read the [Upwork Developer API docs](https://developers.upwork.com/#authentication_oauth-10) for more details.

## Installing
Add to your `Gemfile`:

```ruby
gem 'omniauth-upwork'
```

Then `bundle install`.

## Usage
`OmniAuth::Strategies::Upwork` is simply a Rack middleware.Read the [OmniAuth 1.0](https://github.com/intridea/omniauth) and [OAuth 2.0](https://github.com/intridea/oauth2) docs for detailed instructions

Here's a quick example, adding the middleware to a Rails app in `config/initializers/omniauth.rb`:

```ruby
Rails.application.config.middleware.use OmniAuth::Builder do
  provider :upwork, ENV['UPWORK_CONSUMER_KEY'], ENV['UPWORK_CONSUMER_SECRET']
end
```

## Auth Hash
Here's an example [Auth Hash](https://github.com/intridea/omniauth/wiki/Auth-Hash-Schema) available in `request.env['omniauth.auth']`:

```ruby
{
  :provider => 'upwork',
  :uid => '1234567',
  :info => {
    first_name: 'First Name',
    last_name: 'Last Name',
    email: 'email@upwork.com',
    status: 'active',
    profile_key: 'profile_key'
  },
  :credentials => {
    :token => 'ABCDEF...', # access token, which you may wish to store
    :secret => '1321747205', # access token secret
  },
  :extra => {
    :raw_info => {
        id: "4124672",
        status: "active",
        timezone: "UTC+02:00 Eastern Europe",
        timezone_offset: "10800"
        public_url: 'https://www.upwork.com/users/~~kyad0112d885630b',
        last_name: 'Novozhylov',
        email: 'myemail@upwork.com',
        reference: "12345",
        first_name: "Maksym",
        profile_key: "~~kyad0112d885630b",
        is_provider: '1'
  }
}
```

## License
Copyright (c) 2013 by Jignesh Gohel

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
