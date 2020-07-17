function loadCartCount() {
	let count=sessionStorage.getItem('cartCount');	
	// if count is present then load it on UI	
	if(count){
		document.getElementById("cart-count").textContent=count;;
	}
}

loadCartCount();

