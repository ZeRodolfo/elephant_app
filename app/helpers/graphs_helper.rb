module GraphsHelper
	def week_data
		data = []
		w = Date.today.beginning_of_month
		weeks = (0..4).map{ |x| w + (x * 1.week) }
		weeks.each do |week|
			start_w = week.beginning_of_week
			end_w = week.end_of_week
			data.push(
				{
					label: ['seg ' + locale2(start_w), ' até ', 'dom ' + locale2(end_w)],
					value: range(start_w, end_w)
				}
			)
		end

		data
	end

	def month_data
		data = []
		m = Date.today.beginning_of_year
		months = (0..11).map{ |x| m + (x * 1.month) }

		months.each do |month|
			start_m = month.beginning_of_month
			end_m = month.end_of_month

			data.push({
				label: [locale_month(start_m.month), ' de ', start_m.year.to_s],
				value: range(start_m, end_m)
			})
		end

		data
  	end

	def annual_data
		data = []
		y = Date.today.beginning_of_year
		years = (0..4).map{ |x| y + (x * 1.year) }

		years.each do |year|
			start_y = year.beginning_of_year
			end_y = year.end_of_year
			data.push({
				label: start_y.year.to_s,
				value: range(start_y, end_y)
			})
		end

		data
	end

	def daily_data
		(1.month.ago.to_date..Date.today + 1.month).map{ |date| [to_key(date), parcels_value(date)] }.to_h
	end

	def range(start_date, end_date)
		OfficeVisit.joins(:patient).joins(:parcels).where("(date(parcels.created_at AT TIME ZONE 'UTC' AT TIME ZONE 'America/Sao_Paulo') >= date(?) AND date(parcels.created_at AT TIME ZONE 'UTC' AT TIME ZONE 'America/Sao_Paulo') <= date(?)) AND patients.user_id = ?", start_date, end_date, current_user.id).sum("parcels.value")
	end

	def parcels_value(date)
		OfficeVisit.joins(:patient).joins(:parcels).where("date(parcels.created_at AT TIME ZONE 'UTC' AT TIME ZONE 'America/Sao_Paulo') = ? AND patients.user_id = ?", date, current_user.id).sum("parcels.value")
	end

	def time_iterate(start_time, end_time, step, &block)
		begin
			yield(start_time)
		end while (start_time += step) <= end_time
	end

	def locale(date)
		date.strftime('%d/%m/%Y')
	end

	def locale2(date)
		date.strftime('%d/%m')
	end

	def locale_month(index)
		%w[nil Janeiro Fevereiro Março Abril Maio Junho Julho Agosto Setembro Outubro Novembro Dezembro][index]
	end

	def to_gmt_minus_3(date)
		return date.to_datetime.new_offset('-03:00') if (date.instance_of? Date) or (date.instance_of? Time)
		date.new_offset('-03:00')
	end

	def to_key(date)
		date.strftime('%Y%m%d')
	end
end
