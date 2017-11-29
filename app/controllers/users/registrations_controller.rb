class Users::RegistrationsController < Devise::RegistrationsController
    
    def create
        super do |resource| # imports everything from Devise RegController
            if params[:plan]
                resource.plan_id = params[:plan]
                if resource.plan_id == 2
                    resource.save_with_payment
                else
                    resource.save
                end
            end
        end
    end

end