# frozen_string_literal: true

module OrderFlow
  class Order < ApplicationRecord
    belongs_to :order, optional: true, class_name: 'OrderFlow::Order'
    has_many :stages, foreign_key: :order_flow_order_id
    has_many :items, foreign_key: :order_flow_order_id
    after_initialize { |order| order.uuid = generate_uuid }

    def percent
      stages.where(status: OrderFlow::Status::PROCESSED).average(:weight) || 0.0
    end

    private

    def generate_uuid
      UUID7.generate
    end
  end
end
