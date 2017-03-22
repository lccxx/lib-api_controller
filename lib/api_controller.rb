class APIController < ActionController::API
  rescue_from ::ActiveRecord::RecordNotFound, with: :record_not_found

  protected
    def record_not_found(e)
      if e.message[/User/]
        return render json: { error: "TOKEN-ERROR" }
      end
      if e.message[/Channel/]
        return render json: { error: "ACCESS-TOKEN-ERROR", msg: "访问令牌错误" }
      end
    end
end
