window.addEventListener('load', function(){
   const inputPrice = document.getElementById("item-price");
   const taxPrice = document.getElementById("add-tax-price")
   const profit = document.getElementById("profit")

   inputPrice.addEventListener("input", function(){
    itemPrice = inputPrice.value;
    taxPrice.innerHTML = Math.floor(itemPrice * 0.1).toLocaleString();
    profit.innerHTML = Math.floor(itemPrice * 0.9).toLocaleString();
  })

})