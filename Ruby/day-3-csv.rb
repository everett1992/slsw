#!/bin/env ruby


module ActsAsCsv
  include Enumerable
  def self.included(base)
    base.extend ClassMethods
  end

  module ClassMethods
    def acts_as_csv
      include InstanceMethods
    end
  end

  module InstanceMethods
    attr_accessor :headers, :csv_contents

    def read
      @csv_contents = []
      filename = self.class.to_s.downcase + '.txt'
      file = File.new(filename)
      @headers = file.gets.chomp.split(', ' )
      file.each do |row|
        @csv_contents << row.chomp.split(', ' )
      end
    end

    def initialize
      read
    end

    def each(&block)
      @csv_contents.map do |row|
        yield CsvRow.new @headers, row
      end
    end
  end
end

class CsvRow
  def initialize(headers, data)
    # Don't ask yourself who will let me, ask who will stop me.
    @data = Hash[*headers.zip(data).flatten]
  end

  def method_missing(name, *args)
    return @data[name.to_s]
  end
end

class RubyCsv # no inheritance! You can mix it in
  include ActsAsCsv
  acts_as_csv
end

csv = RubyCsv.new
csv.each { |row| puts row.one }
