# frozen_string_literal: true

module OrderFlow
  module OrderHistory
    extend ActiveSupport::Concern

    included do
      after_initialize :_default_value
    end

    def save(**options)
      _save(**options)
    end

    def save!(**options)
      _save(**options)
    end

    private

    def _save(**options)
      params = {
        mutation: changes,
        author: updated_by || created_by,
        created_at: DateTime.now,
        order: self
      }
      self.version += 1
      result = super(**options)
      OrderFlow::Event.create(params) if result && changes.present?
      result
    end

    def _default_value
      self.uuid ||= UUID7.generate
      self.status ||= OrderFlow::Status::UNPROCESSED
      self.version ||= 0
    end
  end
end
