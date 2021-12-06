class ExpenseReport < ApplicationRecord
  include PgSearch::Model

  multisearchable against: [:title, :items, :approved]

  # The below code searches through this one model using the method called `search_reports`
  pg_search_scope :search_reports,
    against: [ :title, :items, :approved, :date ],
    using: {
      tsearch: { prefix: true } # use PostgreSQL's built in full text search and allow to search for partial words (more info: https://github.com/Casecommons/pg_search#tsearch-full-text-search)
    }
end
