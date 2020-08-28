window.addEventListener('load', function(){
  const ItemPrice = document.getElementById("item-price")
  const AddTaxPrice = document.getElementById("add-tax-price")
  const Profit = document.getElementById("profit")
     
  function priceCalc() {
    item_price = ItemPrice.value
    add_tax_price = parseInt(item_price) / 10
    profit = parseInt(item_price) - parseInt(add_tax_price)

    AddTaxPrice.innerHTML = add_tax_price
    Profit.innerHTML = profit;
  }
  if(document.getElementById("item-price") != null){

    priceCalc();
  
    ItemPrice.addEventListener('input', function(){ 
      priceCalc();
     })
  }
})