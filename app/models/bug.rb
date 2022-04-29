# frozen_string_literal: true
# Bug_validation_association
class Bug < ApplicationRecord
  belongs_to :project
  validates :title, presence: true, uniqueness: true
  validates :type, presence: true, inclusion: { in: %w[feature bug] }
  validates :status, presence: true, inclusion: { in: %w[new started resolved] }

  STATUS_OPTIONS = [
    ['New', 'new'],
    ['Started', 'started'],
    ['Resolved', 'resolved']
  ]

  TYPE_OPTIONS = [
    ['Feature', 'feature'],
    ['Bug', 'bug']
  ]
end
