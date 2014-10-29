module Role
  class Base < User
    attr_accessor :permissions

    def self.model_name
      ActiveModel::Name.new(User)
    end

    def can?(controller, action)
      @controller, @action = controller.to_sym, action.to_sym

      can_do?
    end

    private

    def can_do?
      actions = permissions.try :[], @controller

      return false if actions.blank?
      return true  if actions == :all

      @action.in? actions
    end
  end
end
