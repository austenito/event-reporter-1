require 'csv'
require_relative 'entry'

class Container

  def self.load(file)
    data = CSV.open(file, headers: true, header_converters: :symbol)
    rows = data.map do |row|
      Entry.new(row)
    end
    new(rows)
  end

  attr_reader :entries

  def initialize(entries)
    @entries = entries
  end

  def empty?
    entries.empty?
  end

  def find_by_first_name(name)
    entries.select { |entry| entry.first_name == name }
  end

  def find_by_last_name(name)
    entries.select { |entry| entry.last_name == name }
  end

  def find_by_state(state)
    entries.select { |entry| entry.state == state }
  end

  def find_by_zipcode(zipcode)
    entries.select { |entry| entry.zipcode == zipcode }
  end

  def find_by_city(city)
    entries.select { |entry| entry.city == city }
  end

end
