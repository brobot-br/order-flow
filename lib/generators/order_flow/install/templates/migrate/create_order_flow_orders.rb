# frozen_string_literal: true

class CreateOrderFlowOrders < ActiveRecord::Migration[6.1]
  def change
    create_table :order_flow_orders do |t|
      t.string :key, null: false
      t.string :uuid, null: false
      t.string :app_name, null: false

      t.string :requested_by, null: false
      t.string :created_by, null: false
      t.string :status, null: false, default: :unprocessed

      t.string :description
      t.string :kind
      t.string :stage_name
      t.string :searchable

      t.jsonb :input, default: {}
      t.jsonb :result, default: {}
      t.jsonb :attr, default: {}

      t.references :order_flow_order, foreign_key: true
      t.timestamps
    end

    add_index :order_flow_orders, :uuid
  end
end
