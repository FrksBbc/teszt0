
$(function () {

  $('.sidenav').sidenav();

  

  let divek = Array.from(document.getElementsByClassName('img-holder'));

  divek.forEach(function (item) {

    item.style.backgroundImage = `url(images/products/${item.dataset.background})`;
  })

});


document.addEventListener('DOMContentLoaded', function () {
  var elems = document.querySelectorAll('select');
  if (elems.length > 0 && typeof options !== "undefined")
    var instances = M.FormSelect.init(elems, options);
});

$(document).ready(function () {

  readCart();
  


if( document.getElementById("top-cart-display") ) {
  document.getElementById("top-cart-display").onclick = function(){

    let display = 'none';
    if(document.getElementById('ajax-cart').style.display != 'block') 
    display='block';

  document.getElementById('ajax-cart').style.display=display;

}

  }

  $('select').formSelect();
});

 
const calcbtns = Array.from(document.getElementsByClassName('calc-price'));



calcbtns.forEach(function (elem) {
  elem.addEventListener('click', function () {


    let size_id = elem.dataset.size;
    let id = elem.dataset.id;
    let quantity = document.getElementById('quantity').value;


    
    update_price(id, size_id, quantity);
  })

})
try{

document.getElementsByClassName('.default').click();
}catch(e){}

function update_price(id, size_id, quantity) {
  const xhr = new XMLHttpRequest;

  xhr.onload = function () {

    let result = JSON.parse(xhr.responseText);

    let size_id = result['size_id'];
    let id = result['id'];

    let btns = document.getElementsByClassName('calc-price');
    for (let i = 0; i < btns.length; i++) {
      let btn = btns[i];
      btn.classList.add('grey');
    }

    let selectedbtn = document.querySelector('[data-size="' + size_id + '"]');

    selectedbtn.classList.remove('grey');

    document.getElementById('product_display_price').innerHTML = result['price']

    product_to_cart = {
      size_id: size_id,
      id: id,
      quantity:quantity
    }

  }

  let fd = new FormData;
  fd.append('id', id)
  fd.append('size_id', size_id)

  xhr.open('POST', public_path + 'ajax.php?operation=select_size', true);
  
  xhr.send(fd);
}

function toCart(obj) {
  const xhr = new XMLHttpRequest;

  xhr.onload = function () {

    readCart()

    document.getElementById('ajax-cart').style.display = 'block';

  }

  let fd = new FormData;
  fd.append('id', obj.id)
  fd.append('size_id', obj.size_id)
  let quantity = 0;
  if (document.getElementById('quantity') === null)
  quantity = obj.quantity;
  else
  quantity = document.getElementById('quantity').value;

  fd.append('quantity', quantity)

  xhr.open('POST', public_path + 'ajax.php?operation=add_to_cart', true);
  xhr.send(fd);
}




function readCart(obj) {
 
const xhr = new XMLHttpRequest;
 
xhr.open('POST', public_path + 'ajax.php?operation=read_cart', true);

xhr.send();
 
  xhr.onload = function () {
    
    let cartobj = JSON.parse(xhr.responseText)

    let resultstring = '';

    for( let key in cartobj['items'] ){

    let row = cartobj['items'][key];

    console.log(row);

     resultstring += `<li class="ajax-cart-content">
          <div class="-small-image" style="
            background:url(${public_path }/images/products/${row['image'] }); ">
          </div> 
           ${row['name']}
          <br/>                                       
          <small>${row['size_name']} <b>${row['formatted_price']}</b> ${row['quantity']} db, ${row['formatted_total']}</small>
          

        </li> 

        `;

      }

        resultstring += `
         <p class="ajax-cart-price">${cartobj['formatted_fulltotal']}</p>
         <a class="btn waves-effect waves-light" href="${public_path }shopping-cart" >Pénztár</a>
        `


        if(parseInt(cartobj['fulltotal']) === 0){
          
          resultstring = `<p class="ajax-cart-content noborder mt-0">Az ön kosara üres!</p>`;
        }

    let cart = document.getElementById('ajax-cart');
    cart.innerHTML = resultstring;



  }

}

function priceformat_html(inp)
{ 

var CurrencyFormatter = new Intl.NumberFormat('hu-HU', {
    style: 'currency',
    currency: 'HUF',
    maximumFractionDigits: 0
  });  
  return CurrencyFormatter.format(inp)
}     



