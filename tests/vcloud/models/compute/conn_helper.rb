module Fog
  module Vcloud
    class Compute < Fog::Service
      class Real
        def request(params, &block)
          path = File.expand_path(File.join(File.dirname(__FILE__),'..','..','data',params[:path].gsub(/^\//,'').gsub('/','_+_')))
          if File.exists?(path)
            body = File.read(path)
          else
            ''
          end
          Excon::Response.new(
            :body   => body,
            :status => 200,
            :header => '')
        end
      end
    end
  end
end
