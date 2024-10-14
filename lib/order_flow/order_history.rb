# frozen_string_literal: true

module OrderFlow
  module OrderHistory
    extend ActiveSupport::Concern

    included do
      after_initialize :_default_value
    end

    def save(**options)
      _save(**options) { super(**options) }
    end

    def save!(**options)
      _save(**options) { super(**options) }
    end

    private

    def _save(**options, &block)
      history_params = _history_params
      result = block.call(**options)
      OrderFlow::Event.create(history_params) if result && history_params.present?
      result
    end

    def _history_params
      return unless changes.present?

      self.version += 1
      {
        mutation: changes,
        author: updated_by || created_by,
        created_at: DateTime.now,
        order: self
      }
    end

    def _default_value
      self.uuid ||= UUID7.generate
      self.status ||= OrderFlow::Status::UNPROCESSED
      self.version ||= 0
    end
  end
end
