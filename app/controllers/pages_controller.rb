class PagesController < ApplicationController
  def home
  end
  def customer_matching_cpa
    @master_cpa_total = MasterCpa.count
    @master_cpa_match_total = MasterCpaMatch.count
    @master_cpa_no_match_total = MasterCpaNoMatch.count
    sequoia_customers_uid = SequoiaCustomer.pluck(:uid)
    @sequoia_customers = (sequoia_customers_uid.uniq).count
  end
end
