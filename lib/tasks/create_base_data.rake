namespace :db do
  desc "Create roles, permissions and users"
  task create_base_data: :environment do
    manager= Role.create! name: "Manager"
    admin= Role.create! name: "Admin"
    user= Role.create! name: "User"

    Permission.create! subject_class: "all", action: "manage", role_id: manager.id
    Permission.create! subject_class: "Post", action: "manage",  role_id: admin.id
    Permission.create! subject_class: "Post", action: "read",     role_id: user.id

    User.create  email: "manager@manager.com", password: "123456789", password_confirmation: "123456789", role_id: manager.id
    User.create  email: "admin@admin.com", password: "123456789", password_confirmation: "123456789", role_id: admin.id
    User.create  email: "sufyaiqbal.dev@gmail.com", password: "123456789", password_confirmation: "123456789", role_id: user.id
  end
end
