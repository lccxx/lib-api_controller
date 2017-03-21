class APIController < ActionController::API
  rescue_from ::ActiveRecord::RecordNotFound, with: :record_not_found

  protected
    def record_not_found(e)
      if e.message[/User/]
        render json: { error: "TOKEN-ERROR" }
      end
    end
end
