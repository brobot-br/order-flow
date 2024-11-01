# frozen_string_literal: true

module OrderFlow
  class Item < ApplicationRecord
    belongs_to :order, class_name: 'OrderFlow::Order', foreign_key: :order_flow_order_id
    belongs_to :stage, class_name: 'OrderFlow::Stage', optional: true, foreign_key: :order_flow_stage_id
    alias_attribute :order_id, :order_flow_order_id
  end
end
