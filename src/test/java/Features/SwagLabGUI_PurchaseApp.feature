Feature: SwagLab Purchase Application

	@GUI_Test
  Scenario: Purchase the lowest and second highest items
    #Configure WebDriver
    * configure driver = { type:'chromedriver', executable: './bin/chromedriver.exe' }
    #Open a Browser and Navigate the URL
    Given driver 'https://www.saucedemo.com/'
    And maximize()
    #Login the application
    And input('input[id=user-name]','standard_user')
    And input('input[id=password]','secret_sauce')
    When click('input[id=login-button]')
    Then match text('span[class=title]') == 'Products'
    #Filter Product from Low to High Price range
    * mouse("//*[@class='product_sort_container']").click()
    When input("//*[@class='product_sort_container']",Key.DOWN)
    And input("//*[@class='product_sort_container']",Key.DOWN)
    And input("//*[@class='product_sort_container']",Key.ENTER)
    Then match text('span[class=active_option]') == 'Price (low to high)'
    #Add low priced item into the cart
    When click("//*[@class='inventory_item'][1]//button")
    * def lowPriceItemName = text("//*[@class='inventory_item'][1]//*[@class='inventory_item_name']")
    Then match text("//span[@class='shopping_cart_badge']") == '1'
    #Filter Product from High to Low Price range
    * mouse("//*[@class='product_sort_container']").click()
    When input("//*[@class='product_sort_container']",Key.DOWN)
    And input("//*[@class='product_sort_container']",Key.ENTER)
    Then match text('span[class=active_option]') == 'Price (high to low)'
    #Add second highest item into the cart
    When click("//*[@class='inventory_item'][2]//button")
    * def secondHighPriceItemName = text("//*[@class='inventory_item'][2]//*[@class='inventory_item_name']")
    Then match text("//span[@class='shopping_cart_badge']") == '2'
    #Navigate to Cart page & Compare Items are added into the Cart sequential basis
    When click("//a[@class='shopping_cart_link']")
    Then match text('span[class=title]') == 'Your Cart'
    And match text("//*[@class='cart_item'][1]//*[@class='inventory_item_name']") == lowPriceItemName
    And match text("//*[@class='cart_item'][2]//*[@class='inventory_item_name']") == secondHighPriceItemName
    #Checkout the Cart
    When click('button[id=checkout]')
    Then match text('span[class=title]') == 'Checkout: Your Information'
    #Fill the User Information and move to final checkout overview
    When input('input[id=first-name]','Mahendran')
    And input('input[id=last-name]','Murugan')
    And input('input[id=postal-code]','G59JG')
    And click('input[id=continue]')
    Then match text('span[class=title]') == 'Checkout: Overview'
    #Finish the purchase
    When click('button[id=finish]')
    Then match text('span[class=title]') == 'Checkout: Complete!'
    And match text('h2') == 'THANK YOU FOR YOUR ORDER'
    #Logout the application
    When click('button[id=react-burger-menu-btn]')
    * mouse("//*[text()='Logout']").click()
    Then match driver.url == 'https://www.saucedemo.com/'
