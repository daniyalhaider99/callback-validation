# frozen_string_literal: true

class AddForeignKey < ActiveRecord::Migration[7.0]
  def change
    change_table :books do |t|
      t.belongs_to :author, foreign_key: true
    end
  end
end
