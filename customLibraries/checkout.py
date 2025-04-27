from robot.api.deco import library, keyword
from robot.libraries.BuiltIn import BuiltIn

@library
class Checkout:

    def __init__(self):
        self.selLib = BuiltIn().get_library_instance("SeleniumLibrary")

    @keyword
    def verify_products_and_click_checkout(self, productslist):
        productlist = self.selLib.get_webelements("//h4[@class = 'media-heading']/child::*[@href = '#']")
        for product in productlist:
            if product.text in productslist:
                print("Verified")
        self.selLib.scroll_element_into_view("//button[normalize-space(text())='Checkout']")
        self.selLib.click_button("//button[normalize-space(text())='Checkout']")