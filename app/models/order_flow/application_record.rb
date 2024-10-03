# frozen_string_literal: true

module OrderFlow
  class ApplicationRecord < ActiveRecord::Base
    self.abstract_class = true
  end
end
