function deleteForm() {
    document.getElementById('shirtname', 'number', 'size', 'name', 'email').value = "";
    document.getElementById('formbox').value = "";
}

class Produto {

    constructor(){
        this.id = 1;
        this.arrayForm = [];
    }

    enviar(){
       let produto = this.read();
        
       if(this.validaCampo(produto)) {
            this.adicionar(produto);
       }

       this.listaForm();
    }

    listaForm() {
       let formbox = document.getElementById('formbox');

       formbox.innerText = '';

       for(let i = 0; i < this.arrayForm.length; i++) {
            let tr = formbox.insertRow();
            let td_nome = tr.insertCell();
            let td_numero = tr.insertCell();
            let td_modelo = tr.insertCell();
            let td_tamanho = tr.insertCell();
            

            
            td_nome.innerText = this.arrayForm[i].nome;
            td_numero.innerText = this.arrayForm[i].numero;
            td_modelo.innerText = this.arrayForm[i].modelo;
            td_tamanho.innerText = this.arrayForm[i].tamanho;
           
       }
    }


    adicionar(produto) {
        this.arrayForm.push(produto);
        this.id++;
    }
    
    read(){

        let produto = {}

        produto.id =this.id;
        produto.nome = document.getElementById('shirtname').value;
        produto.numero = document.getElementById('shirtnumber').value;
        produto.modelo = document.getElementById('number').value;
        produto.tamanho = document.getElementById('size').value;
       
   
   
          return produto;
    }

    validaCampo() {

        let msg = '';

        if(produto.nome == '') {
            msg += 'Informe nome do produto';
        }

        if(produto.numero == '') {
            msg += 'Informe numero do produto';
        }

        if(msg!= '') {
            alert(msg);
            return false
        }

        return true;
    }
}

var produto = new Produto();