class MyCompany
  attr_accessor :driver

  def initialize(driver)
    @driver = driver
  end

  def button_click(text)
    @driver.text(text).click
  end

  def cornet_button_displayed
    @drive.find_element(id: 'action_filter').displayed?
  end
  def cornet_buttons_displayed(text)
    if text.eql?('Beginner')
      beginner_button_displayed
    elsif text.eql?('Intermediate')
      intermediate_button_displayed
    elsif text.eql?('Advanced')
      advanced_button_displayed
    elsif text.eql?('Coached')
      coached_button_displayed
    else
      button_displayed text
    end
  end
  def my_company_options(opt)
    option_array = find_elements(class_name: 'android.support.v7.app.ActionBar$Tab')
    option_array.each_with_index { |element, index| options_index(opt, element, index) }
  end

  def options_index(opt, element, index)
    case opt
      when 'All'
        element.click if index == 0
      when 'Newest'
        element.click if index == 1
      when 'Popular'
        element.click if index == 2
      else
        puts 'Change order'
    end
  end
  def arrow_displayed
    @driver.find_element.class(  :'android.widget.ImageButton').displayed?
  end
end
