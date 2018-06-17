ActiveAdmin.register Member do
    permit_params :email

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
      column :is_coop_admin
      column :is_board_member
      column :is_editor
      column :can_see_customer_data
      column :current_sign_in_at
      column :sign_in_count
      column :created_at
      column :invited_by
      actions
    end


    filter :firstname
    filter :lastname
    filter :email
    filter :is_coop_admin
    filter :is_board_member
    filter :is_editor
    filter :can_see_customer_data
    filter :current_sign_in_at
    filter :sign_in_count
    filter :created_at
    filter :invited_by_id, :as => :select, :collection => proc { Admin.all.collect{|admin| [admin.email, admin.id]}}

    form do |f|
      f.inputs "Invite Member #{current_admin.inspect}" do
        f.input :email
      end
      f.actions
    end

  end
