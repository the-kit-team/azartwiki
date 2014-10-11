module Role
  class Base < User
    attr_accessor :permissions

    def self.model_name
      ActiveModel::Name.new(User)
    end

    def can?(controller, action)
      @controller, @action = controller, action

      can_do?
    end

    private

    def can_do?
      return false unless permissions

      actions = permissions[@controller]

      return false if actions.blank?
      return true  if actions == :all

      @action.in? actions
    end
  end
end
