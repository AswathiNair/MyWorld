Given(/^I install (.*)/) do |app_name|
  puts "I install #{app_name}"
  AppManager.instance.custom_install_app(app_name)
  # custom_install_app(app_name)
  end

And(/^I launch (.*)/)  do |app_name|
  puts "I launch #{app_name}"
  AppManager.instance.launch_app(app_name)
end


And(/^I access Home page$/) do
  puts "hello"
  page(Pages).touch_fav_option
  page(Pages).touch_fav2_option
end