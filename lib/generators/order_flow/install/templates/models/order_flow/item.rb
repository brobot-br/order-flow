# frozen_string_literal: true

module OrderFlow
  class Item < ApplicationRecord
    belongs_to :order, class_name: 'OrderFlow::Order'
    belongs_to :stage, class_name: 'OrderFlow::Stage', optional: true
  end
end
