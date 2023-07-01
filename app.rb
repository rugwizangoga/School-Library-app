require_relative 'book'
require_relative 'student'
require_relative 'teacher'
require_relative 'rental'

class App
  attr_accessor :people, :rentals, :books

  def initialize
    @people = []
    @rentals = []
    @books = []
  end

  def display_book_list
    if @books.empty?
      puts 'The book list is empty.'
    else
      @books.each_with_index do |book, index|
        puts "#{index} - Title: #{book.title.capitalize}, Author: #{book.author.capitalize}"
      end
    end
  end

  def display_people_list
    if @people.empty?
      puts 'The person list is empty.'
    else
      @people.each_with_index do |person, index|
        person_type = person.instance_of?(Teacher) ? '[Teacher]' : '[Student]'
        puts "#{index} #{person_type} Name: #{person.name}, ID: #{person.id}, Age: #{person.age}"
      end
    end
  end

  def create_person
    print 'Do you want to create a student (1) or a teacher (2)? [input the number]: '
    type = gets.chomp
    case type
    when '1'
      create_student
    when '2'
      create_teacher
    else
      puts 'Invalid selection'
    end
  end

  def create_teacher
    print 'Age: '
    age = gets.chomp
    print 'Name: '
    name = gets.chomp
    print 'Specialization: '
    specialization = gets.chomp
    parent_permission = true
    @people.push Teacher.new(age, specialization, parent_permission: parent_permission, name: name)
    puts 'Person created successfully'
  end

  def create_student
    print 'Name: '
    name = gets.chomp
    print 'Age: '
    age = gets.chomp.to_i
    print 'Has parent permission? [y/n]: '
    permission = gets.chomp.downcase
    parent_permission = permission == 'y'
    @people.push Student.new(age, parent_permission: parent_permission, name: name)
    puts 'Person created successfully'
  end

  def create_book
    print 'Title: '
    title = gets.chomp
    print 'Author: '
    author = gets.chomp
    book = Book.new(title, author)
    @books.push(book)
    puts 'Book created successfully'
  end

  def create_rental
    puts 'Select a book from the following list by number:'
    display_book_list
    book_index = gets.chomp.to_i
    rented_book = @books[book_index]

    puts 'Select a person from the following list by number (not ID):'
    display_people_list
    person_index = gets.chomp.to_i
    renter = @people[person_index]

    print 'Date (YYYY-MM-DD): '
    date = gets.chomp

    if renter.can_use_services?
      @rentals.push(Rental.new(date, rented_book, renter))
      puts 'Rental created successfully'
    else
      puts 'The person lacks borrowing permissions'
    end
  end

  def rental_list
    print 'ID of person: '
    renter_id = gets.chomp.to_i
    renter = @people.find { |person| person.id == renter_id }

    if renter.nil?
      puts 'No rentals found'
    else
      renter.rentals.each do |rental|
        puts "#{rental.date}, Book: #{rental.book.title}, by #{rental.book.author}"
      end
    end
  end
end
