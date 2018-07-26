module CooperativesHelper
    def can_edit
        own_coop = @cooperative.id == current_member.cooperative_id
        return own_coop && current_member.is_editor
    end

    def can_customer_data
        own_coop = @cooperative.id == current_member.cooperative_id
        tariff = @cooperative.has_tariff
        mem_allow = current_member.can_see_customer_data
        return own_coop && tariff && mem_allow
    end
end
