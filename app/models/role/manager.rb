module Role
  class Manager < Base
    private def permissions
      {
        home: :all,
        images: :all,
        image_galleries: :all,
        bootsy: :all,
        sessions: :all
      }
    end
  end
end
