require 'toc'

class Tabbit
  # When Tabbit.new is called, takes a undefined amount of headers to add
  # to the table.

  # Table initialized as an Array
  def initialize(*headers)
    @table = [[]]
    headers.each { |h| @table[0].push h }
  end

  # Adds line to @table in form of Array
  def add_line(*items)
    line = []
    items.each { |i| line.push i }
    @table.push line
  end

  # Changes @table Array into format for printing to console.
  def to_s
    # Set instance variables for maximum length of each column
    @table[0].length.times do |n|
      self.instance_variable_set "@max_length_#{n}", 0.0
      # Finds the longest string in column n and assign it to @max_length_n.
      @table.each do |line|
        if line[n].length >  self.instance_variable_get("@max_length_#{n}")
          self.instance_variable_set "@max_length_#{n}", line[n].length.to_f
        end
      end
    end

    divider '=', @table, new_line: true

    # Write headers
    @table[0].length.times do |n|
      max_len = self.instance_variable_get("@max_length_#{n}")
      difference = max_len - @table[0][n].length + 2

      if @table[0][n] == @table[0].last
        puts '|' + (' ' * 2) + @table[0][n].bold.red + (' ' * difference) + '|'
      else
        print '|' + (' ' * 2) + @table[0][n].bold.red + (' ' * difference)
      end
    end

    divider '=', @table, new_line: true

    # Write the table body, amount of spaces depends on the maximum length of
    # that column.
    @table.length.times do |n|
      unless n == 0
        line = @table[n]
        line.length.times do |i|
          item = line[i]
          max_len_of_column = self.instance_variable_get("@max_length_#{i}")
          difference2 = max_len_of_column - item.length + 2 # Spaces needed after item in column.
          if item == line.last
            puts '|' + (' ' * 2) + item + (' ' * difference2) + '|'
          else
            print '|' + (' ' * 2) + item + (' ' * difference2)
          end
        end
      end
    end

    divider '=', @table
  end

  private

  # Takes the table being passed and calculates the width of the full table to write the divider.
  def divider(split, table, options = {})
    total_title_length = 0
    table[0].length.times { |n| total_title_length += self.instance_variable_get("@max_length_#{n}") }
    statement = split * ((table[0].length * 5) + total_title_length + 1)

    options[:new_line] ? puts(statement) : print(statement)
  end
end
