feature 'Sign Up' do
  scenario 'User registers' do
    expect { sign_up }.to change(User, :count).by(1)
    expect(page).to have_content 'Welcome, john@doe.com'
    expect(User.first.email).to eq('john@doe.com')
  end

  scenario 'password match validation' do
    expect { sign_up(password_confirmation: 'notthepassword') }.not_to change(User, :count)
    expect(current_path).to eq('/signup')
    expect(page).to have_content 'passwords do not match'
  end

  scenario 'must enter a valid email' do
    expect { sign_up(email: nil) }.not_to change(User, :count)
  end
end
