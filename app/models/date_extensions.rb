module DateExtensions

  def self.months_between(date1, date2)
    date1 ||= Date.current
    date2 ||= Date.current

    date1 = date1.to_date
    date2 = date2.to_date
    diff_months = (date1.month - date2.month) + 12 * (date1.year - date2.year)

    if diff_months == 0
      diff_months
    else
      if diff_months  < 0
        diff_months = diff_months*-1
      else
        diff_months
      end

      if date1 < date2
        sdate = date1
        bdate =date2
      else
        sdate =date2
        bdate =date1
      end

      tempdate = sdate.advance(:months=>diff_months)
      if bdate >= tempdate
        diff_months
      else
        diff_months-1
      end

    end
  end

  def self.add_months(date, months)
    new_date = date.advance(:months=>months)
    return new_date.end_of_month if date.end_of_month == date
    return new_date
  end

  def self.nearest_recurring_date_in_past(plan_date, current_date)
    months_between = DateExtensions.months_between(plan_date, current_date)
    multiplier = plan_date > current_date ? -1 : 1
    recurring_date = DateExtensions.add_months(plan_date, months_between * multiplier)
    months_between = recurring_date <= current_date ? months_between : months_between + 1
    DateExtensions.add_months(plan_date, months_between * multiplier)
  end

  def self.new_months_between(from_date, to_date)
    from_date ||= Date.current
    to_date ||= Date.current

    from_date = from_date.to_date
    to_date = to_date.to_date

    # results are positive if from_date < to_date
    if from_date < to_date
      sign = 1
    else
      sign = -1
    end

    # setting date1 <= date2
    date1 = [from_date, to_date].min
    date2 = [from_date, to_date].max

    result = date2.month - date1.month + (date2.year - date1.year) * 12
    # If d1 and d2 are either the same days of the month or both last days of months, the result is always an integer
    if ( date1 == date1.end_of_month && date2 == date2.end_of_month ) or ( date2.day == date1.day )
      result * sign
    else
      # the fractional portion of the result is based on a 31-day month
      if date2.day > date1.day
        ( result + (date2.day - date1.day)/31.0 ) * sign
      else
        ( result - 1 + ((31 - date1.day) + date2.day)/31.0 ) * sign
      end
    end
  end

  def self.integer_months_between(from_date, to_date)
    new_months_between(from_date, to_date).round
  end
end
