require 'ab_tests/variation'

module AbTests
  module ViewHelpers
    def ab_test(test_name, variation_names, unique_identifier,  &block)
      unique_id_field = AbTests.configuration.unique_identifier
      if previous_variation = AbTests::Variation.where(unique_id_field => unique_identifier, test_name: test_name).first and unique_identifier
        unless Rails.env.test? # a block in a rails view
          return capture(previous_variation.chosen_variation, &block)
        else
          yield(previous_variation.chosen_variation)
        end
      end
      chosen_variation = variation_names.sample
      AbTests::Variation.create(test_name: test_name, chosen_variation: chosen_variation, unique_id_field => unique_identifier)
      unless Rails.env.test? # a block in a rails view
        return capture(chosen_variation, &block)
      else
        yield(chosen_variation)
      end
    end
  end
end

