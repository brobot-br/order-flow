# frozen_string_literal: true

module OrderFlow
  class InstallGenerator < Rails::Generators::Base
    include Rails::Generators::Migration
    source_root File.expand_path('templates', __dir__)

    def create_migrates
      %w[orders stages items].each do |name|
        migration_template "migrate/create_order_flow_#{name}.rb",
                           "db/migrate/create_order_flow_#{name}.rb"
      end
    end

    def create_models
      %w[order stage item status].each do |name|
        copy_file "models/order_flow/#{name}.rb",
                  "app/models/order_flow/#{name}.rb"
      end
    end

    def self.next_migration_number(dirname)
      next_migration_number = current_migration_number(dirname) + 1
      ActiveRecord::Migration.next_migration_number(next_migration_number)
    end
  end
end
