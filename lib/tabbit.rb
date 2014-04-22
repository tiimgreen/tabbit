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
  def add_row(*items)
    line = []
    items.each { |i| line.push i }
    @table.push line
  end

  # Changes @table Array into format for printing to console.
  def to_s
    @table[0].length.times do |n|
      self.instance_variable_set "@max_length_#{n}", 0.0

      # Finds the longest string in column
      @table.each do |line|
        if line[n].to_s.length >  self.instance_variable_get("@max_length_#{n}")
          self.instance_variable_set "@max_length_#{n}", line[n].length.to_f
        end
      end
    end

    divider '=', @table, new_line: true

    @table[0].length.times do |n|
      difference = self.instance_variable_get("@max_length_#{n}") - @table[0][n].to_s.length + 2

      cell = '|' + (' ' * 2) + @table[0][n].to_s.bold.red + (' ' * difference)
      @table[0][n] == @table[0].last ? puts(cell + '|') : print(cell)
    end

    divider '=', @table, new_line: true

    # Write the table body, amount of spaces depends on the maximum length of
    # that column.
    @table.length.times do |n|
      unless n == 0
        line = @table[n]
        line.length.times do |i|
          item = line[i]
          difference = self.instance_variable_get("@max_length_#{i}") - item.to_s.length + 2
          cell = '|' + (' ' * 2) + item.to_s + (' ' * difference)
          item == line.last ? puts(cell + '|') : print(cell)
        end
      end
    end

    divider '=', @table
  end

  def size
    @table.length - 1
  end

  private

  # Takes the table being passed and calculates the width of the full table to write the divider.
  def divider(char, table, options = {})
    total_title_length = 0
    table[0].length.times { |n| total_title_length += self.instance_variable_get("@max_length_#{n}") }
    statement = char * ((table[0].length * 5) + total_title_length + 1)

    options[:new_line] ? puts(statement) : print(statement)
  end
end
