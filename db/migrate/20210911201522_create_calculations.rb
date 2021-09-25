class CreateCalculations < ActiveRecord::Migration[6.1]
  def change
    create_table :calculations do |t|
      t.references :bank
      t.float :interest_rate
      t.float :initial_loan
      t.float :down_payment
      t.integer :loan_term
      t.float :monthly_payment

      t.timestamps
    end
  end
end
