import time

from robot.api.deco import library, keyword
from robot.libraries.BuiltIn import BuiltIn


@library
class Shop:

    def __init__(self):
        self.sellib = BuiltIn().get_library_instance("SeleniumLibrary")

    @keyword
    def hello_word(self):
        print("hello i am Amol")

    @keyword
    def add_items_to_cart_and_checkout(self, productlist):
        i = 1
        producttitles = self.sellib.get_webelements("//h4[@class='card-title']")
        for producttitle in producttitles:
            if producttitle.text in productlist:
                self.sellib.click_button("(//button[@class='btn btn-info'][normalize-space()='Add'])["+str(i)+"]")

            i = i + 1
        time.sleep(5)


