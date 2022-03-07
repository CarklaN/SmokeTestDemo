class Objects



# 1. Sign in method
def self.send_credentials(drive, email, password)

    drive.a(class: 'login').click
    sleep 3
    drive.input(id: 'email').set email
    drive.input(id: 'passwd').set password
    drive.button(id: 'SubmitLogin').click
	
end

# 2. Clickability of exposed poducts and adding to the cart

# 2.1 Click on the item
def self.click_on_the_item(driver,product_name)
	driver.a(title: product_name).click
end

# 2.2 Choose product quantity
def self.quantity(driver, product_quantity)
	driver.input(id:'quantity_wanted').set product_quantity
end

# 2.3 Choose product size
def self.size(driver, product_size)
	 driver.select(id: 'group_1').option(title: product_size.upcase).click
end

# 2.4 Choose product color
def self.color(driver, product_color)
	driver.a(name: product_color).click
end

# 2.5 Add to cart
def self.cart(driver)
	driver.button(name: 'Submit').click 
	sleep 2
end

# 3 Checkout path methods

# 3.1 Proceed to checkou pop-up window
def self.button_popup(driver)
	driver.a(class: 'btn btn-default button button-medium').click
end

# 3.2 Proceed to checkout-2 times
def self.button2(driver)
	driver.a(class: 'button btn btn-default standard-checkout button-medium').click
    sleep 1
    driver.button(class: 'button btn btn-default button-medium').click
    sleep 1
end

# 3.3 Accept terms and conditions, proceed to payment
def self.accept_terms_checkout(driver)
	driver.input(id: 'cgv').click
	driver.button(name: 'processCarrier').click
end

# 3.4 Choose payment option and confirm order: 
def self.payment(driver, payment_options) 
	#two possile payment options: 'bankwire' and 'cheque'
	driver.a(class: payment_options).click
	sleep 1
	driver.button(class: 'button btn btn-default button-medium').click
end

#Return to home-logo button
def self.navigate_to_home(driver)
	driver.img(class: 'logo img-responsive').click
end

end
