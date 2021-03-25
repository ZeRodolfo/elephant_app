module GraphsHelper
	def week_data
		start_date = 1.month.ago.to_date
		end_date = 1.week.ago.to_date
		data = []

		time_iterate(start_date, end_date, 1.week) do |date|
			e = date + 1.week
			data.push(
				{
					label: [locale(date), ' até ', locale(e)],
					value: range(date, e)
				}
			)
		end

		data
	end

	def shift(data)
		data.map { |d| }
	end

	def month_data
		start_date = 6.months.ago.to_date
		end_date = Date.today + 6.months
		data = []
		time_iterate(start_date, end_date, 1.month) do |date|
			data.push({
				label: [locale_month(date.month), ' de ', date.year.to_s],
				value: range(date, date + 1.month)
			})
		end

		data
  	end

	def annual_data
		start_date = Date.today
		end_date = Date.today + 4.years
		data = []
		time_iterate(start_date, end_date, 1.year) do |date|
			data.push({
				label: date.year.to_s,
				value: range(date, date + 1.year)
			})
		end

		data
	end

	def daily_data
		(1.month.ago.to_date..Date.today + 1.month).map{ |date| [to_key(to_gmt_minus_3(date)), parcels_value(date)] }.to_h
	end

	def range(start_date, end_date)
		OfficeVisit.joins(:patient).joins(:parcels).where("(date(parcels.created_at AT TIME ZONE 'UTC' AT TIME ZONE 'America/Sao_Paulo') BETWEEN date(?) AND date(?)) AND patients.user_id = ?", start_date, end_date, current_user.id).sum("parcels.value")
	end

	def parcels_value(date)
		OfficeVisit.joins(:patient).joins(:parcels).where("date(parcels.created_at) = ? AND patients.user_id = ?", date, current_user.id).sum("parcels.value")
	end

	def time_iterate(start_time, end_time, step, &block)
		begin
			yield(start_time)
		end while (start_time += step) <= end_time
	end

	def locale(date)
		date.strftime('%d/%m/%Y')
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
