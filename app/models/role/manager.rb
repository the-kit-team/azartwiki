module Role
  class Manager < Base
    private def permissions
      {
        root: :all,
        images: :all,
        image_galleries: :all
      }
    end
  end
end
