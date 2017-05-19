require_relative '../models/address_book'

class MenuContoller
  attr_reader :address_book

  def initialize
    @address_book = AddressBook.new
  end

  def main_menu
    puts "Main Menu #{address_book.entries.count} entries"
    puts "1 - View all entries"
    puts "2 - Create an entry"
    puts "3 - Search for an entry"
    puts "4 - Import entries  for an entry"
    puts "5 - View Entry Number n"
    puts "6 - Exit"
    puts "Enter your selection: "

    selection = gets.to_i

    case selection
      when 1
        system "clear"
        view_all_entries
        main_menu
      when 2
        system "clear"
        create_entry
        main_menu
      when 3
        system "clear"
        search_entries
        main_menu
      when 4
        system "clear"
        read_csv
        main_menu
      when 5
        system "clear"
        print "Entry number: "
        users_num = Integer(gets) rescue false
        view_entry_n(users_num) if users_num
        puts "Sorry, that is not a valid input" if(!users_num)
        main_menu
      when 6
        puts "Good-bye!"
        # #8
        exit(0)
      # #9
      else
        system "clear"
        puts "Sorry, that is not a valid input"
        main_menu
    end
  end

  def view_all_entries
    address_book.entries.each { |entry| system "clear"
      puts entry.to_s
      entry_submenu(entry)}

    system "clear"
    puts "End of entries"
  end

  def view_entry_n(n)
    puts address_book.entries[n-1].to_s if n <= address_book.entries.count
    puts "Sorry, there are not that many entries in the address book, add more!" if n > address_book.entries.count
  end

  def create_entry
    system "clear"
    puts "New Address Book entry"

    print "Name: "
    name = gets.chomp
    print "Phone number: "
    phone_number = gets.chomp
    print "Email: "
    email = gets.chomp

    address_book.add_entry(name, phone_number, email)
    system "clear"
    puts "New entry created"
  end

  def search_entries
  end

  def read_csv
  end

  def entry_submenu(entry)
    puts "n - next entry"
    puts "d - delete entry"
    puts "e - edit this entry"
    puts "m - return to main menu"

    selection = gets.chomp

    case selection
      when "n"
      when "d"
      when "e"
      when "m"
        system "clear"
        main_menu
      else
        system "clear"
        puts "#{selection} is not a valid input"
        entry_submenu(entry)
    end
  end

end
