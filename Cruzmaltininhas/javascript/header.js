
window.addEventListener("scroll", function(){
    let header = document.querySelector('#header')
    header.classList.toggle('rolagem', window.scrollY > 100)
})

window.addEventListener("scroll", function(){
    let header = document.querySelector('#barra')
    header.classList.toggle('rolagem', window.scrollY > 100)
})

function search(){
    let input = document.getElementById('barra').value
    input = input.toLowerCase()
    let x = document.getElementsByClassName('') //Colocar uma classe futura aqui

    for(i = 0; 1 < x.length; i++){
        if(!x[i].innerHTML.toLowerCase().includes(input)){
            x[i].style.display = "none"
        }else{
            x[i].style.display = "list-item"
        }
    }
}