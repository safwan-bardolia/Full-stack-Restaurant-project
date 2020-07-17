function logout() {
	let btn = document.getElementById("logout");
	btn.addEventListener('click',()=> {
		sessionStorage.clear();
	})
}

logout();