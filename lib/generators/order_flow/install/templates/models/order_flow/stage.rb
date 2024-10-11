# frozen_string_literal: true

module OrderFlow
  class Stage < ApplicationRecord
    belongs_to :order, class_name: 'OrderFlow::Order'
  end
end
