module ComoNoSerHelper
  def actual_o_no(recurso)
    recurso == current_resource ? 'actual' : 'noactual'
  end
end
