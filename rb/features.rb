# AddressLookupService SDK feature factory

require_relative 'feature/base_feature'
require_relative 'feature/test_feature'


module AddressLookupServiceFeatures
  def self.make_feature(name)
    case name
    when "base"
      AddressLookupServiceBaseFeature.new
    when "test"
      AddressLookupServiceTestFeature.new
    else
      AddressLookupServiceBaseFeature.new
    end
  end
end
