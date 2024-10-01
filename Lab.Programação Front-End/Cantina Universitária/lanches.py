class Lanches:

    def __init__(self, id, name, price, description, image ):
        self.id = id
        self.name = name
        self.price = price
        self.description = description
        self.image = image

    def get_id(self):
        return self.id
    
    def get_name(self):
        return self.name
    
    def get_price(self):
        return self.price
    
    def get_description(self):
        return self.description
    
    def get_image(self):
        return self.image