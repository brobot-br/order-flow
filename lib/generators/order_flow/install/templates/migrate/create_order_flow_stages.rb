# frozen_string_literal: true

class CreateOrderFlowStages < ActiveRecord::Migration[6.1]
  def change
    create_table :order_flow_stages do |t|
      t.string :name
      t.string :description
      t.integer :status, null: false, default: 0

      t.float :weight, null: false, default: 0.0
      t.integer :index, null: false, default: 0
      t.jsonb :attr, default: {}

      t.boolean :stage_valid, null: false, default: true
      t.references :order_flow_order, null: false, foreign_key: true
      t.timestamps
    end

    add_index :order_flow_stages,
              %i[order_flow_order_id stage_valid index],
              unique: true,
              name: :i_order_flow_stages_on_order_flow_order_id_and_valid_and_index
  end
end
