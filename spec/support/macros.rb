def set_current_user(existing_user=nil)
  u = existing_user || Fabricate(:user)
  sign_in u 
  u #return the user
end

def set_current_admin(admin=nil)
  admin = admin || Fabricate(:admin)
  set_current_user(admin)
end

def clear_current_user
  if current_user.present?
    sign_out current_user 
  end
end
