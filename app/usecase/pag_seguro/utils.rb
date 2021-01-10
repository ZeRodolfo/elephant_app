module PagSeguro::Utils
  def credentials
    @credentials ||= PagSeguro::AccountCredentials.new(ENV['PAGSEGURO_EMAIL'], ENV['PAGSEGURO_TOKEN'])
  end
end
