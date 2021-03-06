Given ("I am  President") do
    @president1=create(:president1_a)
    @league1=create(:league1_a, president_id: @president1.id)
    @president1.league_id=@league1.id
    @president1.save
                                        
    
    visit new_user_session_path
    fill_in "Email", :with => @president1.email
    fill_in "Password", :with => @president1.password
    click_button "Log in"
end

Given ("I am on league's home page") do
    expect(page).to have_text("Home Page Lega")
    expect(page).to have_text(@league1.name)
end

When /I click on "impostazioni lega"/ do
    click_on("impostazioni lega")
end

Given ("I am on the impostazioni lega page") do
    expect(page).to have_text("Settings of")
        expect(page).to have_text(@league1.name)
end

Given ("I filled the info lega form") do
    fill_in "Info di lega", :with => "descrizione lega"
    
end

When /I click  "Salva cambiamenti"/ do
    click_on("Salva cambiamenti")
end

Then ("I should be on impostazioni lega page again") do
   
     expect(page).to have_text("Settings of")
        expect(page).to have_text(@league1.name)
end

