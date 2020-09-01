require_relative 'db_connection'
require 'active_support/inflector'
require "byebug"
# NB: the attr_accessor we wrote in phase 0 is NOT used in the rest
# of this project. It was only a warm up.


class SQLObject
  # @@tables_queried = {}
  def self.columns
    return @columns if @columns
   hash =  DBConnection.execute2(<<-SQL) 
      SELECT 
        *
      FROM
      #{self.table_name}
    SQL
    @columns = hash[0].map { |key|  key.to_sym }
  end
    
  def self.finalize!
    self.columns.each do |sym|
      define_method(sym) do
         self.attributes[sym]
      end
      define_method("#{sym}=") do |value|
         self.attributes[sym] = value
      end 
    end 
      
  end

  def self.table_name=(table_name)
    @table_name
  end

  def self.table_name
    "#{self}s".downcase
  end

  def self.all
    # ...
  end

  def self.parse_all(results)
    # ...
  end

  def self.find(id)
    # ...
  end

  def initialize(params = {})
    # ...
  end

  def attributes
    @attributes ||= {}
  end

  def attribute_values
    # ...
  end

  def insert
    # ...
  end

  def update
    # ...
  end

  def save
    # ...
  end
end
