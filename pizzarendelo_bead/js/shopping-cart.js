
let shopping_cart_container = document.querySelector('#cart-page-content');

async function getCartData() {

    let result = await fetch(public_path + 'ajax.php?operation=read_cart');

    return result;
}


function fillCartContent() {

    getCartData().then(result => result.json()).then(result => {

        console.log(result);


        shopping_cart_container.innerHTML = result.items.map((item, index) => `
    
                <div class="row text-block cart">
                <div class="col s1">
                    <div class="img-holder"
                    style="background-image: url(${public_path}images/products/${item.image} )"></div>
                </div>
                <div class="col s4">
                ${item.name}
                <br>
                ${item.size_name}
                </div>
                <div class="col s1">
                    <input type="text" value="${item.quantity}"  class="qtty" data-id="${item.id}" data-sizeid="${item.size_id}">
                </div>

                <div class="col s2 delete">
                <a class="btn-floating btn-small waves-effect waves-light red delete-btn" data-id="${item.id}" data-sizeid="${item.size_id}" ><i class="material-icons">delete</i></a>
                </div>

                <div class="col s2 price">
                  ${item.formatted_price}
                </div>
                <div class="col s2 price">
                ${item.formatted_total}
                </div>

            </div>
    
    ` )


        shopping_cart_container.innerHTML += `
    <div class="row text-block cart total">
   
    <div class="col s12 text-right" style="height:auto;">
        A kosárban lévő termékek értéke: <span>${result.formatted_fulltotal}</span>
        <br />
        <a class="waves-effect waves-light btn" href="javascript:history.back(-1)"><i class="material-icons left">add_shopping_cart</i> vásárlás folytatása</a>
    
        <a class="waves-effect waves-light btn" href="${public_path}checkout" style="${result.fulltotal > 0 ? '' : 'display:none'}"><i class="material-icons right"   >attach_money</i>Tovább a pénztárhoz</a> 

        </div>
            
        </div>   
    `;








        let delete_btns = document.querySelectorAll('.delete-btn');

        delete_btns.forEach(function (btn) {
            btn.onclick = function () {
                remove_from_cart(btn.dataset.id, btn.dataset.sizeid)
            }
        })


        let numberinputs = document.getElementsByClassName('qtty');


        for (let i = 0; i < numberinputs.length; i++) {
            let numberinput = numberinputs[i]
            
            numberinput.onkeyup = function () {
                fetch(public_path + 'ajax.php?operation=change_quantity', {
                    method: 'POST',
                    headers: {
                        'Content-Type': 'application/json'
                    },
                    body: JSON.stringify({ id: numberinput.dataset.id, size_id: numberinput.dataset.sizeid, quantity: numberinput.value })
                }).then(res => res.json()).then(res => {
                    
                    fillCartContent();
                })
            }
        }

    })

}


fillCartContent();

async function remove_from_cart(id, size_id) {

    fetch(public_path + 'ajax.php?operation=remove_from_cart', {
        method: 'POST',
        headers: {
            'Content-Type': 'application/json'
        },
        body: JSON.stringify({ id: id, size_id: size_id })
    }
    ).then(result => {
         
        fillCartContent()
    })
}


