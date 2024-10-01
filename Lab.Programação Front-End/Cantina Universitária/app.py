from flask import Flask, render_template, url_for
from lanches import Lanches

app = Flask(__name__)

Coxinha = Lanches(id = 1, name = "Coxinha", price = 8.00, description = "A melhor da faculdade!", image = 'img/coxinha.png'  )
Coca = Lanches(id = 2, name = "Coca-Cola", price = 6.00, description = "Beeeem gelada", image = 'img/coca.png'  )
Hamburger = Lanches(id = 3, name = "Hámburguer", price = 12.00, description = "Super suculento", image = 'img/hamburguer.png'  )



lancheList = [Coxinha, Coca, Hamburger]

@app.route("/")
def home():
    return render_template("index.html")


@app.route("/menu")
def menu():
    return render_template("menu.html", lancheList = lancheList)

@app.route("/lanche/<int:id>")
def lanche(id):
    for lanche in lancheList:
        if lanche.get_id() == id:
            return render_template("lanche.html", lanche=lanche)
    return '<h1>Ops! Nenhum lanche encontrado!</h1>'


if __name__ == '__main__':
    app.run(debug=True)