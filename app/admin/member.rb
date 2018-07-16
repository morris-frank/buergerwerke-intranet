ActiveAdmin.register Member do
    permit_params :email, :cooperative_id, :firstname, :lastname, :is_coop_admin, :is_board_member, :is_editor, :can_see_customer_data,
      group_ids: [],
      groups_user_ids: []#, :password, :password_confirmation

    active_admin_import

    controller do
      def create
        @member = Member.invite!(permitted_params[:member], current_admin)
        if @member.new_record?
          render action: 'new'
        else
          redirect_to resource_path(@member), notice: 'Member invited successfully!'
        end
      end
    end

    index do
      selectable_column
      id_column
      column :firstname
      column :lastname
      column :email
      column :cooperative
      column :groups
      column :is_coop_admin
      column :is_board_member
      column :is_editor
      column :can_see_customer_data
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

    form do |f|
      f.inputs "Invite Member #{current_admin.inspect}" do
        f.input :email
        f.input :firstname
        f.input :lastname
        f.input :cooperative
        f.input :groups, :as => :select, :input_html => {:multiple => true}
        f.input :is_coop_admin
        f.input :is_board_member
        f.input :is_editor
        f.input :can_see_customer_data
        # f.input :password
        # f.input :password_confirmation
      end
      f.actions
    end

  end
