# frozen_string_literal: true

module OrderFlow
  class Stage < ApplicationRecord
    belongs_to :order, class_name: 'OrderFlow::Order', foreign_key: :order_flow_order_id
  end
end
