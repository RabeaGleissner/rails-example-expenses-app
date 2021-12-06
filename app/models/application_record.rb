class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true
  PgSearch.multisearch_options = {
    :using => {
      :tsearch => {:prefix => true, :dictionary => "english"}
    }
  }
end
