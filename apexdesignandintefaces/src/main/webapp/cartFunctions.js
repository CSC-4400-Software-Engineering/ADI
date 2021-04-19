let carts = document.querySelectorAll('.add-cart'); //items MUST have this tag when we create product pages


for (let i = 0; i < carts.length; i++) //go through all the products with "add to cart" button
{
    //once clicked...
    carts[i].addEventListener('click', () => {
        cartNumbers(products[i]);
        totalCost(products[i]);
    })
}

//function to stop the cart icon number from going back to 0 on reload page
function onLoadCartNumbers(){
    let productNumbers= localStorage.getItem('cartNumbers'); //this comes back as a string
    if(productNumbers){
        document.querySelector('.cart span').textContent = productNumbers; //update the cart icon's number
    }
}

function cartNumbers(product){
    let productNumbers= localStorage.getItem('cartNumbers'); //this comes back as a string
    productNumbers = parseInt(productNumbers); //change it to a number
    
    //if we have already added something to cart with local storage
    if( productNumbers ){
        localStorage.setItem('cartNumbers', productNumbers + 1);
        document.querySelector('.cart span').textContent = productNumbers + 1; //update the cart icon's number
    }
    //else if there isn't that item in the cart, set it to 1
    else{
        localStorage.setItem('cartNumbers', 1);
        document.querySelector('.cart span').textContent = 1; //update the cart icon's number
    }
    setItems(product);
}

function setItems(product){
    let cartItems = localStorage.getItem('productsInCart');
    cartItems = JSON.parse(cartItems);
    
    if (cartItems !== null){
        if (cartItems[product.tag] === undefined){
            cartItems = {
                        ...cartItems,
                        [product.tag]: product
            }
        }
        cartItems[product.tag].inCart += 1;
    }
    else{
        product.inCart = 1;
        cartItems = {
            [product.tag]: product
        };
    }
    localStorage.setItem("productsInCart", JSON.stringify
    (cartItems));
}

function totalCost(product){
    let cartCost = localStorage.getItem('totalCost');
   
    
    if (cartCost !== null){
        cartCost = parseInt(cartCost);
        localStorage.setItem("totalCost", cartCost + product.price);
    } else{
        localStorage.setItem("totalCost", product.price);
    }
    
    
}

function displayCart() {
    let cartItems = localStorage.getItem("productsInCart");
    let cartCost = localStorage.getItem('totalCost');
    cartItems = JSON.parse(cartItems);
    let productContainer = document.querySelector(".products");
    
    
    if (cartItems && productContainer){
        productContainer.innerHTML = '';
        Object.values(cartItems).map(item => 
        { //This needs improvements
            productContainer.innerHTML += `
            <div class="product">
                <!--<ion-icon name="close-circle"></ion-icon>-->
                
                <span>${item.name}</span>
            </div>
            <div class="price">$${item.price}.00</div>
            <div class="quantity">
                <!--<ion-icon class="decrease" name="arrow-back-circle-outline"></ion-icon>-->
                <span>${item.inCart}</span>
                <!--<ion-icon class="increase" name="arrow-forward-circle-outline"></ion-icon>-->
            </div>
            <div class="total">
                $${item.inCart * item.price}.00
            </div>
            `;
            
        });
        
        productContainer.innerHTML += `
        <div class="basketTotalContainer">
            <h4 class="basketTotalTitle">
                Basket Total &nbsp;
            </h4>
            <h4 class="basketTotal">
                $${cartCost}.00
            </h4>
`;
    }

}

onLoadCartNumbers();
displayCart();