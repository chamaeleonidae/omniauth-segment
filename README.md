# OmniAuth Segment

Segment OAuth2 Strategy for OmniAuth.

Read about this in more details in their [OAuth docs](https://segment.com/docs/partners/enable-with-segment/).

## Installing

Add to your `Gemfile`:

```ruby
gem 'omniauth-segment'
```

Then `bundle install`.

## Usage

`OmniAuth::Strategies::Segment` is simply a Rack middleware. Read the OmniAuth docs for detailed instructions: https://github.com/intridea/omniauth.

Here's a quick example, adding the middleware to a Rails app in `config/initializers/omniauth.rb`; replace `YOUR_INTEGRATION_NAME`:

```ruby
Rails.application.config.middleware.use OmniAuth::Builder do
  provider :segment, ENV['OAUTH_SEGMENT_KEY'], ENV['OAUTH_SEGMENT_SECRET'], scope: 'destination/<YOUR_INTEGRATION_NAME>'
end
```

To start the authentication process with Segment you simply need to access `/auth/segment` route.


## Auth Hash

Here's an example *Auth Hash* available in `request.env['omniauth.auth']`:

```ruby
{
  :provider => 'segment',
  :uid => 'installs/31',
  :info => {
    :app_name => 'apps/13',
    :install_name => 'installs/31',
    :workspace_names => ['workspaces/your-product'],
    :source_names => ['workspaces/your-product/sources/javascript'],
  },
  :credentials => {
    :token => 'YL8a0w-Boz1EgZgmD2ELZvsxakjqSMwO8xe7tV-ToSk.nKaLX2QHocqalHR3O4BdoYdcopk3hjW4izYHMG14cxQ',
    :expires => false
  },
  :extra => {
  }
}
```
