# frozen_string_literal: true

module OrderFlow
  module Status
    module_function

    UNPROCESSED = 0
    PROCESSING = 100
    PROCESSED = 200

    def status_name
      {
        UNPROCESSED => 'unprocessed',
        PROCESSING => 'processing',
        PROCESSED => 'processed'
      }
    end
  end
end
