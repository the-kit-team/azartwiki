module Role
  class Guest < Base
    private def permissions
      {
        home: [:index],
        sessions: [:new, :create],
        wiki: [:index, :show]
      }
    end
  end
end
