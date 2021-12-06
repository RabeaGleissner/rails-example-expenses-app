class ExpenseReport < ApplicationRecord
  include PgSearch::Model
  pg_search_scope :search_reports,
    against: [ :title, :items, :approved, :date ],
    using: {
      tsearch: { prefix: true } # partial words allowed
    }
end
