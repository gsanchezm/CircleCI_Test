require_relative '../controller'

class ProfilePage < Controller

  def goto_messages
    wait(3)
    tap(77,155,1)
    wait(2)
  end

  def open_message
    tap(500,290,1)
    wait(2)
  end

  def delete_message
    click_on_element('action_delete')
    wait(2)
    click_on_element('button1')
  end

  def tapuntapcheckbox
    tap(979,995,2)
  end

  def device_option(device_option)
    3.times {Appium:: TouchAction.new.swipe(start_x: 0.5, start_y: 0.2, end_y: 0.5, duration:400).perform}

    until exists{ text(device_option)} do
      Appium:: TouchAction.new.swipe(start_x: 0.5, start_y: 0.8, end_y: 0.5, duration:400).perform
    end
    click_on_element()
  end

end