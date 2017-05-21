require_relative 'entry'
require "csv"

class AddressBook
  attr_reader :entries

  def initialize
    @entries = []
  end

  def add_entry(name, phone_number, email)
    index = 0
    entries.each do |entry|
      break if name < entry.name
      index += 1
    end
    entries.insert(index, Entry.new(name, phone_number, email))
  end

  def remove_entry(name, phone_number, email)
    index = 0
    entries.each do |entry|
      break if name == entry.name
      index += 1
    end
    entries.delete_at(index)
  end

  def import_from_csv(file_name)
    csv_text = File.read(file_name)
    csv = CSV.parse(csv_text, headers: true, skip_blanks: true)
    csv. each { |row| row_hash = row.to_hash
      add_entry(row_hash["name"], row_hash["phone_number"], row_hash["email"])}
  end

  def binary_search(name)
    lower = 0
    upper = entries.length - 1
    while lower <= upper
      mid = (lower + upper) / 2
      mid_name = entries[mid].name
      name == mid_name ? (return entries[mid]) : (name < mid_name ? upper = mid - 1 : lower = mid + 1)
    end
    return nil
  end

  def iterative_search(name)
    entries.each do |entry|
        name == entry.name ? (return entry) : next
    end
    return nil
  end

end
