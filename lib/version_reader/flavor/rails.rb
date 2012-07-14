class VersionReader
  module Flavor
    module Rails

      attr_writer :env

      def rails_env
        "#{version}-#{env}"
      end

      def rails_env_without(*environments)
        if environments.map { |env| env.to_sym }.include?(env)
          version
        else
          rails_env
        end
      end

      private
      def env
        (@env ||= Rails.env).to_sym
      end

    end
  end
end
