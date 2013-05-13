require 'ab_tests/variation'

module AbTests
  module ViewHelpers
    def ab_test(test_name, variation_names, unique_identifier,  &block)
      user_id_field_name = AbTests.configuration.user_id_field_name
      if previous_variation = AbTests::Variation.where(user_id_field_name =>  user_id_field, test_name: test_name).first
        content = capture(previous_variation.chosen_variation, &block)
      else
        chosen_variation = variation_names.sample
        AbTests::Variation.create(test_name: test_name, chosen_variation: chosen_variation, user_id_field_name => unique_identifier)
        content = capture(chosen_variation, &block)
      end
      content
    end
  end
end

