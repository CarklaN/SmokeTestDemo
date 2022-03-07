require 'rspec'
require 'watir'
require 'objects'

describe 'Smoke Test Cases: ' do
    before :all do
        @browser = Watir::Browser.new:chrome
        @browser.window.maximize
        @browser.goto('http://www.automationpractice.com/index.php')
        sleep 5
    end

    after :all do
        @browser.close
    end

     context 'Login with valid credentials' do
        it 'submit valid email and password' do 
            Objects.send_credentials(@browser,'proba99@gmail.com', 'test55')
        end

        sleep 3

        it 'verify if user is logged in' do
            expect(@browser.h1(class: 'page-heading').text).to eql('MY ACCOUNT')

     end



       

    context 'Adding item to the cart' do 

        it 'return to the home page' do 
            Objects.navigate_to_home(@browser)
        end

        it 'Click on the item' do
            Objects.click_on_the_item(@browser, 'Faded Short Sleeve T-shirts')

        end

        it 'Choose product quantity' do 
            Objects.quantity(@browser, 3)
        end

        it 'Choose product size' do 
            Objects.size(@browser, 'm')
        end

        it 'Choose product color' do
            Objects.color(@browser, 'Orange')
        end

        it 'Add choosen product to the cart' do 
            Objects.cart(@browser)
        end

        it 'verify if item was added to the cart' do
            expect(@browser.h2.text.include?("Product successfully added to your shopping cart")).to be true

     end

    end

    context 'Proceeding with checkout' do 

        it 'Click on proceed to checkout button on pop-up window' do
            Objects.button_popup(@browser)
            end

        it 'Click on proceed to checkout 2 times on check out page' do 
            Objects.button2(@browser)

        end

        it 'Accept terms and conditions and proceed to payment' do 
            Objects.accept_terms_checkout(@browser)
        end

        it 'Confirm my order' do
            Objects.payment(@browser, 'bankwire')
        end

        it 'Display order confirmation' do 
        end

        it "shows 'Order confirmation.' pop-up message" do
            expect(@browser.h1(class: 'page-heading').text).to eql('ORDER CONFIRMATION')
        end


    end
end
end
