require 'omniauth-oauth2'

module OmniAuth
  module Strategies
    class Segment < OmniAuth::Strategies::OAuth2
      option :name, 'segment'

      args [:client_id, :client_secret]

      option :client_options, {
        site: 'https://segment.com',
        authorize_url: 'https://id.segmentapis.com/oauth2/auth',
        token_url: 'https://id.segmentapis.com/oauth2/token'
      }

      option :auth_token_params, {
        response_type: 'code'
      }

      uid { access_token['install_name'] } # uniquely identifies *this* OAuth flow, called an install in Segment

      info do
        {
          app_name: access_token['app_name'],
          install_name: access_token['install_name'],
          workspace_names: access_token['workspace_names'],
          source_names: access_token['source_names'],
        }
      end


      def callback_url
        ENV['OAUTH_SEGMENT_CALLBACK_URL'] || (full_host + script_name + callback_path)
      end
    end
  end
end
