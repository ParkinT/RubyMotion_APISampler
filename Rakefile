# -*- coding: utf-8 -*-
$:.unshift("/Library/RubyMotion/lib")
require 'motion/project'

require 'app_properties'
props = AppProperties.new

Motion::Project::App.setup do |app|
  app.frameworks += %w[AddressBookUI MessageUI]
  app.name = props.name
  app.identifier = props.identifier
  app.delegate_class = props.delegate
  app.version = props.version
  app.short_version = props.version #required to be incremented for AppStore (http://iconoclastlabs.com/cms/blog/posts/updating-a-rubymotion-app-store-submission)
  app.icons = ["#{app.name}.png", "#{app.name}-72.png", "#{app.name}@2x.png"]
  app.device_family = [:iphone, :ipad]
  app.interface_orientations = [:portrait, :landscape_left, :landscape_right] #:portrait_upside_down
end
