from robot.api.deco import library, keyword
from robot.libraries.BuiltIn import BuiltIn

# library and keyword annotations are to be imported from robot.api.deco package
# BuiltIn class to be imported from the package robot.libraries.BuiltIn

@library # This library annotation is required for the class declared below because this class is considered as a
# library in which the function implementation with keyword annotation is created.
class PractiseCustomKeywords:

    def __init__(self): # This is the constructor of the class PractiseCustomKeywords.
# Whenever the class is called from anywhere in the workspace, the constructor is the first block to get executed
        self.selLib = BuiltIn().get_library_instance("SeleniumLibrary")
# Whenever we are calling a function in a class, we need to call using the parenthesis for the class
# Since the self keyword refers to anything that belongs to the class, the global variables need to be declared
# in the constructor function which belongs to the class.

    @keyword # This keyword annotation is required because this function implementation will be called in the
# framework at various places and used as a library keyword by importing this class file with it's path.
    def add_items_to_cart_and_checkout(self, productslist):
# Now this function 'add_items_to_cart_and_checkout can be used as a keyword in a .robot file by importing this
# class and specifying the path under Library keyword of Settings module.
        i = 1
        product_names = self.selLib.get_webelements("//h4[@class='card-title']/child::a[@href='#']")
# In the above line of code, the keyword from SeleniumLibrary - Get WebElements is called. For any library keyword,
# the function where it is created as a keyword will in the same name with lowercase letters and separated by _
        for product_name in product_names:
            if product_name.text in productslist:
                self.selLib.click_button("(//div[@class ='card-footer'])['+str(i)+']/button")
            i = i+1