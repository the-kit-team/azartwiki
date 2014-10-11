module Role
  class Admin < Base
    def can?(_controller, _action)
      true
    end
  end
end
