require 'ab_tests/variation'

module AbTests
  module ViewHelpers
    def ab_test(test_name, variation_names, unique_identifier,  &block)
      unique_id_field = AbTests.configuration.unique_identifier
      if previous_variation = AbTests::Variation.where(unique_id_field => unique_identifier, test_name: test_name).first and unique_identifier
        return capture(previous_variation.chosen_variation, &block)
      end
      chosen_variation = variation_names.sample
      AbTests::Variation.create(test_name: test_name, chosen_variation: chosen_variation, unique_id_field => unique_identifier)
      capture(chosen_variation, &block)
    end
  end
end

