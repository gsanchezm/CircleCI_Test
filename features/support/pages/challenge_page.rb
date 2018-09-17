require_relative '../controller'

class ChallengePage < Controller
  def challenge_tab(tab)
    wait(2)
    element(tab).click
  end

  def select_fist_bump_challenge
    get_elements_inside_element('feed_page_list', 'android.widget.LinearLayout').each do |element|
      element.find_elements(id: 'feed_item_content')[0].find_elements(id: 'feed_item_buttons')[0].find_element(id: 'feed_item_fistbump').click
    end
  end

  def enter_completed(number)
    type_on_element('edit_answer', number)
  end

  def type_comment(comment)
    type_on_element('edit_comment', comment)
    tap(994.9, 1724.8, 1)
  end

  def check_in
    tap(38, 807, 1)
    wait(3)
    tap(538, 1680, 1)
    wait(3)
  end

  def quit_challenge
    wait(3)
    click_on_element('action_quit')
    wait(2)
    click_on_element('buttonDefaultPositive')
  end

  def click_on_coach(coach_name)
    3.times {Appium:: TouchAction.new.swipe(start_x: 0.5, start_y: 0.2, end_y: 0.5, duration:600).perform}

    until exists{ text(coach_name)} do
      Appium:: TouchAction.new.swipe(start_x: 0.5, start_y: 0.8, end_y: 0.5, duration:600).perform
    end
    text(coach_name).click
  end

end