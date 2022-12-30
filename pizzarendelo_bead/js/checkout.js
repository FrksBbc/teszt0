let my_array = ['zip', 'city', 'street', 'nr'];

document.getElementById('copy-shipping-billing').onclick = function () {

    

    if (this.checked) {

        copyShipping2Billing(my_array);

    } else {
        
        document.getElementById('billing_name').value = '';
        my_array.map((item) => {
            document.getElementById('billing_' + item).value = '';
        })
    }
}

function copyShipping2Billing(my_array) {

    if( !document.getElementById('copy-shipping-billing').checked) return;

    document.getElementById('billing_name').focus();
    document.getElementById('billing_name').value = document.getElementById
        ('first_name').value + ' ' + document.getElementById('last_name').value





    my_array.map((item) => {
        
        document.getElementById('billing_' + item).focus();
        document.getElementById('billing_' + item).value = document.
            getElementById('shipping_' + item).value;
    })
}

let copyfrom = document.getElementsByClassName('copyfrom')

for(let i = 0; i < copyfrom.length; i++){
    
    copyfrom[i].onblur=function (){
    
        copyShipping2Billing (my_array);
    }
}



document.getElementById('verify-checkout').onclick=function(e){
    
    let inputs = document.querySelectorAll('.checkout-data');

let my_array=[];
 
    inputs.forEach((item) => {
        
        my_array.push( [item.getAttribute('id'), item.value] );
     })
    
    fetch(public_path + "ajax.php?operation=verify-checkout", {
        method: 'POST',
        headers:{
            'Content-Type':'application/json'
        },
        
        body: JSON.stringify( my_array )

    }).then(res=>res.json()).then(res=>{


        Array.from (document.getElementsByClassName('errormessage')).forEach(item=>{
            
            item.innerText='';
        })
            
        
        if(typeof res.success === 'undefined'){

       
        for(let key in res){
            
            if( typeof(res[key]) !=='undefined')
            if(res[key].length > 0){
                
                document.getElementsByClassName(key)[0].innerText = res[key];
            }
        }
     } else {
         
         window.location = public_path +'order-completed'
     }

    })
    
    e.preventDefault();
}

document.getElementById('delivery-method').onchange = function(){
    
    const that = this;
    
    fetch(public_path + "ajax.php?operation=calculate-shipping", {
        method:'post',
        
        body: that.value
    })
    .then(res=>{
        
        return res.json();
    }).then(res=>{
        
        document.getElementById('shipping-price-display').innerText=priceformat_html(res['price']);
        
        document.getElementById('full-price-display').innerText = priceformat_html(res['full_price']);

        

            document.querySelectorAll('.hideable').forEach(item=>{
                if( that.value.length>0 ){
                    
                    item.style.display = 'inline-block'
                }
                
                else{
                    item.style.display='none'
                }
            })
        
    })

}
