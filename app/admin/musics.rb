ActiveAdmin.register Music do
    menu label: '신청곡', priority: 3
    before_action :check_role, only: [:new, :create, :edit, :update, :destroy]
    
    controller do
        def check_role
            if current_admin_user.member?
                redirect_to admin_dashboard_path, alert: "권한이 없습니다"
            end
        end
    end
end
