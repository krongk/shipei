require 'test_helper'

class SiteContactsControllerTest < ActionController::TestCase
  setup do
    @site_contact = site_contacts(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:site_contacts)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create site_contact" do
    assert_difference('SiteContact.count') do
      post :create, site_contact: { email: @site_contact.email, is_processed: @site_contact.is_processed, note: @site_contact.note, phone: @site_contact.phone, qq: @site_contact.qq, site_id: @site_contact.site_id }
    end

    assert_redirected_to site_contact_path(assigns(:site_contact))
  end

  test "should show site_contact" do
    get :show, id: @site_contact
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @site_contact
    assert_response :success
  end

  test "should update site_contact" do
    patch :update, id: @site_contact, site_contact: { email: @site_contact.email, is_processed: @site_contact.is_processed, note: @site_contact.note, phone: @site_contact.phone, qq: @site_contact.qq, site_id: @site_contact.site_id }
    assert_redirected_to site_contact_path(assigns(:site_contact))
  end

  test "should destroy site_contact" do
    assert_difference('SiteContact.count', -1) do
      delete :destroy, id: @site_contact
    end

    assert_redirected_to site_contacts_path
  end
end