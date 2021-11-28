class CreateExpenseReports < ActiveRecord::Migration[6.1]
  def change
    create_table :expense_reports do |t|
      t.string :title
      t.string :date
      t.text :items
      t.boolean :approved

      t.timestamps
    end
  end
end
