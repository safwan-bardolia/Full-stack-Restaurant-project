//*************************************************************************
//to load js inside js
var scripts = ["https://cdn.jsdelivr.net/npm/lodash@4.17.11/lodash.min.js", "https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js","https://cdnjs.cloudflare.com/ajax/libs/semantic-ui/2.4.1/semantic.min.js"];

for (index = 0; index < scripts.length; ++index) {
    var script = document.createElement('script');
    script.src = scripts[index];
    script.type='text/javascript';
    var done = false;
    script.onload = script.onreadystatechange = function() {
        if (!done && (!this.readyState || this.readyState == "loaded" || this.readyState == "complete")) {
            done = true;
            //promptForUserEntries();
        }
    };  
    document.getElementsByTagName("head")[0].appendChild(script);
}

//*************************************************************************

//      another way of loading js
//		var script = document.createElement('script'); 
//		script.src = "https://cdn.jsdelivr.net/npm/lodash@4.17.11/lodash.min.js";
//		document.head.appendChild(script);


		// get all add-to-cart anchor tag in 'cart' array
		let cart = document.querySelectorAll(".add-cart");

		// cart item array
		let products = [
			{
				name:"item1",
				tag:"breakfast-1",  		//to grap the images
				price:10,
				inCart: 0,		//how many time this product is in cart
			},
			{
				name:"item2",
				tag:"breakfast-2",  
				price:20,
				inCart: 0,	
			},
			{
				name:"item3",
				tag:"breakfast-3",  
				price:30,
				inCart: 0,	
			},
			{
				name:"item4",
				tag:"breakfast-4",  
				price:40,
				inCart: 0,	
			},
			{
				name:"item5",
				tag:"breakfast-5",  
				price:50,
				inCart: 0,	
			},
			{
				name:"item6",
				tag:"breakfast-6",  
				price:60,
				inCart: 0,	
			}
		]


		// when any anchor tag(ant add-to-cart button) clicks we want to do something
		for(let i=0;i<cart.length;i++) {								//it is important to use let keyword
			// anyone link is clicked then
			cart[i].addEventListener('click', () => {
				// we pass corresponding cart item object
				cartCount(products[i]);									//cartCount() ==> cartNumbers()

				// we pass corresponding cart item to totalCosts()	
				totalCost(products[i]);
			})
		}

		function cartCount(product) {
			
			// get the count from local-storage
			let count = sessionStorage.getItem('cartCount');		//count  ==> productNumbers
			// converting it into int
			count=parseInt(count);

			// when count is already present in localstorage
			if(count) {
				// update count to local-storage
				sessionStorage.setItem('cartCount', count+1);
				document.getElementById('cart-count').textContent = count+1;
			}else{
				// when app load for the 1st time
				sessionStorage.setItem('cartCount', 1);
				document.getElementById('cart-count').textContent = 1;
			}

			// for storing item in local storage
			setItems(product);
		}

		function setItems(product){
			
			//first fetch the cartItems from local storage
			let cartItems = sessionStorage.getItem("productsInCart");
			cartItems = JSON.parse(cartItems);
			console.log(cartItems);

			// means some product is present in cart (cartItems)
			if(cartItems != null) {

				// check current product is present in cart (cartItems)
				if(cartItems[product.tag] == undefined) {
					// if it is not present then, add product to existing cart
					cartItems = {...cartItems, [product.tag]:product}
				}

				// then update inCart count
				cartItems[product.tag].inCart += 1;

			} else {
				// when first time product is added to cart
				product.inCart = 1;

				cartItems = {
					// set product.tag as key
					[product.tag] : product
				}	
			}

			sessionStorage.setItem("productsInCart", JSON.stringify(cartItems));
		}

		// it is called with every add-to-cart button
		function totalCost(product) {
			let totalCost = sessionStorage.getItem('totalCost');
			
			//another item added to the cart 
			if(totalCost != null) {
				totalCost = parseInt(totalCost);
				sessionStorage.setItem('totalCost', totalCost + product.price);
			} else {
				//when first item is added to the cart
				sessionStorage.setItem('totalCost', product.price);
			}
		}

		// when we refresh the page then count is still present in local-storage, so we initialize UI
		function onLoadCartCount() {
			let count = sessionStorage.getItem('cartCount');

			//if it is present then 
			if(count){
				document.getElementById('cart-count').textContent = count;
			}
		}

		// for displaying cart 
		function displayCart() {
			// fetch the cartItems from local-storage if present
			let cartItems = sessionStorage.getItem('productsInCart');
			cartItems = JSON.parse(cartItems);
			// check if products-container class is present in given page  (because we load this js file in both the 'cart' jsp file)
			let productContainer = document.querySelector('.products');
			let container = document.querySelector('.products-container');
			let form = document.getElementById('cart-form');
			let totalCost = sessionStorage.getItem('totalCost');
			
			//for database
			let count = sessionStorage.getItem('cartCount');
			

			// this function is run when we are on order-cart.jsp
			if(productContainer) {						//means we are on order-cart.jsp
				if(cartItems) { 						//some item is present in local-storage	
					// initially it is empty when we load the page (even if something is present in local-storage)
//					productContainer.innerHTML = '';
	
					// then we loop throgh all local-storage element
					// converting object into an array for using map function
					Object.values(cartItems).map(item => {
						productContainer.innerHTML += `
							<div class="product" id="${item.tag}">
								<span class="glyphicon glyphicon-remove"></span>
								<img src = "../images/${item.tag}.jpg">
								<span class="item">${item.name}</span>
							</div>
							<div class="price">${item.price}</div>
							<div class="quantity">
								<span class="glyphicon glyphicon-minus-sign"></span>
								<span class="product_Count">${item.inCart}</span>
								<span class="glyphicon glyphicon-plus-sign"></span>
							</div>
							<div class="total">
								$${item.inCart * item.price}.00
							</div>
						`;
					});
					productContainer.innerHTML += `
						<div class="basketTotalContainer">
							<h4 class="basketTotalTitle">
								Basket Total
							</h4>
							<h4 class="basketTotal">
								${totalCost}
							</h4>	
						</div>
					`;
					form.innerHTML += `					
							<input type="button" value="Place order" class="btn btn-success submit-order" />	
					`;
					
				}else {										//local-storage is empty
					container.innerHTML = `
						<figure>
							<img src="https://d3tjqo2jh935k9.cloudfront.net/images/static/empty-bag.png" class="empty-bag"/>
							<figcaption style="text-align: center">
								<h3>your bag is empty</h3>
								start adding meals!
							</figcaption>
						<figure>				
					`
				}
			}	
		}
		

		function decrement() {
			let productContainer = document.querySelector('.products-container');

			if(productContainer) {
				let dec = document.querySelectorAll(".glyphicon-minus-sign");
				for(let i=0;i<dec.length;i++) {
					dec[i].addEventListener('click', (e)=> {
						let cartItems = sessionStorage.getItem('productsInCart');
						cartItems = JSON.parse(cartItems);
						
						// changing count of cart (at right top)
						let count = sessionStorage.getItem('cartCount');							
						count=parseInt(count);
						sessionStorage.setItem('cartCount',count-1);								
						document.getElementById('cart-count').textContent = count-1;
						
						// console.log(e.target.parentNode);
						
						// changing count of item on view (i.e - count +)
						let target = e.target.parentNode.querySelector('.product_Count');		
						let item_count=parseInt(target.textContent);
						console.log(item_count);
						target.textContent = item_count - 1;

						// get the id of current item
						let item_id = e.target.parentNode.previousElementSibling.previousElementSibling.id;		

						// change current item total
						let item_total = e.target.parentNode.nextElementSibling;
						console.log(item_total.innerHTML);
						console.log(cartItems[item_id].price);
						item_total.innerHTML = `$${(item_count-1) * cartItems[item_id].price}.00`;
				
						// change the inCart count in local storage
						console.log(cartItems[item_id]);
						cartItems[item_id].inCart -= 1 ;														
						sessionStorage.setItem("productsInCart", JSON.stringify(cartItems));						// update the local-storage

						// update total cost in local-storage
						let totalCost = sessionStorage.getItem('totalCost');
						totalCost = parseInt(totalCost);
						sessionStorage.setItem('totalCost', totalCost - cartItems[item_id].price);

						//update total-cost on UI
						let actualTotal = document.getElementsByClassName("basketTotal")[0];
						actualTotal.innerHTML = totalCost - cartItems[item_id].price;

						//remove cart-item from UI & local-storage when count is 0
						if(cartItems[item_id].inCart==0) {
							//remove cartItem from local-storage 
							cartItems = _.omit(cartItems, item_id);
							sessionStorage.setItem('productsInCart', JSON.stringify(cartItems));

							//remove current-item from UI
							e.target.parentNode.previousElementSibling.previousElementSibling.remove();
							e.target.parentNode.previousElementSibling.remove();
							e.target.parentNode.nextElementSibling.remove();
							e.target.parentNode.remove();

							//check if cartItems is empty or not
							clear();							
						}

					})
				}
			}
		}


		function increment() {
			let productContainer = document.querySelector('.products-container');

			if(productContainer) {
				let incr = document.querySelectorAll(".glyphicon-plus-sign");
				for(let i=0;i<incr.length;i++) {
					incr[i].addEventListener('click', (e)=> {
						let cartItems = sessionStorage.getItem('productsInCart');
						cartItems = JSON.parse(cartItems);
						
						// changing count of cart (at right top)
						let count = sessionStorage.getItem('cartCount');							
						count=parseInt(count);
						sessionStorage.setItem('cartCount',count+1);								
						document.getElementById('cart-count').textContent = count+1;
						
						// console.log(e.target.parentNode);
						
						// changing count of item on view (i.e - count +)
						let target = e.target.parentNode.querySelector('.product_Count');		
						let item_count=parseInt(target.textContent);
						console.log(item_count);
						target.textContent = item_count + 1;

						// get the id of current item
						let item_id = e.target.parentNode.previousElementSibling.previousElementSibling.id;		

						// change current item total
						let item_total = e.target.parentNode.nextElementSibling;
						console.log(item_total.innerHTML);
						console.log(cartItems[item_id].price);
						item_total.innerHTML = `$${(item_count+1) * cartItems[item_id].price}.00`;
				
						// change the inCart count in local storage
						cartItems[item_id].inCart += 1 ;														
						sessionStorage.setItem("productsInCart", JSON.stringify(cartItems));						// update the local-storage

						// update total cost in local-storage
						let totalCost = sessionStorage.getItem('totalCost');
						totalCost = parseInt(totalCost);
						sessionStorage.setItem('totalCost', totalCost + cartItems[item_id].price);

						//update total-cost on UI
						let actualTotal = document.getElementsByClassName("basketTotal")[0];
						actualTotal.innerHTML = totalCost + cartItems[item_id].price;
					})
				}
			}
		}


		function removeItem() {
			let productContainer = document.querySelector('.products-container');

			if(productContainer) {
				let removes = document.querySelectorAll(".glyphicon-remove");
				console.log(removes);
				for(let i=0;i<removes.length;i++) {
					removes[i].addEventListener('click', (e)=> {
						let cartItems = sessionStorage.getItem('productsInCart');
						cartItems = JSON.parse(cartItems);
						
						//update cartCount in local-storage
						let count = sessionStorage.getItem('cartCount');			// fetch count from local-storage
						count = parseInt(count);
						let item_count = e.target.parentNode.nextElementSibling.nextElementSibling.querySelector('.product_Count').textContent;	//get item-count from UI
						item_count = parseInt(item_count);
						sessionStorage.setItem('cartCount', count- item_count);

						//update cartCount on UI (at right-top)
						document.getElementById("cart-count").textContent = count - item_count;

						//update total-cost on local-storage
						let totalCost = sessionStorage.getItem('totalCost');
						totalCost = parseInt(totalCost);
						let item_total = e.target.parentNode.nextElementSibling.nextElementSibling.nextElementSibling.textContent;
						let dollarIndex = item_total.indexOf('$');
						let dotIndex = item_total.indexOf('.');							//because it is different in case of 2 digit & 3 digit number
						item_total = item_total.slice(dollarIndex+1 ,dotIndex);			//extracting only number part
						item_total = parseInt(item_total);

						let finalTotal = totalCost - item_total;	
						sessionStorage.setItem('totalCost', finalTotal);			//update local-storage


						//update total-cost on UI
						let actualTotal = document.getElementsByClassName("basketTotal")[0];
						actualTotal.innerHTML = finalTotal;


						//remove current item from local-storage
						let item_id = e.target.parentNode.id;
						cartItems = _.omit(cartItems, item_id);									//lodash library
						sessionStorage.setItem('productsInCart',JSON.stringify(cartItems));

						// remove current-item from UI
						e.target.parentNode.nextElementSibling.nextElementSibling.nextElementSibling.remove();
						e.target.parentNode.nextElementSibling.nextElementSibling.remove();
						e.target.parentNode.nextElementSibling.remove();
						e.target.parentNode.remove();

						//check if cartItems is empty or not
						clear();
					})
				}
			}
		}

		function clear() {
			cartItems=sessionStorage.getItem('productsInCart');
			if(cartItems=='{}'){
				sessionStorage.clear();

				//for showing empty bag
				displayCart();
			}
		}
		
		function orderSubmit() {
			let productContainer = document.querySelector('.products');
			
			//if we are on order-cart page
			if(productContainer) {
				let btn = document.querySelector(".submit-order");
				btn.addEventListener('click',()=>{

					btn.remove();
					
					let form = document.getElementById('cart-form');
					let cartItems = sessionStorage.getItem('productsInCart');
					let totalCost = sessionStorage.getItem('totalCost');
					totalCost = parseInt(totalCost);
					let count = sessionStorage.getItem('cartCount');		
					count=parseInt(count);

					// change form: value here				
					let totalCostInput = document.getElementById("totalCostInput");
					totalCostInput.value = totalCost;
					let cartCountInput = document.getElementById("cartCountInput");
					cartCountInput.value = count;
					let cartItemsInput = document.getElementById("cartItemsInput");
					cartItemsInput.value = cartItems;
					
					//unhide the form input
					document.getElementById("phoneInput").style.visibility="visible";
					document.getElementById("addressInput").style.visibility="visible";
					
					form.innerHTML += `
						<div class="ui red basic inverted button" id="cancel">
							<i class="remove icon"></i>
							cancel
						</div>		
						<input type="submit" value="confirm order" class="ui green basic inverted button" />
					`;
					
					//call here because it has access to cancel button after this
					reloadOnCancel();
				})
				
			}
		}
		
		
		//while submitting form if error is present then show them on modal
		function loadModalOnError() {
			if(document.getElementById("phone.errors")!=null || document.getElementById("address.errors")!=null) {

				//unhide the form input
				document.getElementById("phoneInput").style.visibility="visible";
				document.getElementById("addressInput").style.visibility="visible";

				$(window).on('load',function(){						
						$('#cart-form').modal({
							closable:false,
						}).modal('show');
				})
			}
		}
		
		//hide modal & reload page on click of cancel button
		function reloadOnCancel() {
			let btn = document.getElementById("cancel");
			console.log(btn);
			btn.addEventListener('click',()=>{
				$("#cart-form").modal('hide');
				console.log("cancel");
				//
//				document.getElementById("phone.errors").remove();
//				document.getElementById("address.errors").remove();
			
				//instead of reloading a page we are redirecting to the page (because when we reload a page form is resubmitted automatically)
				window.location.href="cart";
			})
		}
		
		// auto call when we load the page
		displayCart();

		
		//call above function every time when we refresh the page
		onLoadCartCount();
		
		//handle all the task when we decrement item count ( - 'count' + )
		decrement();
		
		increment();
		
		// handel all the task when user click on 'X' sign
		removeItem();
		
		orderSubmit();
		
		loadModalOnError();
		
		
		
		

		//on clicking "<input type="button" value="Place order" class="btn btn-success submit-order" />" this button
		//show "form" as a modal
		$('.submit-order').click(function(){
			$('#cart-form').modal({
				closable:false,
			}).modal('show');
		})
		