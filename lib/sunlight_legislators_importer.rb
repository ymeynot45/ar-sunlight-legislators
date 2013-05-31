require 'csv'
require_relative '../app/models/legislator'

class SunlightLegislatorsImporter
  def self.import(filename)
    csv = CSV.new(File.open(filename), :headers => true)
    congress_critters = []
    csv.each do |row|
      congress_critters << {:name => "#{row[:firstname]} #{row[:lastname]}",
                       :email      => row[:email],
                       :phone      => row[:phone],
                       :fax        => row[:fax],
                       :website    => row[:website],
                       :webform    => row[:webform],
                       :party      => row[:party],
                       :gender     => row[:gender],
                       :birthdate  => row[:birthdate],
                       :twitter_id => row[:twitter_id],
                                                        }
    end
    Legislator.create!(congress_critters)
  end
end

# begin
#   raise ArgumentError, "you must supply a filename argument" unless ARGV.length == 1
#   SunlightLegislatorsImporter.import(ARGV[0])
# rescue ArgumentError => e
#   $stderr.puts "Usage: ruby sunlight_legislators_importer.rb <filename>"
# rescue NotImplementedError => e
#   $stderr.puts "You shouldn't be running this until you've modified it with your implementation!"
# end
