# frozen_string_literal: true

class BaseFlow
  def initialize(order, target_stage_name = nil)
    @order = order
    @stage_name = target_stage_name || order.stage_name
  end

  def resolve(**input)
    raise NotImplementedError
  end

  def self.resolve(order, target_stage_name = nil, **input)
    new(order, target_stage_name).resolve(**input)
  end
end
