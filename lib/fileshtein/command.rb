# coding: utf-8

require 'csv'
require 'levenshtein'

module Fileshtein
  class Command
    def self.run(argv)
      csv1 = File.open(argv[0]).read
      csv2 = File.open(argv[1]).read
      CSV.parse(csv1, headers: :first_for) do |row1|
        CSV.parse(csv2, headers: :first_for) do |row2|
          d = Levenshtein.distance(row1[argv[2]], row2[argv[2]])
          if d <= argv[3].to_i then
            puts row1
            puts row2
            puts "==="
          end
        end
      end
    end
  end
end
