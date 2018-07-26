module PlantsHelper
    def can_edit
        own_coop = @cooperative.id == current_member.cooperative_id
        return own_coop && current_member.is_editor
    end
end
