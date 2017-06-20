# # frozen_string_literal: true
# #require 'calabash-android/abase'

class BasePage
#
def wait_for_elements_exist(elements_arr, options={})
  if elements_arr.is_a?(String) || elements_arr.is_a?(Symbol)
    elements_arr = [elements_arr.to_s]
  end
  options[:timeout_message] = options[:timeout_message] || "Timeout waiting for elements: #{elements_arr.join(",")}"
  wait_for(options) do
    elements_arr.all? { |q| element_exists(q) }
  end
end
  end
