class OpenChallenge
  attr_accessor :driver

  def initialize(driver)
    @driver = driver
  end

  def button_click(text)
    @driver.text(text).click
  end

  def my_company(text)
    @driver.text(text).click
  end

  def coached(text)
    @driver.text(text).click
  end

  def recomended(text)
    @driver.text(text).click
  end

  def move(text)
    @driver.text(text).click
  end

  def nourish(text)
    @driver.text(text).click
  end

  def balance(text)
    @driver.text(text).click
  end

  def mingle(text)
    @driver.text(text).click
  end

  def rewind(text)
    @driver.text(text).click
  end

  def prosper(text)
    @driver.text(text).click
  end
end