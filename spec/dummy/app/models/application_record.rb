class ApplicationRecord < ActiveRecord::Base
  include KonoUtilsBootstrapView4::BaseClassConceptNs
  include KonoUtils::Concerns::ActiveRecordTranslation
  include KonoUtils::Concerns::ActiveStorageRemoverHelper

  self.abstract_class = true
end