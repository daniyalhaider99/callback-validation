# frozen_string_literal: true

class Book < ApplicationRecord
  belongs_to :author, class_name: 'Author', foreign_key: 'author_id'

  after_initialize do |_book|
    puts 'You have initialized a book object!'
  end

  after_find do |_book|
    puts 'You have found a book object!'
  end

  before_save do |_book|
    puts 'Before Book Save'
  end

  after_save do |_book|
    puts 'After Book Save'
  end

  before_create do
    puts 'Before Book Creation'
  end

  after_create do
    puts 'After Book Creation'
  end

  after_touch do
    puts 'You have touched a Book object'
  end

  before_destroy do
    puts 'Before Book Destroy'
  end

  after_destroy do
    puts 'After Book Destroy'
  end

  after_commit :printcommit

  private

  def printcommit
    puts 'Committed Book'
  end
end
