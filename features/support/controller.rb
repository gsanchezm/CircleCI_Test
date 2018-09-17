class Controller

  def select_from_spinner(value,option)
    element(value).click #First click to select the element by class and deploys an option list
    element(option).click #Second click to select an option from the list according to the "option"" parameter
  end

  def element_displayed?(value)
    element(value).displayed?
  end

  def click_on_element(value)
    element(value).click
  end

  def type_on_element(value, text)
    element(value).send_keys(text)
  end

  def tap(x, y, count)
    Appium::TouchAction.new.tap(x: x, y: y, count: count).perform
  end

  def wait(time)
    sleep(time)
  end

  def get_all_elements(value)
    elements(value)
    puts 'Elements Found: ' + elements(value).size.to_s
  end

  def get_elements_inside_element(value1, value2)
    set_wait(1)
    element(value1).find_elements(class_name: value2)
  rescue
    element(value1).find_elements(id: value2)
  rescue
    element(value1).find_elements(acceessibility_id: value2)
  end

  def take_screenshot
    FileUtils.mkdir_p('custom_screenshots') unless File.directory?('custom_screenshots')

    time_stamp = Time.now.strftime('%Y-%m-%d_%H.%M.%S')
    screenshot_name = time_stamp + '.png'
    screenshot_file = File.join('custom_screenshots', screenshot_name)
    $driver.screenshot(screenshot_file)
    embed(screenshot_file.to_s, 'image/png')
  rescue
    puts 'Screenshot taked'

  end

  # Single element
  def element(value)
    set_wait(0.1)
    text(value)
  rescue
    element_by_id(value)
  end

  # Multiple elements
  def elements(value)
    set_wait(1)
    find_elements(id: value)
  rescue
    elements_by_content_desc(value)
  end

  private

  # Single element
  def element_by_id(value)
    find_element(id: value)
  rescue
    element_by_content_desc(value)
  end

  def element_by_content_desc(value)
    find_element(acceessibility_id: value)
  rescue
    element_by_class(value)
  end

  def element_by_class(value)
    find_element(class_name: value)
  rescue
    puts 'Element not found'
  end

  # Multiple elements
  def elements_by_content_desc(value)
    find_elements(acceessibility_id: value)
  rescue
    elements_by_class(value)
  end

  def elements_by_class(value)
    find_elements(class_name: value)
  rescue
    puts 'Elements not found'
  end

end