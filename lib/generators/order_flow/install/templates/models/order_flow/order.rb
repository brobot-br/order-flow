# frozen_string_literal: true

module OrderFlow
  class Order < ApplicationRecord
    include OrderFlow::OrderHistory

    belongs_to :order, optional: true, class_name: 'OrderFlow::Order', foreign_key: :order_flow_order_id
    has_many :stages, foreign_key: :order_flow_order_id
    has_many :items, foreign_key: :order_flow_order_id
    has_many :events, foreign_key: :order_flow_order_id
    alias_attribute :order_id, :order_flow_order_id
  end
end
