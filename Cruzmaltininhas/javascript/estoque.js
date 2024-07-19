let products = {
    data: [
      {
        productName: "CAMISETA AQUECIMENTO VASCO 24",
        category: "Topwear",
        price: "199,90",
        image: "Camisa1.png",
      },
      {
        productName: "BERMUDA TRADE ADT VASCO - BRANCO ",
        category: "Bottomwear",
        price: "219,90",
        image: "Calça1.png",
      },
      {
        productName: "CAVALHINHO VASCO DA GAMA - Claudia&Victória Art's",
        category: "Watch",
        price: "249.90",
        image: "Cavalo.png",
      },
      {
        productName: "CAMISA KOMBAT III CAMISAS NEGRAS",
        category: "Topwear",
        price: "349,90",
        image: "Camisa2.png",
      },
      {
        productName: "AGASALHO TRILOBAL PRINT CRVG - CINZA/PRETO ",
        category: "Jacket",
        price: "719,90",
        image: "Casaco1.png",
      },
      {
        productName: "CALÇA MOLETOM CRVG PRETA KAPPA 23 ",
        category: "Bottomwear",
        price: "349,80",
        image: "Calça2.png",
      },
      {
        productName: "AGASALHO FEMININO VIAGEM 2020 CRVG",
        category: "Jacket",
        price: "589.90",
        image: "Casaco2.png",
      },
      {
        productName: "SHORTS HOME PLAYER RYDER CRVG 23 - BRANCO ",
        category: "Bottomwear",
        price: "169,90",
        image: "Calça3.png",
      },
    ],
  };
  for (let i of products.data) {
    //Create Card
    let card = document.createElement("div");
    //Card should have category and should stay hidden initially
    card.classList.add("card", i.category, "hide");
    //image div
    let imgContainer = document.createElement("div");
    imgContainer.classList.add("image-container");
    //img tag
    let image = document.createElement("img");
    image.setAttribute("src", i.image);
    imgContainer.appendChild(image);
    card.appendChild(imgContainer);

    document.getElementById("products").appendChild(card);

    //container
    let container = document.createElement("div");
    container.classList.add("container");
    //product name
    let name = document.createElement("h5");
    name.classList.add("product-name");
    name.innerText = i.productName.toUpperCase();
    container.appendChild(name);
    //price
    let price = document.createElement("h6");
    price.innerText = "$" + i.price;
    container.appendChild(price);
    card.appendChild(container);
    document.getElementById("products").appendChild(card);
  }
  //parameter passed from button (Parameter same as category)
  function filterProduct(value) {
    //Button class code
    let buttons = document.querySelectorAll(".button-value");
    buttons.forEach((button) => {
      //check if value equals innerText
      if (value.toUpperCase() == button.innerText.toUpperCase()) {
        button.classList.add("active");
      } else {
        button.classList.remove("active");
      }
    });
    //select all cards
    let elements = document.querySelectorAll(".card");
    //loop through all cards
    elements.forEach((element) => {
      //display all cards on 'all' button click
      if (value == "all") {
        element.classList.remove("hide");
      } else {
        //Check if element contains category class
        if (element.classList.contains(value)) {
          //display element based on category
          element.classList.remove("hide");
        } else {
          //hide other elements
          element.classList.add("hide");
        }
      }
    });
  }
  //Search button click
  document.getElementById("search").addEventListener("click", () => {
    //initializations
    let searchInput = document.getElementById("search-input").value;
    let elements = document.querySelectorAll(".product-name");
    let cards = document.querySelectorAll(".card");
    //loop through all elements
    elements.forEach((element, index) => {
      //check if text includes the search value
      if (element.innerText.includes(searchInput.toUpperCase())) {
        //display matching card
        cards[index].classList.remove("hide");
      } else {
        //hide others
        cards[index].classList.add("hide");
      }
    });
  });
  //Initially display all products
  window.onload = () => {
    filterProduct("all");
  };