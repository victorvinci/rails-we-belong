require "application_system_test_case"

class ProductsTest < ApplicationSystemTestCase
  test "visiting the index" do
    visit "/"
    assert_selector "h1", text: "WE BELONG"
  end
  test "search for companies" do
    visit "/searches/index?utf8=✓&query=clark"
    assert_selector "a", text: "Clark Solutions"
  end
   test "lets a signed in user create a review" do
    company = Company.first
    login_as users(:george)
    visit "/companies/#{company.id}/reviews/new"
    # save_and_open_screenshot

    fill_in "review_user_area", with: "Le Wagon"
    fill_in "review_user_position", with: "Change your life: Learn to code"
    fill_in "review_content", with: "1234567890123456789012345678901234567890"
    # save_and_open_screenshot

    click_on 'Criar Review'
    # save_and_open_screenshot

    # Should be redirected to Home with new product
    assert_equal "/companies/#{company.id}", page.current_path
    assert_text "Change your life: Learn to code"
  end
end
