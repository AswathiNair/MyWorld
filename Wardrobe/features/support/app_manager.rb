#frozen_string_literal: true
require 'calabash-android/cucumber'
require 'calabash-android/operations'
require 'socket'
require 'calabash-android/abase'
require 'rexml/document'
require 'Nokogiri'
include REXML

# App manager
class AppManager
  include Singleton
  include Calabash::Android::Operations

   attr_accessor :active_app
  #
  def initialize
    @apps = {}
    @app_ports = {}
    @sideloaded_apps = []
  end

  def configure_device_app(app_name)
    unless @apps.include? app_name
      puts "Creating a new device for app #{app_name}"

      app_path = File.expand_path("./features/apps/#{app_name}.apk")
      test_server_path = File.expand_path("./features/apps/#{app_name}_test server.apk")
    end
    puts "Activating #{app_name}"
    #set_default_device(@apps[app_name])
  end

  def launch_app(app_name)
    @active_app = app_name.to_s
    puts "I launch app:  #{@active_app}"
    sleep 5
    configure_device_app(app_name)

    begin
     # start_test_server_in_background
    rescue
      begin
        puts 'Start test server failed. Restore test server ....'
        @apps.delete app_name
        configure_device_app(app_name)
        # start_test_server_in_background
      rescue
        puts 'Restoring test server failed. Reinstall apps ....'
        @apps.delete app_name
        #custom_uninstall_app(app_name)
        custom_install_app(app_name)
        # start_test_server_in_background
      end
    end

    puts "#{@active_app} launched!!"
  end


  def custom_install_app(app_name)
    # if app_name == 'all apps'
      @apps.each { |app| custom_install_app(app) }
  end

end

