class CreateBanks < ActiveRecord::Migration[6.1]
  def change
    create_table :banks do |t|
      t.string :name
      t.float :interest_rate
      t.float :max_loan
      t.float :min_down_payment
      t.integer :loan_term

      t.timestamps
    end
  end
end
