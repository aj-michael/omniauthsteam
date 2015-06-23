require 'json'
require 'omniauth-openid'
require 'uri'

module OmniAuth
  module Strategies
    class Steam < OmniAuth::Strategies::OpenID
      PROFILE_HOST = 'api.steampowered.com'
      PROFILE_PATH = '/ISteamUser/GetPlayerSummaries/v0002'

      args :client_id

      option :client_id, nil
      option :name, 'steam'
      option :identifier, 'http://steamcommunity.com/openid'

      info do
        @raw ||= JSON.parse(Net::HTTP.get(profile_uri))
        @raw['response']['players'].first
      end

      uid { steam_id }

      private

      def steam_id
        openid_response.display_identifier.split('/').last
      end

      def profile_uri
        URI.parse("http://#{PROFILE_HOST}#{PROFILE_PATH}/?steamids=" \
                  "#{steam_id}&key=#{options.client_id}")
      end
    end
  end
end
