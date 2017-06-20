class Pages < BasePage

  def touch_fav_option
    wait_for_elements_exist "* id:'wishListFAB'"
    touch "* id:'wishListFAB'"
  end

  def touch_fav2_option
    wait_for_elements_exist "* id:'selector' index:1"
    touch "* id:'selector' index:1"
  end

end
