class SequoiaMatchingsController < ApplicationController

  def cpa_customer_matching

    @cpa_matches_uid = MasterCpaMatch.pluck(:uid)
    @cpa_double_uid = MasterCpaDoubleAccount.pluck(:uid)
    @cpa_no_matches_uid = MasterCpaNoMatch.pluck(:uid)
    @cpa_matches_lid = MasterCpaMatch.pluck(:lid)

    if params['match'] == 'yes'
      master = MasterCpa.find_by(lid: params['lid'])
      MasterCpaMatch.create(lid: master.lid, list: master.list, uid: params['uid'], lname: master.lname, search_date: Date.today).save
      redirect_to sequoia_matchings_cpa_customer_matching_path()
    elsif params['double'] == 'yes'
      master = MasterCpa.find_by(lid: params['lid'])
      MasterCpaDoubleAccount.create(lid: master.lid, list: master.list, uid: params['uid'], lname: master.lname, search_date: Date.today).save
      redirect_to sequoia_matchings_cpa_customer_matching_path()
    elsif params['no_match'] == 'yes'
      sequoia = SequoiaCustomer.limit(1).find_by(uid: params['uid'])
      list = MasterCpa.last(1).pluck(:list)[0]
      MasterCpaNoMatch.create(uid: sequoia.uid, list: list, lname: sequoia.lname, search_date: Date.today).save
      redirect_to sequoia_matchings_cpa_customer_matching_path()
    end

  end

end
