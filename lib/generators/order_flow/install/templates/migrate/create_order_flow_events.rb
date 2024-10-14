# frozen_string_literal: true

class CreateOrderFlowEvents < ActiveRecord::Migration[6.1]
  def change
    create_table :order_flow_events do |t|
      t.string :author, null: false
      t.jsonb :mutation, default: {}
      t.timestamp :created_at, null: false
      t.references :order_flow_order, foreign_key: true, index: true, null: false
    end
  end
end
