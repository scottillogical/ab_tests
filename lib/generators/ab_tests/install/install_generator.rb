require 'rails/generators/migration'

module AbTests
  module Generators
    class InstallGenerator < ::Rails::Generators::Base
      include Rails::Generators::Migration
      source_root File.expand_path('../templates', __FILE__)
      argument :unique_identifier, :type => :string, :default => "unique_identifier", desc: "The user identifier for recording who saw which variation"
      desc "Generate an initializer for configuration, and a migration for recording the test results.  Take one argument, USER_ID, which is merely the foreign key for tracking which users saw what."


      def self.next_migration_number(path)
        unless @prev_migration_nr
          @prev_migration_nr = Time.now.utc.strftime("%Y%m%d%H%M%S").to_i
        else
          @prev_migration_nr += 1
        end
        @prev_migration_nr.to_s
      end

      def copy_migrations
        migration_template "create_variations.rb.erb", "db/migrate/create_variations.rb"
      end

      def copy_initializer
        template '../templates/ab_tests.rb.erb', 'config/initializers/ab_tests.rb'
      end

    end
  end
end
