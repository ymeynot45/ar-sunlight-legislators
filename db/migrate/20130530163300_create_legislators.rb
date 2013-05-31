require_relative '../config'
puts "migration loaded"


class CreateLegislators < ActiveRecord::Migration
  def change
    puts 'running change'
    create_table :legislators do |t|
      t.string :name
      t.string :email
      t.string :phone
      t.string :fax
      t.string :website
      t.string :webform
      t.string :party
      t.string :gender
      t.date   :birthdate
      t.string :twitter_id
    end
  end
end
