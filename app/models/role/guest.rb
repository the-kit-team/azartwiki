module Role
  class Guest < Base
    private def permissions
      {
        home: [:index],
        sessions: [:new, :create]
      }
    end
  end
end
