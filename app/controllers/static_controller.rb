class StaticController < ApplicationController
    skip_before_action :authenticate_user!
    def landing
    end

    def termos
    end
end
