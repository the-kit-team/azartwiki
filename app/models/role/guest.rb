module Role
  class Guest < Base
    private def permissions
      {
        root: [:index]
      }
    end
  end
end
