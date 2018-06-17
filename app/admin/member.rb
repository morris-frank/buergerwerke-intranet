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
      column :email
      column :current_sign_in_at
      column :sign_in_count
      column :created_at
      column :invited_by
      actions
    end

    filter :email
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
