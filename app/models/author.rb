# frozen_string_literal: true

class Author < ApplicationRecord
  has_many :books, dependent: :destroy
  validates :name, presence: true
  validates_each :name do |record, attr, value|
    record.errors.add(attr, 'must start with upper case') if value =~ /\A[[:lower:]]/
  end

  around_update :save_update_for_draft

  before_validation do
    puts 'Before Author Validation'
  end
  after_validation do
    puts 'After Author Validation'
  end

  after_initialize do |_author|
    puts 'You have initialized an Author object!'
  end

  after_find do |_author|
    puts 'You have found an Author object!'
  end

  before_save do |_author|
    puts 'Before Author Save'
  end

  after_save do |_author|
    puts 'After Author Save'
  end

  before_create do
    puts 'Before Author Creation'
  end

  after_create do
    puts 'After Author Creation'
  end

  after_touch do
    puts 'You have touched an Author object'
  end

  before_destroy do
    puts 'Before Author Destroy'
  end

  after_destroy do
    puts 'Books Destroyed'
    puts 'Author Destroyed'
  end

  after_commit :printcommit

  private

  def printcommit
    puts 'Committed Author'
  end

  def save_update_for_draft
    # do some "before_create" stuff here
    puts 'Before Author Update'
    yield # this makes the save happen

    # do some "after_create" stuff here
    puts 'After Author Update'
  end
end
