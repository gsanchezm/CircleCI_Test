require_relative '../controller'

class CheckInPage < Controller

  def select_mood_checkin(mood)
    case mood.downcase
    when 'good day!'
      check_in_good_day
    when 'bad day!'
      check_in_bad_day
    end
  end

  def check_in_good_day
    tap(505.3, 583.2, 1)
  end

  def check_in_bad_day
    tap(525.5, 687.2, 1)
  end

  def click_check_in
    tap(525.5, 1687.8, 1)
  end

end