class ApplicationRecord < ActiveRecord::Base
  include KonoUtilsBootstrapView4::BaseClassConceptNs
  include KonoUtils::Concerns::ActiveRecordTranslation

  self.abstract_class = true
end