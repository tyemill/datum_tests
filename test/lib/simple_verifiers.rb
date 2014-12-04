module SimpleVerifiers
  def verify_basic_scenario marge, homer, bart
    # Homer & Marge use ERB
    verify_person marge, "Marge", "Simpson"              # verify person attrs
    assert_equal OFFLINE_STATUS_MASK, marge.status_mask  # verify ERB

    verify_person homer, "Homer", "Simpson"               # verify clone
    assert_equal OFFLINE_STATUS_MASK, homer.status_mask

    verify_person bart, "Bart", "Simpson"               # verify clone
    assert_equal ONLINE_STATUS_MASK, bart.status_mask
  end

  def verify_person person, first_name = nil, last_name = nil
    assert_not person.nil?, "Person is nil"
    assert_equal first_name, person.first_name
    assert_equal last_name, person.last_name
    assert person.id != nil
  end

  def verify_basic_datum
    str = "basic_string"
    puts @datum
    assert_equal @datum.datum_info.id == 1 ? str :
    "#{str} #{@datum.datum_info.id}", @datum.basic_string
    #assert_equal true, @datum.datum_label.end_with?(@datum.datum_id.to_s)
    assert_equal @datum.datum_info.id, @datum.basic_int
    assert_equal true, @datum.basic_true_boolean
    assert_equal false, @datum.basic_false_boolean
  end

  def verify_lou lou
    verify_person lou, "Lou", "Police-Officer"
    assert_equal ONLINE_STATUS_MASK, lou.status_mask
  end

  def verify_import_scenario clancy, eddie
    verify_person clancy, "Clancy", "Wiggum"
    assert_equal OFFLINE_STATUS_MASK, clancy.status_mask

    verify_person eddie, "Eddie", "Police-Officer"
    assert_equal nil, eddie.status_mask
  end

end