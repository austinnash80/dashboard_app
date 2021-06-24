class EmpireMatchingsController < ApplicationController
  def no_mail

  end
  def lic_match

    @empire_matches_uid = EmpireMasterMatch.pluck(:uid)
    @empire_double_uid = EmpireMasterDoubleAccount.pluck(:uid)
    @empire_no_matches_uid = EmpireMasterNoMatch.pluck(:uid)
    @empire_matches_lid = EmpireMasterMatch.pluck(:lid)

  end
end
