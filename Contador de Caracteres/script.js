const wrapper = document.querySelector(".wrapper"),
editableInput = wrapper.querySelector(".editable"),
readonlyInput = wrapper.querySelector(".readonly"),
placeholder = wrapper.querySelector(".placeholder"),
counter = wrapper.querySelector(".counter"),
button = wrapper.querySelector("button");

editableInput.onfocus = ()=>{
  placeholder.style.color = "#401E01";
}
editableInput.onblur = ()=>{
  placeholder.style.color = "#200F01";
}

editableInput.onkeyup = (e)=>{
  let element = e.target;
  validated(element);
}
editableInput.onkeypress = (e)=>{
  let element = e.target;
  validated(element);
  placeholder.style.display = "none";
}

function validated(element){
  let text;
  let maxLength = 280;
  let currentlength = element.innerText.length;

  if(currentlength <= 0){
    placeholder.style.display = "block";
    counter.style.display = "none";
    button.classList.remove("active");
  }else{
    placeholder.style.display = "none";
    counter.style.display = "block";
    button.classList.add("active");
  }

  counter.innerText = currentlength; //maxLength - aqui

  if(currentlength > maxLength){
    let overText = element.innerText.substr(maxLength);
    overText = `<span class="highlight">${overText}</span>`; 
    text = element.innerText.substr(0, maxLength) + overText; 
    readonlyInput.style.zIndex = "1";
    counter.style.color = "#FA7A09";
    button.classList.remove("active");
  }else{
    readonlyInput.style.zIndex = "-1";
    counter.style.color = "#401E01";
  }
  readonlyInput.innerHTML = text; 
}