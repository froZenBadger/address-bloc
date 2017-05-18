require_relative 'entry'

class AddressBook
  attr_reader :entries

  def initialize
    @entries = []
  end

  def add_entry(name, phone_number, email)
    index = 0
    entries.each { |entry| break if name < entry.name
      index += 1 }
    entries.insert(index, Entry.new(name, phone_number, email))
  end

  def remove_entry(name, phone_number, email)
    index = 0
    entries.each { |entry| break if name == entry.name
      index += 1 }
    entries.delete_at(index)
  end
end
