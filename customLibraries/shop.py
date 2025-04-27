from robot.api.deco import library, keyword
from robot.libraries.BuiltIn import BuiltIn

@library
class Shop:

    def __init__(self):
        self.selLib = BuiltIn().get_library_instance("SeleniumLibrary")

        # Here the def __init__(self): is the constructor of the class Shop. For any python class, __init__(self):
        # is the syntax to declare constructor. A constructor is executed first any time when a class is called.
        # The class BuiltIn() allows to import libraries in python class files, since the direct import using keywords
        # like Library is supported only in .robot files. get_library_instance is the method that calls library
        # The argument it takes is the name of the library that we need to import. Here the import statement need
        # to be stored in a variable whose scope is in the entire class. The keyword self refers to the scope.

    @keyword
    def add_items_to_cart_and_checkout(self, products_list):
        product_titles = self.selLib.get_webelements("//h4[@class='card-title']/child::a[@href='#']")
        #We are calling the Get WebElements selenium library keyword in the above line.
        i = 1
        for product_title in product_titles:
            if product_title.text in products_list:
                self.selLib.click_button("(//div[@class ='card-footer'])['+str(i)+']/button")
            i = i+1
        self.selLib.scroll_element_into_view("//a[contains(text(), 'Checkout ')]")
        self.selLib.click_link("//a[contains(text(), 'Checkout ')]")
        # The index value in the xpath is what denoted as i here. When the entire xpath is passed as a string argument,
        # we need to separate the index variable which is an integer from the rest of the strings. Hence, we use +
        # operator to segregate but 'i' being an integer value, there will be type error. So use +str(i)+ to separate.
