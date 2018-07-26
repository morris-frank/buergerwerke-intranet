module MembersHelper
    def is_admin
        own_coop = @cooperative.id == current_member.cooperative_id
        return own_coop && current_member.is_coop_admin
    end
end
