ActiveAdmin.register Member do
    permit_params :email, :cooperative_id, :firstname, :lastname, :is_coop_admin, :is_board_member, :is_editor, :can_see_customer_data

    # active_admin_import

    controller do
      def create
        @member = Member.invite!(permitted_params[:member], current_admin)
        if @member.new_record?
          render action: 'new'
        else
          redirect_to resource_path(@member), notice: 'Benutzer erfolgreich eingeladen!'
        end
      end
    end


    member_action :reinvite do
      resource.invite!(current_admin)
      redirect_to resource_path(resource), notice: "Benutzer erneut eingeladen."
    end

    action_item :reinvite, only: :show do
      link_to 'Benutzer neu einladen', reinvite_admin_member_path(member)
    end

    index do
      selectable_column
      id_column
      column :firstname
      column :lastname
      column :email
      column :cooperative
      column :is_coop_admin
      column :is_board_member
      column :is_editor
      column :can_see_customer_data
      column :invitation_accepted_at?
      actions
    end


    filter :firstname
    filter :lastname
    filter :email
    filter :cooperative
    filter :is_coop_admin
    filter :is_board_member
    filter :is_editor
    filter :can_see_customer_data
    filter :invitation_accepted_at

    form do |f|
      f.inputs Member.model_name.human + " einladen #{current_admin.inspect}" do
        f.input :email
        f.input :firstname
        f.input :lastname
        f.input :cooperative
        f.input :is_coop_admin
        f.input :is_board_member
        f.input :is_editor
        f.input :can_see_customer_data
      end
      f.actions
    end

  end
