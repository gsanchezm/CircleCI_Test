require_relative '../../../features/support/controller'

class RegisterPage < Controller

  def type_first_last_screen
    first = 'User'
    last = 'Test'
    screen = first + last + rand(99999).to_s
    type_on_element('edit_name_first', first)
    type_on_element('edit_name_last', last)
    type_on_element('edit_username', screen)
    wait(3)
    File.open('random_user.txt', 'a') do |line|
      line.puts('First Name: ' + first + '  Last Name: ' + last + ' Screen Name: ' + screen + "\n" + "\n")
    end
    tap(994.9, 1724.8, 1)
    wait(3)
  end

  def first_name_field_displayed?
    element_displayed?('edit_name_first')
  end

  def last_name_field_displayed?
    element_displayed?('edit_name_last')
  end

  def screen_name_field_displayed?
    element_displayed?('edit_username')
  end

  def first_name_displayed?(text)
    text.eql?('First Name') ? first_name_field_displayed? : element_displayed?(text)
  end

  def last_name_displayed?(text)
    text.eql?('Last Name') ? last_name_field_displayed? : element_displayed?(text)
  end

  def screen_name_displayed?(text)
    text.eql?('Screen Name') ? screen_name_field_displayed? : element_displayed?(text)
  end

  def company_code
    type_on_element('onboarding_edit_code', 'testcode123')
  end

  def employee_id
    tap(542.5, 279.1,1)
    wait(3)
    id = 'test' + rand(99999).to_s
    type_on_element('onboarding_edit_id', id)
  end

  def click_on_continue
    tap(994.9, 1724.8, 1)
    wait(2)
    click_on_element('btn_continue')
  end

  def day_picker(day)
    element('animator').find_elements(class_name: 'android.widget.ListView')[0]
        .find_elements(class_name: 'android.view.View')[0]
        .find_elements(class_name: 'android.view.View')[day.to_i - 1].click
  end

  def select_from_list(value)
    click_on_element('date_picker_year')
    3.times {Appium:: TouchAction.new.swipe(start_x: 0.5, start_y: 0.5, end_y: 0.2, duration:600).perform}

    until exists{ text(value)} do
      Appium:: TouchAction.new.swipe(start_x: 0.5, start_y: 0.5, end_y: 0.8, duration:600).perform
    end
    text(value).click
  end

  def type_weight(weight)
    el1 = find_element(:xpath, "/hierarchy/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.support.v4.view.ViewPager/android.widget.FrameLayout[1]/android.widget.FrameLayout/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.ScrollView/android.widget.LinearLayout/android.widget.FrameLayout[3]/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.RelativeLayout/android.widget.EditText")
    el1.send_keys(weight)
  end

  def select_height(ft, inch)
    searchField = find_element(:xpath, "/hierarchy/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.support.v4.view.ViewPager/android.widget.FrameLayout[1]/android.widget.FrameLayout/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.ScrollView/android.widget.LinearLayout/android.widget.FrameLayout[4]/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.RelativeLayout/android.widget.RelativeLayout/android.widget.EditText")
    searchField.click

    actual_value = find_elements(id: 'numberpicker_input')
    actual_value.each do
      until (element('numberpicker_input').text).eql?ft  do
        Appium:: TouchAction.new.swipe(start_x: 0.4, start_y: 0.5, end_y: 0.4, duration:600).perform
      end
    end

    actual_value = elements('numberpicker_input')[1]
    #actual_value.text

    until actual_value.text.eql?inch do
      Appium:: TouchAction.new.swipe(start_x: 0.6, start_y: 0.5, end_y: 0.4, duration:600).perform
    end

    ok_btn = find_element(:id, "com.hubbubhealth.m:id/buttonDefaultPositive")
    ok_btn.click
  end

  def hubbub360
    Appium:: TouchAction.new.swipe(start_x: 0.9, start_y: 0.8, end_x:0.1, end_y: 0.8, duration:900).perform
    until  (element('h360q_text').text).eql?'Page 13 of 14'
      click_on_element('choice_text')
      Appium:: TouchAction.new.swipe(start_x: 0.9, start_y: 0.8, end_x:0.1, end_y: 0.8, duration:900).perform
    end
    wait(2)
    click_on_element('action_done')
  end
end