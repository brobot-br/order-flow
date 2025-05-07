# frozen_string_literal: true

class CreateOrderFlowItems < ActiveRecord::Migration[6.1]
  def change
    create_table :order_flow_items do |t|
      t.integer :status, null: false, default: 0
      t.jsonb :data, default: {}
      t.jsonb :attr, default: {}
      t.references :order_flow_order, null: false, foreign_key: true
      t.references :order_flow_stage, foreign_key: true

      t.timestamps
    end
  end
end
