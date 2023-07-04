require_relative 'app'

class Menu
  def initialize(app)
    @app = app
  end

  # display

  # handle_option
end

def main
  app = App.new
  menu = Menu.new(app)

  puts 'Welcome to the School Library App!'
  puts ''

  loop do
    menu.display
    option = gets.chomp

    if option == '7'
      puts 'Thank you for using this app!'
      break
    end

    menu.handle_option(option)
  end
end

main
