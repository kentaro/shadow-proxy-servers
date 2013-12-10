#!/usr/bin/env ruby

require 'kage'

Kage::ProxyServer.start do |server|
  server.port  = 8080
  server.debug = false

  server.add_master_backend(:production, '127.0.01', 8081)
  server.add_backend(:sandbox, '127.0.01', 8082)

  server.on_select_backends do |request, headers|
    [:production, :sandbox]
  end
end
