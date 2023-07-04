require_relative 'app'

class Menu
  def initialize(app)
    @app = app
  end

  def display
    puts 'Please choose an option by entering a number'
    puts '1 - List all books'
    puts '2 - List all people'
    puts '3 - Create a person'
    puts '4 - Create a book'
    puts '5 - Create a rental'
    puts '6 - List all rentals for a given person id'
    puts '7 - Exit'
    puts ''
    print 'Enter number: '
  end

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
